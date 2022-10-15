package com.delet_dis.moviescatalog.domain.useCases.preferencesDataStore

import androidx.datastore.preferences.core.stringPreferencesKey
import com.delet_dis.moviescatalog.domain.repositories.PreferencesDataStoreRepository

class GetUserTokenUseCase(
    private val preferencesDataStoreRepository: PreferencesDataStoreRepository
) {
    suspend fun execute() {
        preferencesDataStoreRepository.getPreference(
            stringPreferencesKey(USER_TOKEN),
            ""
        )
    }

    private companion object {
        private const val USER_TOKEN = "userToken"
    }
}