package com.delet_dis.moviescatalog.presentation.activity

import android.os.Bundle
import androidx.activity.compose.setContent
import androidx.appcompat.app.AppCompatActivity
import com.delet_dis.moviescatalog.presentation.activity.authorizationActivity.subviews.loginView.LoginView
import dagger.hilt.android.AndroidEntryPoint

@AndroidEntryPoint
class HiltPreviewActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            LoginView()
        }
    }
}
