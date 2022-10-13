package com.delet_dis.moviescatalog.resources.theme

import androidx.compose.material3.Typography
import androidx.compose.ui.text.ExperimentalTextApi
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.font.FontFamily
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.googlefonts.Font
import androidx.compose.ui.text.googlefonts.GoogleFont
import androidx.compose.ui.unit.sp
import com.delet_dis.moviescatalog.R

@OptIn(ExperimentalTextApi::class)
private val googleFontProvider: GoogleFont.Provider by lazy {
    GoogleFont.Provider(
        providerAuthority = "com.google.android.gms.fonts",
        providerPackage = "com.google.android.gms",
        certificates = R.array.com_google_android_gms_fonts_certs
    )
}

@OptIn(ExperimentalTextApi::class)
private fun getGoogleFontFamily(
    name: String,
    provider: GoogleFont.Provider = googleFontProvider,
    weights: List<FontWeight>
): FontFamily {
    return FontFamily(
        weights.map {
            Font(GoogleFont(name), provider, it)
        }
    )
}

@OptIn(ExperimentalTextApi::class)
private val ibmPlexFontFamily = getGoogleFontFamily(
    name = "IBM Plex Sans",
    weights = listOf(
        FontWeight.Bold,
        FontWeight.Medium,
        FontWeight.Normal
    )
)

val Typography = Typography(
    // H1
    headlineLarge = TextStyle(
        fontFamily = ibmPlexFontFamily,
        fontWeight = FontWeight.Bold,
        fontSize = 24.sp,
        lineHeight = 32.sp
    ),

    // Body
    bodyMedium = TextStyle(
        fontFamily = ibmPlexFontFamily,
        fontWeight = FontWeight.Medium,
        fontSize = 16.sp,
        lineHeight = 20.sp
    ),

    // Body Small
    bodySmall = TextStyle(
        fontFamily = ibmPlexFontFamily,
        fontWeight = FontWeight.Normal,
        fontSize = 14.sp,
        lineHeight = 18.sp
    ),

    // H2
    headlineMedium = TextStyle(
        fontFamily = ibmPlexFontFamily,
        fontWeight = FontWeight.Bold,
        fontSize = 20.sp,
        lineHeight = 24.sp
    ),

    // Footnote
    labelMedium = TextStyle(
        fontFamily = ibmPlexFontFamily,
        fontWeight = FontWeight.Medium,
        fontSize = 14.sp,
        lineHeight = 16.sp
    ),

    // Title
    titleMedium = TextStyle(
        fontFamily = ibmPlexFontFamily,
        fontWeight = FontWeight.Bold,
        fontSize = 36.sp,
        lineHeight = 40.sp
    )
)