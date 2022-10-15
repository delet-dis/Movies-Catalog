package com.delet_dis.moviescatalog.domain.loginView

data class LoginState(
    val isUsernameIncorrect: Boolean = false,
    val isPasswordIncorrect: Boolean = false,
    val isLoginButtonActive: Boolean = false,
    val errorText: String? = null,
    val isLoading: Boolean = false
)
