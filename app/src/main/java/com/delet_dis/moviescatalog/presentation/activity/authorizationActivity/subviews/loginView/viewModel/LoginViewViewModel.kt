package com.delet_dis.moviescatalog.presentation.activity.authorizationActivity.subviews.loginView.viewModel

import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.setValue
import androidx.lifecycle.ViewModel
import com.delet_dis.moviescatalog.data.models.preferencesDataStore.useCases.PreferencesDataStoreUseCases
import com.delet_dis.moviescatalog.domain.loginView.LoginState
import dagger.hilt.android.lifecycle.HiltViewModel
import javax.inject.Inject

@HiltViewModel
class LoginViewViewModel @Inject constructor(
    private val preferencesDataStoreUseCases: PreferencesDataStoreUseCases
) : ViewModel() {
    var state by mutableStateOf(LoginState())
        private set

    fun login(){

    }
}