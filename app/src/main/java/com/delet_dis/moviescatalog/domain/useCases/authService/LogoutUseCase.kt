package com.delet_dis.moviescatalog.domain.useCases.authService

import com.delet_dis.moviescatalog.data.models.networkingService.auth.LogoutResponse
import com.delet_dis.moviescatalog.domain.services.networking.AuthService
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response

class LogoutUseCase(
    private val authService: AuthService
) {
    suspend fun execute(
        completion: ((Result<LogoutResponse>) -> Unit)?
    ) {
        authService.logout().enqueue(object : Callback<LogoutResponse> {
            override fun onResponse(
                call: Call<LogoutResponse>,
                response: Response<LogoutResponse>
            ) {
                response.body()?.let {
                    completion?.invoke(Result.success(it))
                }
            }

            override fun onFailure(call: Call<LogoutResponse>, t: Throwable) {
                completion?.invoke(Result.failure(t))
            }
        })
    }
}