 //
//  ContentView.swift
//  FigmaToIOSStarter-App
//
//  Root content view demonstrating the design system
//  Shows design tokens, components, and example layouts
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            DesignSystemView()
                .tabItem {
                    Label("Design System", systemImage: "paintpalette")
                }
                .tag(0)

            ComponentsView()
                .tabItem {
                    Label("Components", systemImage: "square.grid.2x2")
                }
                .tag(1)

            ExampleView()
                .tabItem {
                    Label("Example", systemImage: "app")
                }
                .tag(2)
        }
    }
}

// MARK: - Design System Tab

struct DesignSystemView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: .spacingXL) {
                    // Welcome Section
                    VStack(alignment: .leading, spacing: .spacingM) {
                        Text("Figma to iOS Starter")
                            .textStyle(.headlineMedium)

                        Text("A complete design system demonstrating Figma MCP to SwiftUI conversion with proper design tokens, dark mode support, and accessibility.")
                            .textStyle(.bodyMedium)
                            .foregroundColor(.contentSecondary)
                    }

                    // Color Tokens
                    designSystemSection(title: "Brand Colors") {
                        HStack(spacing: .spacingM) {
                            colorSwatch(color: .brandPrimary, name: "Primary")
                            colorSwatch(color: .brandSecondary, name: "Secondary")
                            colorSwatch(color: .brandTertiary, name: "Tertiary")
                        }
                    }

                    // Typography
                    designSystemSection(title: "Typography") {
                        VStack(alignment: .leading, spacing: .spacingM) {
                            Text("Display Large")
                                .textStyle(.displayLarge)
                            Text("Headline Medium")
                                .textStyle(.headlineMedium)
                            Text("Title Medium")
                                .textStyle(.titleMedium)
                            Text("Body Medium - The quick brown fox jumps over the lazy dog")
                                .textStyle(.bodyMedium)
                            Text("Label Small")
                                .textStyle(.labelSmall)
                        }
                    }

                    // Spacing
                    designSystemSection(title: "Spacing") {
                        VStack(alignment: .leading, spacing: .spacingM) {
                            spacingExample(value: .spacingS, name: "Small (8pt)")
                            spacingExample(value: .spacingM, name: "Medium (16pt)")
                            spacingExample(value: .spacingL, name: "Large (24pt)")
                            spacingExample(value: .spacingXL, name: "XLarge (32pt)")
                        }
                    }
                }
                .padding(.spacingL)
            }
            .background(Color.uiBackground)
            .navigationTitle("Design System")
        }
    }

    private func designSystemSection<Content: View>(title: String, @ViewBuilder content: () -> Content) -> some View {
        VStack(alignment: .leading, spacing: .spacingM) {
            Text(title)
                .textStyle(.titleLarge)

            content()
        }
    }

    private func colorSwatch(color: Color, name: String) -> some View {
        VStack(spacing: .spacingS) {
            RoundedRectangle(cornerRadius: .radiusMedium)
                .fill(color)
                .frame(height: 60)

            Text(name)
                .textStyle(.labelSmall)
                .foregroundColor(.contentSecondary)
        }
    }

    private func spacingExample(value: CGFloat, name: String) -> some View {
        HStack(spacing: 0) {
            Rectangle()
                .fill(Color.brandPrimary)
                .frame(width: value, height: 30)

            Text(name)
                .textStyle(.bodySmall)
                .foregroundColor(.contentSecondary)
                .padding(.leading, .spacingS)
        }
    }
}

// MARK: - Components Tab

