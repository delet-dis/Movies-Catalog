package com.delet_dis.moviescatalog.data.modules

import com.delet_dis.moviescatalog.data.useCases.authService.AuthServiceUseCases
import com.delet_dis.moviescatalog.domain.services.networking.AuthService
import com.delet_dis.moviescatalog.domain.useCases.authService.LoginUseCase
import com.delet_dis.moviescatalog.domain.useCases.authService.LogoutUseCase
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.components.SingletonComponent
import retrofit2.Retrofit
import javax.inject.Singleton

@Module
@InstallIn(SingletonComponent::class)
abstract class AuthModule {
    companion object {
        @Singleton
        @Provides
        fun providesAuthService(retrofit: Retrofit): AuthService =
            retrofit.create(AuthService::class.java)

        @Provides
        @Singleton
        fun providesAuthServiceUseCases(
            authService: AuthService
        ): AuthServiceUseCases =
            AuthServiceUseCases(
                LoginUseCase(authService),
                LogoutUseCase(authService)
            )
    }
}