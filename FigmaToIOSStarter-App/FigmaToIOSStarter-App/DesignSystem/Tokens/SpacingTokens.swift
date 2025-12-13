//
//  SpacingTokens.swift
//  FigmaToIOSStarter
//
//  Spacing scale based on 8pt grid system
//  Provides consistent spacing throughout the app
//

import SwiftUI

// MARK: - Spacing Scale

extension CGFloat {
    /// 2pt - Minimal spacing for very tight elements
    /// Use for: Ultra-compact spacing where elements need to be very close
    static let spacingXXS: CGFloat = 2

    /// 4pt - Very small spacing
    /// Use for: Icon-text gaps, badge spacing
    static let spacingXS: CGFloat = 4

    /// 8pt - Small spacing for related elements
    /// Use for: Spacing between related items, tight padding
    static let spacingS: CGFloat = 8

    /// 16pt - Medium spacing (default gap)
    /// Use for: Standard padding, gap between sections
    static let spacingM: CGFloat = 16

    /// 24pt - Large spacing for section separation
    /// Use for: Spacing between distinct sections, card padding
    static let spacingL: CGFloat = 24

    /// 32pt - Extra large spacing for major sections
    /// Use for: Major section dividers, screen padding
    static let spacingXL: CGFloat = 32

    /// 48pt - Double extra large (screen margins)
    /// Use for: Top/bottom screen margins, hero section spacing
    static let spacingXXL: CGFloat = 48

    /// 64pt - Triple extra large (hero spacing)
    /// Use for: Large hero sections, splash screen spacing
    static let spacingXXXL: CGFloat = 64
}

// MARK: - Edge Insets Helpers

extension EdgeInsets {
    /// Create EdgeInsets with the same value for all sides
    /// - Parameter value: The spacing value to use
    /// - Returns: EdgeInsets with equal spacing on all sides
    static func all(_ value: CGFloat) -> EdgeInsets {
        EdgeInsets(top: value, leading: value, bottom: value, trailing: value)
    }

    /// Create EdgeInsets with horizontal (leading/trailing) spacing
    /// - Parameter value: The horizontal spacing value
    /// - Returns: EdgeInsets with horizontal spacing only
    static func horizontal(_ value: CGFloat) -> EdgeInsets {
        EdgeInsets(top: 0, leading: value, bottom: 0, trailing: value)
    }

    /// Create EdgeInsets with vertical (top/bottom) spacing
    /// - Parameter value: The vertical spacing value
    /// - Returns: EdgeInsets with vertical spacing only
    static func vertical(_ value: CGFloat) -> EdgeInsets {
        EdgeInsets(top: value, leading: 0, bottom: value, trailing: 0)
    }
}

// MARK: - Preview

#Preview("Spacing Scale") {
    ScrollView {
        VStack(alignment: .leading, spacing: 24) {
            Text("Spacing Tokens")
                .font(.title)
                .foregroundColor(.contentPrimary)
                .padding(.bottom, 8)

            spacingExample(name: "XXS (2pt)", value: .spacingXXS, description: "Minimal spacing")
            spacingExample(name: "XS (4pt)", value: .spacingXS, description: "Icon-text gap")
            spacingExample(name: "S (8pt)", value: .spacingS, description: "Related elements")
            spacingExample(name: "M (16pt)", value: .spacingM, description: "Default gap")
            spacingExample(name: "L (24pt)", value: .spacingL, description: "Section separation")
            spacingExample(name: "XL (32pt)", value: .spacingXL, description: "Major sections")
            spacingExample(name: "XXL (48pt)", value: .spacingXXL, description: "Screen margins")
            spacingExample(name: "XXXL (64pt)", value: .spacingXXXL, description: "Hero spacing")
        }
        .padding()
    }
    .background(Color.uiBackground)
}

#Preview("Spacing in Practice") {
    ScrollView {
        VStack(spacing: .spacingXL) {
            // Card with various spacing
            VStack(alignment: .leading, spacing: .spacingM) {
                Text("Card Title")
                    .font(.titleLarge)
                    .foregroundColor(.contentPrimary)

                Text("This card demonstrates spacing tokens in a real component")
                    .font(.bodyMedium)
                    .foregroundColor(.contentSecondary)

                HStack(spacing: .spacingS) {
                    ForEach(0..<3) { _ in
                        Circle()
                            .fill(Color.brandPrimary)
                            .frame(width: 40, height: 40)
                    }
                }

                Divider()
                    .padding(.vertical, .spacingXS)

                HStack(spacing: .spacingXS) {
                    Image(systemName: "star.fill")
                        .foregroundColor(.statusWarning)
                    Text("Featured")
                        .font(.labelSmall)
                        .foregroundColor(.contentSecondary)
                }
            }
            .padding(.spacingL)
            .background(Color.uiSurface)
            .cornerRadius(12)
            .shadow(color: Color.black.opacity(0.08), radius: 8, x: 0, y: 2)

            // Another card showing nested spacing
            VStack(alignment: .leading, spacing: .spacingS) {
                Text("Compact Card")
                    .font(.titleMedium)
                    .foregroundColor(.contentPrimary)

                Text("Uses smaller spacing values")
                    .font(.bodySmall)
                    .foregroundColor(.contentSecondary)
            }
            .padding(.spacingM)
            .background(Color.uiSurface)
            .cornerRadius(8)
        }
        .padding(.spacingL)
    }
    .background(Color.uiBackground)
}

private func spacingExample(name: String, value: CGFloat, description: String) -> some View {
    VStack(alignment: .leading, spacing: 8) {
        HStack {
            Text(name)
                .font(.body)
                .fontWeight(.semibold)
                .foregroundColor(.contentPrimary)

            Spacer()

            Text(description)
                .font(.caption)
                .foregroundColor(.contentSecondary)
        }

        HStack(spacing: 0) {
            Rectangle()
                .fill(Color.brandPrimary)
                .frame(width: value, height: 40)

            Rectangle()
                .fill(Color.brandPrimary.opacity(0.3))
                .frame(maxWidth: .infinity)
                .frame(height: 40)
        }
        .overlay(
            Text("\(Int(value))pt")
                .font(.caption)
                .fontWeight(.medium)
                .foregroundColor(.white)
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .background(Color.black.opacity(0.7))
                .cornerRadius(4)
                .padding(.leading, value + 8),
            alignment: .leading
        )

        Divider()
            .padding(.top, 4)
    }
}