struct ComponentsView: View {
    @State private var isLoading = false

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: .spacingXL) {
                    // Buttons Section
                    componentSection(title: "Buttons") {
                        VStack(spacing: .spacingM) {
                            PrimaryButton(title: "Primary Button", action: {})
                            PrimaryButton(title: "Disabled Button", action: {}, isEnabled: false)
                            PrimaryButton(title: "Loading Button", action: {}, isLoading: true)
                        }
                    }

                    // Cards Section
                    componentSection(title: "Cards") {
                        VStack(spacing: .spacingM) {
                            ProfileCard(
                                name: "Jane Doe",
                                subtitle: "iOS Engineer at Apple",
                                avatarURL: URL(string: "https://i.pravatar.cc/300?img=1"),
                                isVerified: true,
                                onTap: {}
                            )

                            ProfileCard(
                                name: "John Smith",
                                subtitle: "SwiftUI Developer",
                                avatarURL: nil,
                                isVerified: false
                            )
                        }
                    }

                    // Shadows Section
                    componentSection(title: "Shadows") {
                        VStack(spacing: .spacingL) {
                            shadowExample(name: "Small", modifier: { $0.shadowSmall() })
                            shadowExample(name: "Medium", modifier: { $0.shadowMedium() })
                            shadowExample(name: "Large", modifier: { $0.shadowLarge() })
                        }
                    }
                }
                .padding(.spacingL)
            }
            .background(Color.uiBackground)
            .navigationTitle("Components")
        }
    }

    private func componentSection<Content: View>(title: String, @ViewBuilder content: () -> Content) -> some View {
        VStack(alignment: .leading, spacing: .spacingM) {
            Text(title)
                .textStyle(.titleLarge)

            content()
        }
    }

    private func shadowExample<V: View>(name: String, modifier: @escaping (AnyView) -> V) -> some View {
        Text(name)
            .textStyle(.bodyMedium)
            .frame(maxWidth: .infinity)
            .padding(.spacingL)
            .background(Color.uiSurface)
            .cornerRadius(.radiusMedium)
            .modifier(ViewModifierWrapper(modifier: modifier))
    }

    struct ViewModifierWrapper<V: View>: ViewModifier {
        let modifier: (AnyView) -> V

        func body(content: Content) -> some View {
            modifier(AnyView(content))
        }
    }
}

// MARK: - Example Tab

struct ExampleView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: .spacingXL) {
                    // Header
                    VStack(alignment: .leading, spacing: .spacingM) {
                        Text("Welcome Back!")
                            .textStyle(.headlineLarge)

                        Text("This is an example screen demonstrating how to use the design system in a real application.")
                            .textStyle(.bodyMedium)
                            .foregroundColor(.contentSecondary)
                    }

                    // Featured Card
                    VStack(alignment: .leading, spacing: .spacingM) {
                        Image(systemName: "star.fill")
                            .font(.system(size: 48))
                            .foregroundColor(.statusWarning)

                        Text("Featured Content")
                            .textStyle(.titleLarge)

                        Text("This card uses design tokens for consistent styling and automatic dark mode support.")
                            .textStyle(.bodyMedium)
                            .foregroundColor(.contentSecondary)

                        PrimaryButton(title: "Learn More", action: {})
                            .padding(.top, .spacingS)
                    }
                    .padding(.spacingL)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.uiSurface)
                    .cornerRadius(.radiusLarge)
                    .shadowMedium()

                    // Profile Cards
                    VStack(alignment: .leading, spacing: .spacingM) {
                        Text("Team Members")
                            .textStyle(.titleLarge)

                        ProfileCard(
                            name: "Sarah Johnson",
                            subtitle: "Product Manager",
                            avatarURL: URL(string: "https://i.pravatar.cc/300?img=5"),
                            isVerified: true,
                            onTap: {}
                        )

                        ProfileCard(
                            name: "Michael Chen",
                            subtitle: "Lead Designer",
                            avatarURL: URL(string: "https://i.pravatar.cc/300?img=6"),
                            isVerified: true,
                            onTap: {}
                        )

                        ProfileCard(
                            name: "Emily Rodriguez",
                            subtitle: "iOS Developer",
                            avatarURL: URL(string: "https://i.pravatar.cc/300?img=7"),
                            isVerified: false,
                            onTap: {}
                        )
                    }
                }
                .padding(.spacingL)
            }
            .background(Color.uiBackground)
            .navigationTitle("Example")
        }
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
