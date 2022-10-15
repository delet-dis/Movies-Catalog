package com.delet_dis.moviescatalog.domain.useCases.authService

import com.delet_dis.moviescatalog.data.models.networkingService.auth.LoginRequest
import com.delet_dis.moviescatalog.data.models.networkingService.auth.LoginResponse
import com.delet_dis.moviescatalog.domain.services.networking.AuthService
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response

class LoginUseCase(
    private val authService: AuthService
) {
    suspend fun execute(
        loginRequest: LoginRequest,
        completion: ((Result<LoginResponse>) -> Unit)?
    ) {
        authService.login(loginRequest).enqueue(object : Callback<LoginResponse> {
            override fun onResponse(call: Call<LoginResponse>, response: Response<LoginResponse>) {
                response.body()?.let {
                    completion?.invoke(Result.success(it))
                }
            }

            override fun onFailure(call: Call<LoginResponse>, t: Throwable) {
                completion?.invoke(Result.failure(t))
            }
        })
    }
}