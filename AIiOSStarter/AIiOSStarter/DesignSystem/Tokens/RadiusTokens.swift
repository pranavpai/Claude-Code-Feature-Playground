//
//  RadiusTokens.swift
//  AIiOSStarter
//
//  Corner radius scale for consistent rounded corners
//  Provides semantic sizing from small to fully rounded
//

import SwiftUI

// MARK: - Corner Radius Scale

extension CGFloat {
    /// 4pt - Small radius
    /// Use for: Small buttons, chips, badges
    static let radiusSmall: CGFloat = 4

    /// 8pt - Medium radius
    /// Use for: Standard buttons, input fields, small cards
    static let radiusMedium: CGFloat = 8

    /// 12pt - Large radius
    /// Use for: Cards, larger buttons
    static let radiusLarge: CGFloat = 12

    /// 16pt - Extra large radius
    /// Use for: Large cards, modals, sheets
    static let radiusXLarge: CGFloat = 16

    /// 20pt - Double extra large radius
    /// Use for: Special emphasis elements, large containers
    static let radiusXXLarge: CGFloat = 20

    /// 24pt - Triple extra large radius
    /// Use for: Bottom sheets, large modals
    static let radiusXXXLarge: CGFloat = 24

    /// 999pt - Fully rounded
    /// Use for: Pills, avatars, circular elements (use with equal width/height)
    static let radiusRound: CGFloat = 999
}

// MARK: - Convenience View Extension

extension View {
    /// Apply corner radius using a semantic token
    /// - Parameter radius: The corner radius token
    func cornerRadius(_ radius: CGFloat) -> some View {
        self.clipShape(RoundedRectangle(cornerRadius: radius))
    }

    /// Apply corner radius to specific corners
    /// - Parameters:
    ///   - radius: The corner radius value
    ///   - corners: The corners to apply radius to
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        self.clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

// MARK: - Custom Shape for Specific Corners

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

// MARK: - Preview

#Preview("Corner Radius Scale") {
    ScrollView {
        VStack(spacing: 32) {
            Text("Corner Radius Tokens")
                .font(.title)
                .foregroundColor(.contentPrimary)
                .padding(.bottom, 8)

            radiusExample(title: "Small (4pt)", radius: .radiusSmall, description: "Small buttons, chips")
            radiusExample(title: "Medium (8pt)", radius: .radiusMedium, description: "Standard buttons, inputs")
            radiusExample(title: "Large (12pt)", radius: .radiusLarge, description: "Cards, large buttons")
            radiusExample(title: "XLarge (16pt)", radius: .radiusXLarge, description: "Large cards, modals")
            radiusExample(title: "XXLarge (20pt)", radius: .radiusXXLarge, description: "Special emphasis")
            radiusExample(title: "XXXLarge (24pt)", radius: .radiusXXXLarge, description: "Bottom sheets")

            // Fully rounded example
            VStack(alignment: .leading, spacing: 16) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Round (999pt)")
                        .font(.titleMedium)
                        .foregroundColor(.contentPrimary)

                    Text("Pills, avatars, circular elements")
                        .font(.bodySmall)
                        .foregroundColor(.contentSecondary)
                }

                HStack(spacing: 16) {
                    // Pill button
                    Text("Pill Button")
                        .font(.labelMedium)
                        .foregroundColor(.white)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 12)
                        .background(Color.brandPrimary)
                        .cornerRadius(.radiusRound)

                    // Avatar
                    Circle()
                        .fill(Color.brandSecondary)
                        .frame(width: 60, height: 60)
                        .overlay(
                            Text("AB")
                                .font(.titleMedium)
                                .foregroundColor(.white)
                        )
                }
            }
        }
        .padding(32)
    }
    .background(Color.uiBackground)
}

#Preview("Corner Radius in Components") {
    ScrollView {
        VStack(spacing: 24) {
            // Card with large radius
            VStack(alignment: .leading, spacing: 12) {
                Text("Card Title")
                    .font(.titleLarge)
                    .foregroundColor(.contentPrimary)

                Text("This card uses .radiusLarge (12pt) for a balanced appearance")
                    .font(.bodyMedium)
                    .foregroundColor(.contentSecondary)
            }
            .padding(20)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.uiSurface)
            .cornerRadius(.radiusLarge)
            .shadowMedium()

            // Button with medium radius
            Text("Standard Button")
                .font(.labelLarge)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
                .background(Color.brandPrimary)
                .cornerRadius(.radiusMedium)

            // Input field with medium radius
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.contentTertiary)
                Text("Search...")
                    .font(.bodyMedium)
                    .foregroundColor(.contentTertiary)
                Spacer()
            }
            .padding(16)
            .background(Color.uiSurface)
            .overlay(
                RoundedRectangle(cornerRadius: .radiusMedium)
                    .stroke(Color.uiBorder, lineWidth: 1)
            )

            // Chip with small radius
            HStack(spacing: 8) {
                ForEach(["iOS", "SwiftUI", "Design"], id: \.self) { tag in
                    Text(tag)
                        .font(.labelSmall)
                        .foregroundColor(.brandPrimary)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(Color.brandPrimary.opacity(0.1))
                        .cornerRadius(.radiusSmall)
                }
            }
        }
        .padding(24)
    }
    .background(Color.uiBackground)
}

private func radiusExample(title: String, radius: CGFloat, description: String) -> some View {
    VStack(alignment: .leading, spacing: 16) {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.titleMedium)
                .foregroundColor(.contentPrimary)

            Text(description)
                .font(.bodySmall)
                .foregroundColor(.contentSecondary)
        }

        Rectangle()
            .fill(Color.brandPrimary)
            .frame(height: 80)
            .cornerRadius(radius)
    }
}
