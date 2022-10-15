package com.delet_dis.moviescatalog.domain.useCases.preferencesDataStore

import androidx.datastore.preferences.core.stringPreferencesKey
import com.delet_dis.moviescatalog.domain.repositories.PreferencesDataStoreRepository

class SetUserTokenUseCase(
    private val preferencesDataStoreRepository: PreferencesDataStoreRepository
) {
    suspend fun execute(userToken: String) {
        preferencesDataStoreRepository.putPreference(stringPreferencesKey(USER_TOKEN), userToken)
    }

    private companion object {
        private const val USER_TOKEN = "userToken"
    }
}