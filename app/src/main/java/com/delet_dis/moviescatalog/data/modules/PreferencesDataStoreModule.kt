package com.delet_dis.moviescatalog.data.modules

import com.delet_dis.moviescatalog.data.implementations.PreferencesDataStoreRepositoryImpl
import com.delet_dis.moviescatalog.data.models.preferencesDataStore.useCases.PreferencesDataStoreUseCases
import com.delet_dis.moviescatalog.domain.repositories.PreferencesDataStoreRepository
import com.delet_dis.moviescatalog.domain.useCases.preferencesDataStore.GetUserTokenUseCase
import com.delet_dis.moviescatalog.domain.useCases.preferencesDataStore.SetUserTokenUseCase
import dagger.Binds
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.components.SingletonComponent
import javax.inject.Singleton

@Module
@InstallIn(SingletonComponent::class)
abstract class PreferencesDataStoreModule {
    @Binds
    abstract fun bindSharedPreferencesDataStoreRepository(
        preferencesDataStoreRepository: PreferencesDataStoreRepositoryImpl
    ): PreferencesDataStoreRepository

    companion object {
        @Provides
        @Singleton
        fun providePreferencesDataStoreUseCases(
            preferencesDataStoreRepository: PreferencesDataStoreRepository
        ): PreferencesDataStoreUseCases =
            PreferencesDataStoreUseCases(
                GetUserTokenUseCase(preferencesDataStoreRepository),
                SetUserTokenUseCase(preferencesDataStoreRepository)
            )
    }
}