package com.delet_dis.moviescatalog.data.implementations

import android.content.Context
import androidx.datastore.preferences.core.PreferenceDataStoreFactory
import androidx.datastore.preferences.core.Preferences
import androidx.datastore.preferences.core.edit
import androidx.datastore.preferences.core.emptyPreferences
import androidx.datastore.preferences.preferencesDataStoreFile
import com.delet_dis.moviescatalog.domain.repositories.PreferencesDataStoreRepository
import com.google.crypto.tink.Aead
import com.google.crypto.tink.KeyTemplates
import com.google.crypto.tink.integration.android.AndroidKeysetManager
import dagger.hilt.android.qualifiers.ApplicationContext
import io.github.osipxd.datastore.encrypted.createEncrypted
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.catch
import kotlinx.coroutines.flow.map
import java.io.IOException
import javax.inject.Inject
import javax.inject.Singleton

@Singleton
class PreferencesDataStoreRepositoryImpl
@Inject constructor(@ApplicationContext private val context: Context) :
    PreferencesDataStoreRepository {
    private val aead = AndroidKeysetManager.Builder()
        .withSharedPref(context, KEYSET_NAME, PREFERENCE_FILE_NAME)
        .withKeyTemplate(KeyTemplates.get(KEY_TEMPLATE_NAME))
        .withMasterKeyUri(MASTER_KEY_URI)
        .build()
        .keysetHandle
        .getPrimitive(Aead::class.java)

    private val dataStore = PreferenceDataStoreFactory.createEncrypted(aead) {
        context.preferencesDataStoreFile(SETTINGS_NAME)
    }

    override suspend fun <T> getPreference(key: Preferences.Key<T>, defaultValue: T): Flow<T> =
        dataStore.data.catch { exception ->
            if (exception is IOException) {
                emit(emptyPreferences())
            } else {
                throw exception
            }
        }.map { preferences ->
            val result = preferences[key] ?: defaultValue
            result
        }

    override suspend fun <T> putPreference(key: Preferences.Key<T>, value: T) {
        dataStore.edit {
            it[key] = value
        }
    }

    override suspend fun <T> removePreference(key: Preferences.Key<T>) {
        dataStore.edit {
            it.remove(key)
        }
    }

    override suspend fun clearAllPreference() {
        dataStore.edit {
            it.clear()
        }
    }


    private companion object {
        private const val KEYSET_NAME = "master_keyset"
        private const val PREFERENCE_FILE_NAME = "master_key_preference"
        private const val KEY_TEMPLATE_NAME = "AES256_GCM"
        private const val MASTER_KEY_URI = "android-keystore://master_key"

        private const val SETTINGS_NAME = "appSettings"
    }
}