//
//  TextModifiers.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 15.10.2022.
//
import Foundation
import SwiftUI

struct H1Modifier: ViewModifier {
    private let uiFont = R.font.ibmPlexSansBold(size: 24) ?? .systemFont(ofSize: 24)

    func body(content: Content) -> some View {
        content
            .font(Font(uiFont))
            .lineSpacing(32 - uiFont.lineHeight)
            .padding(.vertical, (32 - uiFont.lineHeight) / 2)
    }
}

struct BodyModifier: ViewModifier {
    private let uiFont = R.font.ibmPlexSansMedium(size: 16) ?? .systemFont(ofSize: 16)

    func body(content: Content) -> some View {
        content
            .font(Font(uiFont))
            .lineSpacing(20 - uiFont.lineHeight)
            .padding(.vertical, (20 - uiFont.lineHeight) / 2)
    }
}

struct BodySmallModifier: ViewModifier {
    private let uiFont = R.font.ibmPlexSansRegular(size: 14) ?? .systemFont(ofSize: 14)

    func body(content: Content) -> some View {
        content
            .font(Font(uiFont))
            .lineSpacing(18 - uiFont.lineHeight)
            .padding(.vertical, (18 - uiFont.lineHeight) / 2)
    }
}

struct H2Modifier: ViewModifier {
    private let uiFont = R.font.ibmPlexSansBold(size: 20) ?? .systemFont(ofSize: 20)

    func body(content: Content) -> some View {
        content
            .font(Font(uiFont))
            .lineSpacing(24 - uiFont.lineHeight)
            .padding(.vertical, (24 - uiFont.lineHeight) / 2)
    }
}

struct FootnoteModifier: ViewModifier {
    private let uiFont = R.font.ibmPlexSansMedium(size: 14) ?? .systemFont(ofSize: 14)

    func body(content: Content) -> some View {
        content
            .font(Font(uiFont))
            .lineSpacing(16 - uiFont.lineHeight)
            .padding(.vertical, (16 - uiFont.lineHeight) / 2)
    }
}

struct TitleModifier: ViewModifier {
    private let uiFont = R.font.ibmPlexSansBold(size: 36) ?? .systemFont(ofSize: 36)

    func body(content: Content) -> some View {
        content
            .font(Font(uiFont))
            .lineSpacing(40 - uiFont.lineHeight)
            .padding(.vertical, (40 - uiFont.lineHeight) / 2)
    }
}

struct MontserratModifier: ViewModifier {
    private let uiFont = R.font.montserratMedium(size: 12) ?? .systemFont(ofSize: 12)

    func body(content: Content) -> some View {
        content
            .font(Font(uiFont))
    }
}

struct PlexSansSmallModifier: ViewModifier {
    private let uiFont = R.font.ibmPlexSansRegular(size: 12) ?? .systemFont(ofSize: 12)

    func body(content: Content) -> some View {
        content
            .font(Font(uiFont))
            .lineSpacing(14 - uiFont.lineHeight)
            .padding(.vertical, (14 - uiFont.lineHeight) / 2)
    }
}
