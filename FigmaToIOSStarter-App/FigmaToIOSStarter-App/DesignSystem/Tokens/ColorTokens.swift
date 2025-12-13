//
//  ColorTokens.swift
//  FigmaToIOSStarter
//
//  Semantic color system with Asset Catalog references
//  Supports automatic dark mode through Asset Catalog color sets
//

import SwiftUI

extension Color {
    // MARK: - Brand Colors

    /// Primary brand color - Used for main CTAs and key brand elements
    /// Light: #0066FF (RGB: 0, 102, 255), Dark: #4D94FF (RGB: 77, 148, 255)
    static let brandPrimary = Color("Brand/Primary")

    /// Secondary brand color - Used for accents and secondary actions
    /// Light: #00C896 (RGB: 0, 200, 150), Dark: #00E5A8 (RGB: 0, 229, 168)
    static let brandSecondary = Color("Brand/Secondary")

    /// Tertiary brand color - Used for highlights and special elements
    /// Light: #FF6B35 (RGB: 255, 107, 53), Dark: #FF8C5E (RGB: 255, 140, 94)
    static let brandTertiary = Color("Brand/Tertiary")

    // MARK: - UI Colors

    /// Main background color for screens
    /// Light: #FFFFFF (white), Dark: #000000 (black)
    static let uiBackground = Color("UI/Background")

    /// Surface color for cards, modals, and elevated content
    /// Light: #FFFFFF (white), Dark: #1C1C1E (dark gray)
    static let uiSurface = Color("UI/Surface")

    /// Divider lines between sections
    /// Light: #E5E5EA, Dark: #38383A
    static let uiDivider = Color("UI/Divider")

    /// Border color for inputs and containers
    /// Light: #D1D1D6, Dark: #48484A
    static let uiBorder = Color("UI/Border")

    // MARK: - Content Colors

    /// Primary text and icons - Highest emphasis
    /// Light: #000000 (black), Dark: #FFFFFF (white)
    static let contentPrimary = Color("Content/Primary")

    /// Secondary text and icons - Medium emphasis
    /// Light: #6C6C70, Dark: #AEAEB2
    static let contentSecondary = Color("Content/Secondary")

    /// Tertiary text and icons - Lowest emphasis (disabled, placeholders)
    /// Light: #A3A3A8, Dark: #636366
    static let contentTertiary = Color("Content/Tertiary")

    // MARK: - Status Colors

    /// Success states and positive feedback
    /// Light: #34C759, Dark: #32D74B
    static let statusSuccess = Color("Status/Success")

    /// Warning states and caution alerts
    /// Light: #FF9500, Dark: #FF9F0A
    static let statusWarning = Color("Status/Warning")

    /// Error states and destructive actions
    /// Light: #FF3B30, Dark: #FF453A
    static let statusError = Color("Status/Error")

    /// Informational states and neutral feedback
    /// Light: #007AFF, Dark: #0A84FF
    static let statusInfo = Color("Status/Info")
}

// MARK: - Hex Color Initializer

extension Color {
    /// Initialize a Color from a hex string
    /// - Parameter hex: Hex string (supports #RGB, #RRGGBB, #RRGGBBAA formats)
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

// MARK: - Preview

#Preview("Color Tokens - Light") {
    ScrollView {
        VStack(alignment: .leading, spacing: 24) {
            colorSection(title: "Brand Colors", colors: [
                ("Brand Primary", .brandPrimary),
                ("Brand Secondary", .brandSecondary),
                ("Brand Tertiary", .brandTertiary)
            ])

            colorSection(title: "UI Colors", colors: [
                ("UI Background", .uiBackground),
                ("UI Surface", .uiSurface),
                ("UI Divider", .uiDivider),
                ("UI Border", .uiBorder)
            ])

            colorSection(title: "Content Colors", colors: [
                ("Content Primary", .contentPrimary),
                ("Content Secondary", .contentSecondary),
                ("Content Tertiary", .contentTertiary)
            ])

            colorSection(title: "Status Colors", colors: [
                ("Status Success", .statusSuccess),
                ("Status Warning", .statusWarning),
                ("Status Error", .statusError),
                ("Status Info", .statusInfo)
            ])
        }
        .padding()
    }
    .background(Color.uiBackground)
    .preferredColorScheme(.light)
}

#Preview("Color Tokens - Dark") {
    ScrollView {
        VStack(alignment: .leading, spacing: 24) {
            colorSection(title: "Brand Colors", colors: [
                ("Brand Primary", .brandPrimary),
                ("Brand Secondary", .brandSecondary),
                ("Brand Tertiary", .brandTertiary)
            ])

            colorSection(title: "UI Colors", colors: [
                ("UI Background", .uiBackground),
                ("UI Surface", .uiSurface),
                ("UI Divider", .uiDivider),
                ("UI Border", .uiBorder)
            ])

            colorSection(title: "Content Colors", colors: [
                ("Content Primary", .contentPrimary),
                ("Content Secondary", .contentSecondary),
                ("Content Tertiary", .contentTertiary)
            ])

            colorSection(title: "Status Colors", colors: [
                ("Status Success", .statusSuccess),
                ("Status Warning", .statusWarning),
                ("Status Error", .statusError),
                ("Status Info", .statusInfo)
            ])
        }
        .padding()
    }
    .background(Color.uiBackground)
    .preferredColorScheme(.dark)
}

private func colorSection(title: String, colors: [(String, Color)]) -> some View {
    VStack(alignment: .leading, spacing: 12) {
        Text(title)
            .font(.headline)
            .foregroundColor(.contentPrimary)

        ForEach(colors, id: \.0) { name, color in
            HStack {
                RoundedRectangle(cornerRadius: 8)
                    .fill(color)
                    .frame(width: 60, height: 60)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.uiBorder, lineWidth: 1)
                    )

                Text(name)
                    .font(.body)
                    .foregroundColor(.contentPrimary)

                Spacer()
            }
        }
    }
}
