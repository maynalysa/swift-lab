// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// Animations
  internal static let animations = L10n.tr("Localizable", "animations", fallback: "Animations")
  /// Get Started
  internal static let onboardingGetStartedButton = L10n.tr("Localizable", "onboarding-get-started-button", fallback: "Get Started")
  /// Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.
  internal static let onboardingLorem = L10n.tr("Localizable", "onboarding-lorem", fallback: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.")
  /// SwiftLab
  internal static let onboardingSwiftlabSubtitle = L10n.tr("Localizable", "onboarding-swiftlab-subtitle", fallback: "SwiftLab")
  /// Welcome to
  internal static let onboardingWelcomeTitle = L10n.tr("Localizable", "onboarding-welcome-title", fallback: "Welcome to")
  /// Localizable.strings
  ///   SwiftLab
  /// 
  ///   Created by mayane ndoumbe mbow on 17/04/2025.
  internal static let swiftLab = L10n.tr("Localizable", "swift-lab", fallback: "SwiftLab")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
