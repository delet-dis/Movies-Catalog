package com.delet_dis.moviescatalog.domain.loginView

data class LoginState(
    val isLoginIncorrect: Boolean = false,
    val isPasswordIncorrect: Boolean = false,
    val errorText: String? = null,
    val isLoading: Boolean = false
)
