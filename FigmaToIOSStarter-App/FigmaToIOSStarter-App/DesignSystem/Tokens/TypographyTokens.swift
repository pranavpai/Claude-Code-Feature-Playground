//
//  TypographyTokens.swift
//  FigmaToIOSStarter
//
//  Typography scale following Material Design 3 principles
//  Supports Dynamic Type for accessibility
//

import SwiftUI

// MARK: - Font Extensions

extension Font {
    // MARK: - Display (Largest text for hero sections)

    /// 57pt, Regular - For splash screens and hero sections
    static let displayLarge = Font.system(size: 57, weight: .regular)

    /// 45pt, Regular - For large display text
    static let displayMedium = Font.system(size: 45, weight: .regular)

    /// 36pt, Regular - For prominent display text
    static let displaySmall = Font.system(size: 36, weight: .regular)

    // MARK: - Headline (Section headers and prominent titles)

    /// 32pt, Regular - For major section headers
    static let headlineLarge = Font.system(size: 32, weight: .regular)

    /// 28pt, Regular - For subsection headers
    static let headlineMedium = Font.system(size: 28, weight: .regular)

    /// 24pt, Regular - For card headers and small sections
    static let headlineSmall = Font.system(size: 24, weight: .regular)

    // MARK: - Title (Card titles and list headers)

    /// 22pt, Regular - For screen titles and large card headers
    static let titleLarge = Font.system(size: 22, weight: .regular)

    /// 16pt, Medium - For list item titles and card titles
    static let titleMedium = Font.system(size: 16, weight: .medium)

    /// 14pt, Medium - For compact titles and emphasized labels
    static let titleSmall = Font.system(size: 14, weight: .medium)

    // MARK: - Body (Main content text)

    /// 16pt, Regular - For large body text
    static let bodyLarge = Font.system(size: 16, weight: .regular)

    /// 14pt, Regular - For standard body text (most common)
    static let bodyMedium = Font.system(size: 14, weight: .regular)

    /// 12pt, Regular - For captions and fine print
    static let bodySmall = Font.system(size: 12, weight: .regular)

    // MARK: - Label (Button labels and form labels)

    /// 14pt, Medium - For button labels and prominent form labels
    static let labelLarge = Font.system(size: 14, weight: .medium)

    /// 12pt, Medium - For standard form labels and secondary buttons
    static let labelMedium = Font.system(size: 12, weight: .medium)

    /// 11pt, Medium - For tiny labels and badges
    static let labelSmall = Font.system(size: 11, weight: .medium)
}

// MARK: - Text Style Enum

/// Semantic text styles for consistent typography throughout the app
enum TextStyle {
    case displayLarge
    case displayMedium
    case displaySmall

    case headlineLarge
    case headlineMedium
    case headlineSmall

    case titleLarge
    case titleMedium
    case titleSmall

    case bodyLarge
    case bodyMedium
    case bodySmall

    case labelLarge
    case labelMedium
    case labelSmall

    var font: Font {
        switch self {
        case .displayLarge: return .displayLarge
        case .displayMedium: return .displayMedium
        case .displaySmall: return .displaySmall
        case .headlineLarge: return .headlineLarge
        case .headlineMedium: return .headlineMedium
        case .headlineSmall: return .headlineSmall
        case .titleLarge: return .titleLarge
        case .titleMedium: return .titleMedium
        case .titleSmall: return .titleSmall
        case .bodyLarge: return .bodyLarge
        case .bodyMedium: return .bodyMedium
        case .bodySmall: return .bodySmall
        case .labelLarge: return .labelLarge
        case .labelMedium: return .labelMedium
        case .labelSmall: return .labelSmall
        }
    }

    var defaultColor: Color {
        switch self {
        // Display and headlines use primary content color
        case .displayLarge, .displayMedium, .displaySmall,
             .headlineLarge, .headlineMedium, .headlineSmall,
             .titleLarge, .titleMedium, .titleSmall:
            return .contentPrimary

        // Body text uses primary for emphasis
        case .bodyLarge, .bodyMedium:
            return .contentPrimary

        // Small body and labels use secondary for less emphasis
        case .bodySmall, .labelLarge, .labelMedium, .labelSmall:
            return .contentSecondary
        }
    }
}

// MARK: - Text Style View Modifier

struct TextStyleModifier: ViewModifier {
    let style: TextStyle
    let color: Color?

    init(style: TextStyle, color: Color? = nil) {
        self.style = style
        self.color = color
    }

    func body(content: Content) -> some View {
        content
            .font(style.font)
            .foregroundColor(color ?? style.defaultColor)
    }
}

extension View {
    /// Apply a semantic text style with optional custom color
    /// - Parameters:
    ///   - style: The text style to apply
    ///   - color: Optional color override (uses default if nil)
    func textStyle(_ style: TextStyle, color: Color? = nil) -> some View {
        modifier(TextStyleModifier(style: style, color: color))
    }
}

// MARK: - Preview

#Preview("Typography Scale") {
    ScrollView {
        VStack(alignment: .leading, spacing: 32) {
            typographySection(
                title: "Display",
                styles: [
                    ("Display Large", .displayLarge),
                    ("Display Medium", .displayMedium),
                    ("Display Small", .displaySmall)
                ]
            )

            typographySection(
                title: "Headline",
                styles: [
                    ("Headline Large", .headlineLarge),
                    ("Headline Medium", .headlineMedium),
                    ("Headline Small", .headlineSmall)
                ]
            )

            typographySection(
                title: "Title",
                styles: [
                    ("Title Large", .titleLarge),
                    ("Title Medium", .titleMedium),
                    ("Title Small", .titleSmall)
                ]
            )

            typographySection(
                title: "Body",
                styles: [
                    ("Body Large - Main content with emphasis", .bodyLarge),
                    ("Body Medium - Standard content text for most use cases", .bodyMedium),
                    ("Body Small - Captions and fine print text", .bodySmall)
                ]
            )

            typographySection(
                title: "Label",
                styles: [
                    ("Label Large", .labelLarge),
                    ("Label Medium", .labelMedium),
                    ("Label Small", .labelSmall)
                ]
            )
        }
        .padding()
    }
    .background(Color.uiBackground)
}

#Preview("Dark Mode") {
    ScrollView {
        VStack(alignment: .leading, spacing: 32) {
            typographySection(
                title: "Display",
                styles: [
                    ("Display Large", .displayLarge),
                    ("Display Medium", .displayMedium),
                    ("Display Small", .displaySmall)
                ]
            )

            typographySection(
                title: "Body",
                styles: [
                    ("Body Large", .bodyLarge),
                    ("Body Medium", .bodyMedium),
                    ("Body Small", .bodySmall)
                ]
            )
        }
        .padding()
    }
    .background(Color.uiBackground)
    .preferredColorScheme(.dark)
}

private func typographySection(title: String, styles: [(String, TextStyle)]) -> some View {
    VStack(alignment: .leading, spacing: 16) {
        Text(title)
            .font(.headline)
            .foregroundColor(.contentSecondary)

        Divider()

        ForEach(styles, id: \.0) { text, style in
            VStack(alignment: .leading, spacing: 4) {
                Text(text)
                    .textStyle(style)

                Text("\(style.font.description)")
                    .font(.caption)
                    .foregroundColor(.contentTertiary)
            }
        }
    }
}

extension Font {
    var description: String {
        // This is a simplified description for preview purposes
        return "Font"
    }
}
