//
//  ShadowTokens.swift
//  FigmaToIOSStarter
//
//  Reusable shadow modifiers for consistent elevation
//  Based on Material Design elevation system
//

import SwiftUI

extension View {
    /// Extra small shadow - Minimal elevation
    /// Blur: 2pt, Offset: (0, 1), Opacity: 2%
    /// Use for: Subtle hover states
    func shadowXSmall() -> some View {
        self.shadow(color: Color.black.opacity(0.02), radius: 2, x: 0, y: 1)
    }

    /// Small shadow - Subtle elevation
    /// Blur: 4pt, Offset: (0, 1), Opacity: 4%
    /// Use for: Small cards, chips, pills
    func shadowSmall() -> some View {
        self.shadow(color: Color.black.opacity(0.04), radius: 4, x: 0, y: 1)
    }

    /// Medium shadow - Standard elevation (most common)
    /// Blur: 8pt, Offset: (0, 2), Opacity: 8%
    /// Use for: Cards, buttons, input fields
    func shadowMedium() -> some View {
        self.shadow(color: Color.black.opacity(0.08), radius: 8, x: 0, y: 2)
    }

    /// Large shadow - High elevation
    /// Blur: 16pt, Offset: (0, 4), Opacity: 12%
    /// Use for: Modals, popovers, floating action buttons
    func shadowLarge() -> some View {
        self.shadow(color: Color.black.opacity(0.12), radius: 16, x: 0, y: 4)
    }

    /// Extra large shadow - Maximum elevation
    /// Blur: 24pt, Offset: (0, 8), Opacity: 16%
    /// Use for: Navigation drawers, full-screen modals
    func shadowXLarge() -> some View {
        self.shadow(color: Color.black.opacity(0.16), radius: 24, x: 0, y: 8)
    }

    /// Custom shadow with specified parameters
    /// - Parameters:
    ///   - color: Shadow color
    ///   - radius: Blur radius
    ///   - x: Horizontal offset
    ///   - y: Vertical offset
    func customShadow(color: Color = Color.black.opacity(0.08), radius: CGFloat, x: CGFloat = 0, y: CGFloat = 0) -> some View {
        self.shadow(color: color, radius: radius, x: x, y: y)
    }
}

// MARK: - Preview

#Preview("Shadow Tokens") {
    ScrollView {
        VStack(spacing: 40) {
            Text("Shadow Elevation Scale")
                .font(.title)
                .foregroundColor(.contentPrimary)
                .padding(.bottom, 16)

            shadowCard(title: "Extra Small", modifier: { $0.shadowXSmall() }, description: "Minimal elevation")
            shadowCard(title: "Small", modifier: { $0.shadowSmall() }, description: "Subtle elevation")
            shadowCard(title: "Medium", modifier: { $0.shadowMedium() }, description: "Standard elevation")
            shadowCard(title: "Large", modifier: { $0.shadowLarge() }, description: "High elevation")
            shadowCard(title: "Extra Large", modifier: { $0.shadowXLarge() }, description: "Maximum elevation")
        }
        .padding(40)
    }
    .background(Color(red: 0.95, green: 0.95, blue: 0.95))
}

#Preview("Dark Mode") {
    ScrollView {
        VStack(spacing: 40) {
            Text("Shadow Elevation Scale")
                .font(.title)
                .foregroundColor(.contentPrimary)
                .padding(.bottom, 16)

            shadowCard(title: "Small", modifier: { $0.shadowSmall() }, description: "Subtle elevation")
            shadowCard(title: "Medium", modifier: { $0.shadowMedium() }, description: "Standard elevation")
            shadowCard(title: "Large", modifier: { $0.shadowLarge() }, description: "High elevation")
        }
        .padding(40)
    }
    .background(Color.uiBackground)
    .preferredColorScheme(.dark)
}

private func shadowCard<V: View>(title: String, modifier: @escaping (AnyView) -> V, description: String) -> some View {
    VStack(alignment: .leading, spacing: 12) {
        Text(title)
            .font(.titleMedium)
            .foregroundColor(.contentPrimary)

        Text(description)
            .font(.bodySmall)
            .foregroundColor(.contentSecondary)
    }
    .frame(maxWidth: .infinity, alignment: .leading)
    .padding(24)
    .background(Color.uiSurface)
    .cornerRadius(12)
    .modifier(ViewModifierWrapper(modifier: modifier))
}

struct ViewModifierWrapper<V: View>: ViewModifier {
    let modifier: (AnyView) -> V

    func body(content: Content) -> some View {
        modifier(AnyView(content))
    }
}
