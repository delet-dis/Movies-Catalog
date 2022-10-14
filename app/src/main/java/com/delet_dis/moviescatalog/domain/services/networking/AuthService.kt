package com.delet_dis.moviescatalog.domain.services.networking

import com.delet_dis.moviescatalog.data.models.networkingService.auth.LoginRequest
import com.delet_dis.moviescatalog.data.models.networkingService.auth.LoginResponse
import com.delet_dis.moviescatalog.data.models.networkingService.auth.LogoutResponse
import retrofit2.Call
import retrofit2.http.Body
import retrofit2.http.POST

interface AuthService {
    @POST("api/account/login")
    suspend fun login(@Body loginRequest: LoginRequest): Call<LoginResponse>

    @POST("api/account/logout")
    suspend fun logout(): Call<LogoutResponse>
}