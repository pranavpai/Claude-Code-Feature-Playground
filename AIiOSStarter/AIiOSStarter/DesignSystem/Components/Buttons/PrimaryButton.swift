//
//  PrimaryButton.swift
//  FigmaToIOSStarter
//
//  Primary button component following design system tokens
//  Demonstrates proper use of color, typography, and spacing tokens
//

import SwiftUI

struct PrimaryButton: View {
    let title: String
    let action: () -> Void
    var isEnabled: Bool = true
    var isLoading: Bool = false
    var fullWidth: Bool = true

    var body: some View {
        Button(action: action) {
            HStack(spacing: .spacingS) {
                if isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        .scaleEffect(0.8)
                } else {
                    Text(title)
                        .textStyle(.labelLarge, color: .white)
                }
            }
            .frame(maxWidth: fullWidth ? .infinity : nil)
            .padding(.vertical, .spacingM)
            .padding(.horizontal, .spacingL)
            .background(backgroundColor)
            .cornerRadius(.radiusMedium)
        }
        .disabled(!isEnabled || isLoading)
        .accessibilityLabel(title)
        .accessibilityAddTraits(.isButton)
        .accessibilityValue(isLoading ? "Loading" : "")
        .accessibilityHint(isEnabled ? "" : "Button is disabled")
    }

    private var backgroundColor: Color {
        if !isEnabled {
            return .contentTertiary
        } else {
            return .brandPrimary
        }
    }
}

// MARK: - Preview

#Preview("Button States") {
    ScrollView {
        VStack(spacing: .spacingL) {
            Group {
                Text("Default State")
                    .textStyle(.titleSmall)
                PrimaryButton(title: "Continue", action: {})
            }

            Group {
                Text("Disabled State")
                    .textStyle(.titleSmall)
                PrimaryButton(title: "Disabled Button", action: {}, isEnabled: false)
            }

            Group {
                Text("Loading State")
                    .textStyle(.titleSmall)
                PrimaryButton(title: "Loading", action: {}, isLoading: true)
            }

            Group {
                Text("Not Full Width")
                    .textStyle(.titleSmall)
                HStack {
                    Spacer()
                    PrimaryButton(title: "Compact", action: {}, fullWidth: false)
                    Spacer()
                }
            }
        }
        .padding()
    }
    .background(Color.uiBackground)
}

#Preview("Dark Mode") {
    VStack(spacing: .spacingL) {
        PrimaryButton(title: "Continue", action: {})
        PrimaryButton(title: "Disabled", action: {}, isEnabled: false)
        PrimaryButton(title: "Loading", action: {}, isLoading: true)
    }
    .padding()
    .background(Color.uiBackground)
    .preferredColorScheme(.dark)
}
