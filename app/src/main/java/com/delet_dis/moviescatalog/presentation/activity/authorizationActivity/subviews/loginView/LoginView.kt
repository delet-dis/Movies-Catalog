package com.delet_dis.moviescatalog.presentation.activity.authorizationActivity.subviews.loginView

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.text.KeyboardOptions
import androidx.compose.material3.Button
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.OutlinedTextField
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.text.input.KeyboardType
import androidx.compose.ui.text.input.PasswordVisualTransformation
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import com.delet_dis.moviescatalog.R
import com.delet_dis.moviescatalog.resources.theme.OrangePrimary
import com.delet_dis.moviescatalog.resources.theme.Typography

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun LoginView(
    loginButtonClick: (String, String) -> Unit,
    registerButtonClick: () -> Unit,
    isLoginButtonEnabled: Boolean
) {
    var usernameText by remember { mutableStateOf("") }
    var passwordText by remember { mutableStateOf("") }

    Column {
        Column(
            verticalArrangement = Arrangement.spacedBy(10.dp)
        ) {
            OutlinedTextField(
                value = usernameText,
                keyboardOptions = KeyboardOptions(keyboardType = KeyboardType.Text),
                shape = RoundedCornerShape(8.dp),
                onValueChange = {
                    usernameText = it
                },
                placeholder = {
                    Text(stringResource(id = R.string.usernamePlaceholder))
                },
                singleLine = true,
                modifier = Modifier.fillMaxWidth()
            )

            OutlinedTextField(
                value = passwordText,
                keyboardOptions = KeyboardOptions(keyboardType = KeyboardType.Password),
                visualTransformation = PasswordVisualTransformation(),
                shape = RoundedCornerShape(8.dp),
                onValueChange = {
                    passwordText = it
                },
                placeholder = {
                    Text(stringResource(id = R.string.passwordPlaceholder))
                },
                singleLine = true,
                modifier = Modifier.fillMaxWidth()
            )
        }

//        Spacer(modifier = Modifier.fillMaxHeight())

        Column(
            verticalArrangement = Arrangement.spacedBy(8.dp),
            modifier = Modifier.fillMaxWidth()
        ) {
            Button(
                onClick = {
                    loginButtonClick(usernameText, passwordText)
                },
                enabled = isLoginButtonEnabled,
            ) {
                Text(
                    text = stringResource(id = R.string.loginButtonText),
                    textAlign = TextAlign.Center,
                    color = OrangePrimary,
                    modifier = Modifier.weight(1f),
                    style = Typography.bodySmall
                )
            }
        }
    }


}

@Preview(showBackground = true)
@Composable
fun LoginViewPreview() {
    LoginView(
        { _: String, _: String ->
        },
        {
            print("login")
        },
        false
    )
}