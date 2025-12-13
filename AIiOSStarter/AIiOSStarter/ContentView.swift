//
//  ContentView.swift
//  AIiOSStarter
//
//  Root content view for the AI iOS Starter application
//  Demonstrates usage of the design system with proper tokens
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: .spacingXL) {
                    // Welcome Section
                    VStack(alignment: .leading, spacing: .spacingM) {
                        Text("AI iOS Starter")
                            .textStyle(.displayLarge)

                        Text("A production-ready iOS starter template with a complete design system. Build AI-powered apps with proper design tokens, dark mode support, and accessibility.")
                            .textStyle(.bodyLarge)
                            .foregroundColor(.contentSecondary)
                    }

                    // Quick Start Card
                    VStack(alignment: .leading, spacing: .spacingM) {
                        HStack {
                            Image(systemName: "star.fill")
                                .font(.system(size: 24))
                                .foregroundColor(.brandPrimary)

                            Text("Get Started")
                                .textStyle(.titleLarge)
                        }

                        Text("This starter includes:\n• Complete design system with tokens\n• SwiftUI components (buttons, cards)\n• Dark mode support\n• MVVM architecture\n• Claude Code integration")
                            .textStyle(.bodyMedium)
                            .foregroundColor(.contentSecondary)

                        PrimaryButton(title: "Build Your App", action: {})
                            .padding(.top, .spacingS)
                    }
                    .padding(.spacingL)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.uiSurface)
                    .cornerRadius(.radiusLarge)
                    .shadowMedium()

                    // Features Section
                    VStack(alignment: .leading, spacing: .spacingM) {
                        Text("Features")
                            .textStyle(.titleLarge)

                        FeatureRow(
                            icon: "paintbrush.fill",
                            title: "Design System",
                            description: "Comprehensive tokens for colors, typography, spacing, and more"
                        )

                        FeatureRow(
                            icon: "moon.fill",
                            title: "Dark Mode",
                            description: "Automatic dark mode support via Asset Catalog"
                        )

                        FeatureRow(
                            icon: "accessibility.fill",
                            title: "Accessible",
                            description: "Built with accessibility best practices"
                        )
                    }
                }
                .padding(.spacingL)
            }
            .background(Color.uiBackground)
            .navigationTitle("Home")
        }
    }
}

// MARK: - Feature Row Component

struct FeatureRow: View {
    let icon: String
    let title: String
    let description: String

    var body: some View {
        HStack(alignment: .top, spacing: .spacingM) {
            Image(systemName: icon)
                .font(.system(size: 20))
                .foregroundColor(.brandPrimary)
                .frame(width: 32, height: 32)

            VStack(alignment: .leading, spacing: .spacingXS) {
                Text(title)
                    .textStyle(.titleMedium)

                Text(description)
                    .textStyle(.bodySmall)
                    .foregroundColor(.contentSecondary)
            }
        }
        .padding(.spacingM)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.uiSurface)
        .cornerRadius(.radiusMedium)
    }
}

// MARK: - Preview

#Preview {
    ContentView()
}

#Preview("Dark Mode") {
    ContentView()
        .preferredColorScheme(.dark)
}
