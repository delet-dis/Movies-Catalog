//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap { Locale(identifier: $0) } ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)

  /// Find first language and bundle for which the table exists
  fileprivate static func localeBundle(tableName: String, preferredLanguages: [String]) -> (Foundation.Locale, Foundation.Bundle)? {
    // Filter preferredLanguages to localizations, use first locale
    var languages = preferredLanguages
      .map { Locale(identifier: $0) }
      .prefix(1)
      .flatMap { locale -> [String] in
        if hostingBundle.localizations.contains(locale.identifier) {
          if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
            return [locale.identifier, language]
          } else {
            return [locale.identifier]
          }
        } else if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
          return [language]
        } else {
          return []
        }
      }

    // If there's no languages, use development language as backstop
    if languages.isEmpty {
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages = [developmentLocalization]
      }
    } else {
      // Insert Base as second item (between locale identifier and languageCode)
      languages.insert("Base", at: 1)

      // Add development language as backstop
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages.append(developmentLocalization)
      }
    }

    // Find first language for which table exists
    // Note: key might not exist in chosen language (in that case, key will be shown)
    for language in languages {
      if let lproj = hostingBundle.url(forResource: language, withExtension: "lproj"),
         let lbundle = Bundle(url: lproj)
      {
        let strings = lbundle.url(forResource: tableName, withExtension: "strings")
        let stringsdict = lbundle.url(forResource: tableName, withExtension: "stringsdict")

        if strings != nil || stringsdict != nil {
          return (Locale(identifier: language), lbundle)
        }
      }
    }

    // If table is available in main bundle, don't look for localized resources
    let strings = hostingBundle.url(forResource: tableName, withExtension: "strings", subdirectory: nil, localization: nil)
    let stringsdict = hostingBundle.url(forResource: tableName, withExtension: "stringsdict", subdirectory: nil, localization: nil)

    if strings != nil || stringsdict != nil {
      return (applicationLocale, hostingBundle)
    }

    // If table is not found for requested languages, key will be shown
    return nil
  }

  /// Load string from Info.plist file
  fileprivate static func infoPlistString(path: [String], key: String) -> String? {
    var dict = hostingBundle.infoDictionary
    for step in path {
      guard let obj = dict?[step] as? [String: Any] else { return nil }
      dict = obj
    }
    return dict?[key] as? String
  }

  static func validate() throws {
    try font.validate()
    try intern.validate()
  }

  /// This `R.color` struct is generated, and contains static references to 9 colors.
  struct color {
    /// Color `Accent Faded`.
    static let accentFaded = Rswift.ColorResource(bundle: R.hostingBundle, name: "Accent Faded")
    /// Color `Accent`.
    static let accent = Rswift.ColorResource(bundle: R.hostingBundle, name: "Accent")
    /// Color `Base White`.
    static let baseWhite = Rswift.ColorResource(bundle: R.hostingBundle, name: "Base White")
    /// Color `Bright White`.
    static let brightWhite = Rswift.ColorResource(bundle: R.hostingBundle, name: "Bright White")
    /// Color `Dark Accent`.
    static let darkAccent = Rswift.ColorResource(bundle: R.hostingBundle, name: "Dark Accent")
    /// Color `Gray Faded`.
    static let grayFaded = Rswift.ColorResource(bundle: R.hostingBundle, name: "Gray Faded")
    /// Color `Gray`.
    static let gray = Rswift.ColorResource(bundle: R.hostingBundle, name: "Gray")
    /// Color `Shade2`.
    static let shade2 = Rswift.ColorResource(bundle: R.hostingBundle, name: "Shade2")
    /// Color `Shade4`.
    static let shade4 = Rswift.ColorResource(bundle: R.hostingBundle, name: "Shade4")

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "Accent Faded", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func accentFaded(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.accentFaded, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "Accent", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func accent(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.accent, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "Base White", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func baseWhite(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.baseWhite, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "Bright White", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func brightWhite(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.brightWhite, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "Dark Accent", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func darkAccent(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.darkAccent, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "Gray Faded", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func grayFaded(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.grayFaded, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "Gray", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func gray(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.gray, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "Shade2", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func shade2(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.shade2, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "Shade4", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func shade4(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.shade4, compatibleWith: traitCollection)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "Accent Faded", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func accentFaded(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.accentFaded.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "Accent", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func accent(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.accent.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "Base White", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func baseWhite(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.baseWhite.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "Bright White", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func brightWhite(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.brightWhite.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "Dark Accent", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func darkAccent(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.darkAccent.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "Gray Faded", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func grayFaded(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.grayFaded.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "Gray", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func gray(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.gray.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "Shade2", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func shade2(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.shade2.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "Shade4", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func shade4(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.shade4.name)
    }
    #endif

    fileprivate init() {}
  }

  /// This `R.file` struct is generated, and contains static references to 3 files.
  struct file {
    /// Resource file `IBMPlexSans-Bold.ttf`.
    static let ibmPlexSansBoldTtf = Rswift.FileResource(bundle: R.hostingBundle, name: "IBMPlexSans-Bold", pathExtension: "ttf")
    /// Resource file `IBMPlexSans-Medium.ttf`.
    static let ibmPlexSansMediumTtf = Rswift.FileResource(bundle: R.hostingBundle, name: "IBMPlexSans-Medium", pathExtension: "ttf")
    /// Resource file `IBMPlexSans-Regular.ttf`.
    static let ibmPlexSansRegularTtf = Rswift.FileResource(bundle: R.hostingBundle, name: "IBMPlexSans-Regular", pathExtension: "ttf")

    /// `bundle.url(forResource: "IBMPlexSans-Bold", withExtension: "ttf")`
    static func ibmPlexSansBoldTtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.ibmPlexSansBoldTtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "IBMPlexSans-Medium", withExtension: "ttf")`
    static func ibmPlexSansMediumTtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.ibmPlexSansMediumTtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "IBMPlexSans-Regular", withExtension: "ttf")`
    static func ibmPlexSansRegularTtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.ibmPlexSansRegularTtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    fileprivate init() {}
  }

  /// This `R.font` struct is generated, and contains static references to 3 fonts.
  struct font: Rswift.Validatable {
    /// Font `IBMPlexSans-Bold`.
    static let ibmPlexSansBold = Rswift.FontResource(fontName: "IBMPlexSans-Bold")
    /// Font `IBMPlexSans-Medium`.
    static let ibmPlexSansMedium = Rswift.FontResource(fontName: "IBMPlexSans-Medium")
    /// Font `IBMPlexSans-Regular`.
    static let ibmPlexSansRegular = Rswift.FontResource(fontName: "IBMPlexSans-Regular")

    /// `UIFont(name: "IBMPlexSans-Bold", size: ...)`
    static func ibmPlexSansBold(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: ibmPlexSansBold, size: size)
    }

    /// `UIFont(name: "IBMPlexSans-Medium", size: ...)`
    static func ibmPlexSansMedium(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: ibmPlexSansMedium, size: size)
    }

    /// `UIFont(name: "IBMPlexSans-Regular", size: ...)`
    static func ibmPlexSansRegular(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: ibmPlexSansRegular, size: size)
    }

    static func validate() throws {
      if R.font.ibmPlexSansBold(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'IBMPlexSans-Bold' could not be loaded, is 'IBMPlexSans-Bold.ttf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.ibmPlexSansMedium(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'IBMPlexSans-Medium' could not be loaded, is 'IBMPlexSans-Medium.ttf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.ibmPlexSansRegular(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'IBMPlexSans-Regular' could not be loaded, is 'IBMPlexSans-Regular.ttf' added to the UIAppFonts array in this targets Info.plist?") }
    }

    fileprivate init() {}
  }

  /// This `R.image` struct is generated, and contains static references to 2 images.
  struct image {
    /// Image `CalendarIcon`.
    static let calendarIcon = Rswift.ImageResource(bundle: R.hostingBundle, name: "CalendarIcon")
    /// Image `SplashImage`.
    static let splashImage = Rswift.ImageResource(bundle: R.hostingBundle, name: "SplashImage")

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "CalendarIcon", bundle: ..., traitCollection: ...)`
    static func calendarIcon(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.calendarIcon, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "SplashImage", bundle: ..., traitCollection: ...)`
    static func splashImage(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.splashImage, compatibleWith: traitCollection)
    }
    #endif

    fileprivate init() {}
  }

  /// This `R.string` struct is generated, and contains static references to 1 localization tables.
  struct string {
    /// This `R.string.localizable` struct is generated, and contains static references to 25 localization keys.
    struct localizable {
      /// en translation: Authorization error
      ///
      /// Locales: en, ru
      static let authorizationError = Rswift.StringResource(key: "authorizationError", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "ru"], comment: nil)
      /// en translation: Birth date
      ///
      /// Locales: en, ru
      static let birthDate = Rswift.StringResource(key: "birthDate", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "ru"], comment: nil)
      /// en translation: Done
      ///
      /// Locales: en, ru
      static let done = Rswift.StringResource(key: "done", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "ru"], comment: nil)
      /// en translation: E-mail
      ///
      /// Locales: en, ru
      static let email = Rswift.StringResource(key: "email", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "ru"], comment: nil)
      /// en translation: Favorites
      ///
      /// Locales: en, ru
      static let favorites = Rswift.StringResource(key: "favorites", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "ru"], comment: nil)
      /// en translation: Female
      ///
      /// Locales: en, ru
      static let female = Rswift.StringResource(key: "female", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "ru"], comment: nil)
      /// en translation: Gallery
      ///
      /// Locales: en, ru
      static let gallery = Rswift.StringResource(key: "gallery", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "ru"], comment: nil)
      /// en translation: I have an account
      ///
      /// Locales: en, ru
      static let iHaveAnAccount = Rswift.StringResource(key: "iHaveAnAccount", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "ru"], comment: nil)
      /// en translation: Login
      ///
      /// Locales: en, ru
      static let login = Rswift.StringResource(key: "login", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "ru"], comment: nil)
      /// en translation: Male
      ///
      /// Locales: en, ru
      static let male = Rswift.StringResource(key: "male", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "ru"], comment: nil)
      /// en translation: Name
      ///
      /// Locales: en, ru
      static let name = Rswift.StringResource(key: "name", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "ru"], comment: nil)
      /// en translation: Password
      ///
      /// Locales: en, ru
      static let password = Rswift.StringResource(key: "password", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "ru"], comment: nil)
      /// en translation: Password confirmation
      ///
      /// Locales: en, ru
      static let passwordConfirmation = Rswift.StringResource(key: "passwordConfirmation", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "ru"], comment: nil)
      /// en translation: Pick gender
      ///
      /// Locales: en, ru
      static let pickGender = Rswift.StringResource(key: "pickGender", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "ru"], comment: nil)
      /// en translation: Please enter valid password
      ///
      /// Locales: en, ru
      static let pleaseEnterValidPassword = Rswift.StringResource(key: "pleaseEnterValidPassword", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "ru"], comment: nil)
      /// en translation: Please enter valid username
      ///
      /// Locales: en, ru
      static let pleaseEnterValidUsername = Rswift.StringResource(key: "pleaseEnterValidUsername", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "ru"], comment: nil)
      /// en translation: Register
      ///
      /// Locales: en, ru
      static let register = Rswift.StringResource(key: "register", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "ru"], comment: nil)
      /// en translation: Registration
      ///
      /// Locales: en, ru
      static let registration = Rswift.StringResource(key: "registration", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "ru"], comment: nil)
      /// en translation: Session in expired. Please login again
      ///
      /// Locales: en, ru
      static let sessionIsExpired = Rswift.StringResource(key: "sessionIsExpired", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "ru"], comment: nil)
      /// en translation: Unable to get data
      ///
      /// Locales: en, ru
      static let unableToGetData = Rswift.StringResource(key: "unableToGetData", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "ru"], comment: nil)
      /// en translation: Unable to get error
      ///
      /// Locales: en, ru
      static let unableToGetError = Rswift.StringResource(key: "unableToGetError", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "ru"], comment: nil)
      /// en translation: Unable to get saved value
      ///
      /// Locales: en, ru
      static let unableToGetSavedValue = Rswift.StringResource(key: "unableToGetSavedValue", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "ru"], comment: nil)
      /// en translation: Unable to save value
      ///
      /// Locales: en, ru
      static let unableToSaveValue = Rswift.StringResource(key: "unableToSaveValue", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "ru"], comment: nil)
      /// en translation: Username
      ///
      /// Locales: en, ru
      static let username = Rswift.StringResource(key: "username", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "ru"], comment: nil)
      /// en translation: Watch
      ///
      /// Locales: en, ru
      static let watch = Rswift.StringResource(key: "watch", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "ru"], comment: nil)

      /// en translation: Authorization error
      ///
      /// Locales: en, ru
      static func authorizationError(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("authorizationError", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "authorizationError"
        }

        return NSLocalizedString("authorizationError", bundle: bundle, comment: "")
      }

      /// en translation: Birth date
      ///
      /// Locales: en, ru
      static func birthDate(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("birthDate", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "birthDate"
        }

        return NSLocalizedString("birthDate", bundle: bundle, comment: "")
      }

      /// en translation: Done
      ///
      /// Locales: en, ru
      static func done(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("done", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "done"
        }

        return NSLocalizedString("done", bundle: bundle, comment: "")
      }

      /// en translation: E-mail
      ///
      /// Locales: en, ru
      static func email(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("email", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "email"
        }

        return NSLocalizedString("email", bundle: bundle, comment: "")
      }

      /// en translation: Favorites
      ///
      /// Locales: en, ru
      static func favorites(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("favorites", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "favorites"
        }

        return NSLocalizedString("favorites", bundle: bundle, comment: "")
      }

      /// en translation: Female
      ///
      /// Locales: en, ru
      static func female(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("female", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "female"
        }

        return NSLocalizedString("female", bundle: bundle, comment: "")
      }

      /// en translation: Gallery
      ///
      /// Locales: en, ru
      static func gallery(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("gallery", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "gallery"
        }

        return NSLocalizedString("gallery", bundle: bundle, comment: "")
      }

      /// en translation: I have an account
      ///
      /// Locales: en, ru
      static func iHaveAnAccount(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("iHaveAnAccount", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "iHaveAnAccount"
        }

        return NSLocalizedString("iHaveAnAccount", bundle: bundle, comment: "")
      }

      /// en translation: Login
      ///
      /// Locales: en, ru
      static func login(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("login", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "login"
        }

        return NSLocalizedString("login", bundle: bundle, comment: "")
      }

      /// en translation: Male
      ///
      /// Locales: en, ru
      static func male(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("male", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "male"
        }

        return NSLocalizedString("male", bundle: bundle, comment: "")
      }

      /// en translation: Name
      ///
      /// Locales: en, ru
      static func name(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("name", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "name"
        }

        return NSLocalizedString("name", bundle: bundle, comment: "")
      }

      /// en translation: Password
      ///
      /// Locales: en, ru
      static func password(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("password", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "password"
        }

        return NSLocalizedString("password", bundle: bundle, comment: "")
      }

      /// en translation: Password confirmation
      ///
      /// Locales: en, ru
      static func passwordConfirmation(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("passwordConfirmation", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "passwordConfirmation"
        }

        return NSLocalizedString("passwordConfirmation", bundle: bundle, comment: "")
      }

      /// en translation: Pick gender
      ///
      /// Locales: en, ru
      static func pickGender(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("pickGender", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "pickGender"
        }

        return NSLocalizedString("pickGender", bundle: bundle, comment: "")
      }

      /// en translation: Please enter valid password
      ///
      /// Locales: en, ru
      static func pleaseEnterValidPassword(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("pleaseEnterValidPassword", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "pleaseEnterValidPassword"
        }

        return NSLocalizedString("pleaseEnterValidPassword", bundle: bundle, comment: "")
      }

      /// en translation: Please enter valid username
      ///
      /// Locales: en, ru
      static func pleaseEnterValidUsername(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("pleaseEnterValidUsername", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "pleaseEnterValidUsername"
        }

        return NSLocalizedString("pleaseEnterValidUsername", bundle: bundle, comment: "")
      }

      /// en translation: Register
      ///
      /// Locales: en, ru
      static func register(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("register", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "register"
        }

        return NSLocalizedString("register", bundle: bundle, comment: "")
      }

      /// en translation: Registration
      ///
      /// Locales: en, ru
      static func registration(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("registration", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "registration"
        }

        return NSLocalizedString("registration", bundle: bundle, comment: "")
      }

      /// en translation: Session in expired. Please login again
      ///
      /// Locales: en, ru
      static func sessionIsExpired(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("sessionIsExpired", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "sessionIsExpired"
        }

        return NSLocalizedString("sessionIsExpired", bundle: bundle, comment: "")
      }

      /// en translation: Unable to get data
      ///
      /// Locales: en, ru
      static func unableToGetData(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("unableToGetData", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "unableToGetData"
        }

        return NSLocalizedString("unableToGetData", bundle: bundle, comment: "")
      }

      /// en translation: Unable to get error
      ///
      /// Locales: en, ru
      static func unableToGetError(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("unableToGetError", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "unableToGetError"
        }

        return NSLocalizedString("unableToGetError", bundle: bundle, comment: "")
      }

      /// en translation: Unable to get saved value
      ///
      /// Locales: en, ru
      static func unableToGetSavedValue(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("unableToGetSavedValue", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "unableToGetSavedValue"
        }

        return NSLocalizedString("unableToGetSavedValue", bundle: bundle, comment: "")
      }

      /// en translation: Unable to save value
      ///
      /// Locales: en, ru
      static func unableToSaveValue(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("unableToSaveValue", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "unableToSaveValue"
        }

        return NSLocalizedString("unableToSaveValue", bundle: bundle, comment: "")
      }

      /// en translation: Username
      ///
      /// Locales: en, ru
      static func username(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("username", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "username"
        }

        return NSLocalizedString("username", bundle: bundle, comment: "")
      }

      /// en translation: Watch
      ///
      /// Locales: en, ru
      static func watch(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("watch", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "watch"
        }

        return NSLocalizedString("watch", bundle: bundle, comment: "")
      }

      fileprivate init() {}
    }

    fileprivate init() {}
  }

  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      // There are no resources to validate
    }

    fileprivate init() {}
  }

  fileprivate class Class {}

  fileprivate init() {}
}

struct _R {
  fileprivate init() {}
}
