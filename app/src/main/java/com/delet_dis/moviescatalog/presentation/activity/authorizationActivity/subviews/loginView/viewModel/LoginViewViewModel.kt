package com.delet_dis.moviescatalog.presentation.activity.authorizationActivity.subviews.loginView.viewModel

import android.app.Application
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.setValue
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.delet_dis.moviescatalog.R
import com.delet_dis.moviescatalog.data.models.networkingService.auth.LoginRequest
import com.delet_dis.moviescatalog.data.useCases.authService.AuthServiceUseCases
import com.delet_dis.moviescatalog.data.useCases.preferencesDataStore.PreferencesDataStoreUseCases
import com.delet_dis.moviescatalog.domain.helpers.AuthenticationDataValidationHelper
import com.delet_dis.moviescatalog.domain.loginView.LoginState
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class LoginViewViewModel @Inject constructor(
    private val authServiceUseCases: AuthServiceUseCases,
    private val preferencesDataStoreUseCases: PreferencesDataStoreUseCases,
    private val application: Application
) : ViewModel() {
    var state by mutableStateOf(LoginState())
        private set

    fun login(username: String, password: String) {
        viewModelScope.launch {
            state = state.copy(
                isLoading = true,
                errorText = null
            )

            if (areFieldsValid(username, password)) {
                authServiceUseCases.loginUseCase.execute(
                    LoginRequest(
                        username,
                        password
                    )
                ) { result ->
                    result.onSuccess {
                        viewModelScope.launch {
                            preferencesDataStoreUseCases.setUserTokenUseCase.execute(it.token)

                            state = state.copy(
                                isLoading = false,
                                errorText = null
                            )
                        }
                    }

                    result.onFailure {
                        state = state.copy(
                            isLoading = false,
                            errorText = it.localizedMessage
                        )
                    }
                }
            }
        }
    }

    private fun resetValidationState() =
        viewModelScope.launch {
            state = state.copy(
                errorText = null,
                isPasswordIncorrect = false,
                isUsernameIncorrect = false,
                isLoginButtonActive = true
            )
        }


    private fun areFieldsValid(username: String, password: String): Boolean {
        resetValidationState()

        if (!AuthenticationDataValidationHelper.isUsernameValid(username)) {
            viewModelScope.launch {
                state = state.copy(
                    errorText = application.applicationContext.getString(
                        R.string.usernameIsInvalid
                    ),
                    isUsernameIncorrect = true,
                    isLoginButtonActive = false
                )
            }

            return false
        }

        if (!AuthenticationDataValidationHelper.isPasswordValid(password)) {
            viewModelScope.launch {
                state = state.copy(
                    errorText = application.applicationContext.getString(
                        R.string.passwordIsInvalid
                    ),
                    isPasswordIncorrect = true,
                    isLoginButtonActive = false
                )
            }

            return false
        }

        return true
    }
}