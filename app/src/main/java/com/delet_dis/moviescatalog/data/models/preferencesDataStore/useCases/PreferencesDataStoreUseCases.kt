package com.delet_dis.moviescatalog.data.models.preferencesDataStore.useCases

import com.delet_dis.moviescatalog.domain.useCases.preferencesDataStore.GetUserTokenUseCase
import com.delet_dis.moviescatalog.domain.useCases.preferencesDataStore.SetUserTokenUseCase

data class PreferencesDataStoreUseCases(
    val getUserTokenUseCase: GetUserTokenUseCase,
    val setUserTokenUseCase: SetUserTokenUseCase
)
