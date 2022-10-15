package com.delet_dis.moviescatalog.presentation.activity.authorizationActivity.subviews.loginView.subviews

import androidx.compose.foundation.BorderStroke
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.PaddingValues
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.text.KeyboardOptions
import androidx.compose.material3.Button
import androidx.compose.material3.ButtonDefaults
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.OutlinedTextField
import androidx.compose.material3.Text
import androidx.compose.material3.TextFieldDefaults
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.text.input.KeyboardType
import androidx.compose.ui.text.input.PasswordVisualTransformation
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import com.delet_dis.moviescatalog.R
import com.delet_dis.moviescatalog.resources.theme.BlackDark
import com.delet_dis.moviescatalog.resources.theme.Gray
import com.delet_dis.moviescatalog.resources.theme.GrayFaded
import com.delet_dis.moviescatalog.resources.theme.OrangePrimary
import com.delet_dis.moviescatalog.resources.theme.Typography

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun LoginViewForm(
    loginButtonClick: (String, String) -> Unit,
    registerButtonClick: () -> Unit,
    isLoginButtonEnabled: Boolean
) {
    var usernameText by remember { mutableStateOf("") }
    var passwordText by remember { mutableStateOf("") }

    Column(modifier = Modifier.background(BlackDark)) {
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
                    Text(
                        stringResource(id = R.string.usernamePlaceholder),
                        style = Typography.bodySmall,
                        color = GrayFaded
                    )
                },
                colors = TextFieldDefaults.outlinedTextFieldColors(
                    focusedBorderColor = Gray,
                    unfocusedBorderColor = Gray,
                    cursorColor = GrayFaded,
                    textColor = GrayFaded
                ),
                textStyle = Typography.bodySmall,
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
                    Text(
                        stringResource(id = R.string.passwordPlaceholder),
                        style = Typography.bodySmall,
                        color = GrayFaded
                    )
                },
                colors = TextFieldDefaults.outlinedTextFieldColors(
                    focusedBorderColor = Gray,
                    unfocusedBorderColor = Gray,
                    cursorColor = GrayFaded,
                    textColor = GrayFaded
                ),
                textStyle = Typography.bodySmall,
                singleLine = true,
                modifier = Modifier.fillMaxWidth()
            )
        }

        Spacer(modifier = Modifier.weight(1f))

        Column(
            verticalArrangement = Arrangement.spacedBy(8.dp),
            modifier = Modifier
                .fillMaxWidth()
                .padding(bottom = 18.dp)
        ) {
            Button(
                onClick = {
                    loginButtonClick(usernameText, passwordText)
                },
                border = if (isLoginButtonEnabled) BorderStroke(
                    1.dp,
                    OrangePrimary
                ) else BorderStroke(1.dp, Gray),
                enabled = isLoginButtonEnabled,
                shape = RoundedCornerShape(4.dp),
                contentPadding = PaddingValues(0.dp),
                colors = ButtonDefaults.buttonColors(
                    containerColor = if (isLoginButtonEnabled) OrangePrimary else BlackDark,
                )
            ) {
                Text(
                    text = stringResource(id = R.string.loginButtonText),
                    textAlign = TextAlign.Center,
                    color = if (isLoginButtonEnabled) Color.White else OrangePrimary,
                    modifier = Modifier
                        .weight(1f)
                        .padding(vertical = 12.dp),
                    style = Typography.bodyMedium
                )
            }

            Button(
                onClick = { registerButtonClick() },
                shape = RoundedCornerShape(4.dp),
                contentPadding = PaddingValues(0.dp),
                colors = ButtonDefaults.buttonColors(
                    containerColor = BlackDark,
                )
            ) {
                Text(
                    text = stringResource(id = R.string.registerButtonText),
                    textAlign = TextAlign.Center,
                    color = OrangePrimary,
                    modifier = Modifier
                        .weight(1f)
                        .padding(vertical = 12.dp),
                    style = Typography.bodyMedium
                )
            }
        }
    }


}

@Preview(showBackground = true)
@Composable
fun LoginViewFormPreview() {
    LoginViewForm(
        { _: String, _: String ->
        },
        {
            print("login")
        },
        false
    )
}