package com.delet_dis.moviescatalog.data.useCases.authService

import com.delet_dis.moviescatalog.domain.useCases.authService.LoginUseCase
import com.delet_dis.moviescatalog.domain.useCases.authService.LogoutUseCase

data class AuthServiceUseCases(
    val loginUseCase: LoginUseCase,
    val logoutUseCase: LogoutUseCase
)
