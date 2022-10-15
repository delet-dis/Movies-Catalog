package com.delet_dis.moviescatalog.domain.helpers

class AuthenticationDataValidationHelper {
    companion object {
        fun isUsernameValid(username: String): Boolean =
            with(username) {
                return@with this.isNotEmpty()
            }

        fun isPasswordValid(password: String): Boolean =
            with(password) {
                return@with this.isNotEmpty()
            }
    }
}