# SwiftUI Code Generation Patterns

This document provides code templates and patterns for generating production-ready SwiftUI components from Figma designs.

## Design Token Patterns

### Color Token System

```swift
// DesignSystem/Tokens/ColorTokens.swift
import SwiftUI

extension Color {
    // MARK: - Brand Colors
    /// Primary brand color - Main CTAs and key elements
    /// Light: #0066FF, Dark: #4D94FF
    static let brandPrimary = Color("Brand/Primary")

    /// Secondary brand color - Accents and secondary actions
    /// Light: #00C896, Dark: #00E5A8
    static let brandSecondary = Color("Brand/Secondary")

    /// Tertiary brand color - Highlights and special elements
    /// Light: #FF6B35, Dark: #FF8C5E
    static let brandTertiary = Color("Brand/Tertiary")

    // MARK: - UI Colors
    /// Main background color for screens
    /// Light: #FFFFFF, Dark: #000000
    static let uiBackground = Color("UI/Background")

    /// Surface color for cards, modals, elevated content
    /// Light: #FFFFFF, Dark: #1C1C1E
    static let uiSurface = Color("UI/Surface")

    /// Divider lines between sections
    /// Light: #E5E5EA, Dark: #38383A
    static let uiDivider = Color("UI/Divider")

    /// Border color for inputs and containers
    /// Light: #D1D1D6, Dark: #48484A
    static let uiBorder = Color("UI/Border")

    // MARK: - Content Colors
    /// Primary text and icons
    /// Light: #000000, Dark: #FFFFFF
    static let contentPrimary = Color("Content/Primary")

    /// Secondary text and icons - Less emphasis
    /// Light: #6C6C70, Dark: #AEAEB2
    static let contentSecondary = Color("Content/Secondary")

    /// Tertiary text and icons - Least emphasis
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
```

### Typography Token System

```swift
// DesignSystem/Tokens/TypographyTokens.swift
import SwiftUI

extension Font {
    // MARK: - Display (Largest text)
    static let displayLarge = Font.system(size: 57, weight: .regular)
    static let displayMedium = Font.system(size: 45, weight: .regular)
    static let displaySmall = Font.system(size: 36, weight: .regular)

    // MARK: - Headline (Section headers)
    static let headlineLarge = Font.system(size: 32, weight: .regular)
    static let headlineMedium = Font.system(size: 28, weight: .regular)
    static let headlineSmall = Font.system(size: 24, weight: .regular)

    // MARK: - Title (Card titles, list headers)
    static let titleLarge = Font.system(size: 22, weight: .regular)
    static let titleMedium = Font.system(size: 16, weight: .medium)
    static let titleSmall = Font.system(size: 14, weight: .medium)

    // MARK: - Body (Main content text)
    static let bodyLarge = Font.system(size: 16, weight: .regular)
    static let bodyMedium = Font.system(size: 14, weight: .regular)
    static let bodySmall = Font.system(size: 12, weight: .regular)

    // MARK: - Label (Button labels, form labels)
    static let labelLarge = Font.system(size: 14, weight: .medium)
    static let labelMedium = Font.system(size: 12, weight: .medium)
    static let labelSmall = Font.system(size: 11, weight: .medium)
}

// MARK: - Text Style Enum
enum TextStyle {
    case displayLarge, displayMedium, displaySmall
    case headlineLarge, headlineMedium, headlineSmall
    case titleLarge, titleMedium, titleSmall
    case bodyLarge, bodyMedium, bodySmall
    case labelLarge, labelMedium, labelSmall

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
        case .displayLarge, .displayMedium, .displaySmall,
             .headlineLarge, .headlineMedium, .headlineSmall,
             .titleLarge, .titleMedium, .titleSmall:
            return .contentPrimary
        case .bodyLarge, .bodyMedium:
            return .contentPrimary
        case .bodySmall, .labelLarge, .labelMedium, .labelSmall:
            return .contentSecondary
        }
    }
}

// MARK: - Text Style Modifier
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
    func textStyle(_ style: TextStyle, color: Color? = nil) -> some View {
        modifier(TextStyleModifier(style: style, color: color))
    }
}
```

### Spacing Token System

```swift
// DesignSystem/Tokens/SpacingTokens.swift
import SwiftUI

extension CGFloat {
    // MARK: - Spacing Scale (8pt grid)

    /// 2pt - Minimal spacing for very tight elements
    static let spacingXXS: CGFloat = 2

    /// 4pt - Very small spacing (icon-text gap)
    static let spacingXS: CGFloat = 4

    /// 8pt - Small spacing for related elements
    static let spacingS: CGFloat = 8

    /// 16pt - Medium spacing (default gap)
    static let spacingM: CGFloat = 16

    /// 24pt - Large spacing for section separation
    static let spacingL: CGFloat = 24

    /// 32pt - Extra large spacing for major sections
    static let spacingXL: CGFloat = 32

    /// 48pt - Double extra large (screen margins)
    static let spacingXXL: CGFloat = 48

    /// 64pt - Triple extra large (hero spacing)
    static let spacingXXXL: CGFloat = 64
}

// MARK: - Edge Insets Helper
extension EdgeInsets {
    static func all(_ value: CGFloat) -> EdgeInsets {
        EdgeInsets(top: value, leading: value, bottom: value, trailing: value)
    }

    static func horizontal(_ value: CGFloat) -> EdgeInsets {
        EdgeInsets(top: 0, leading: value, bottom: 0, trailing: value)
    }

    static func vertical(_ value: CGFloat) -> EdgeInsets {
        EdgeInsets(top: value, leading: 0, bottom: value, trailing: 0)
    }
}
```

### Shadow and Radius Tokens

```swift
// DesignSystem/Tokens/ShadowTokens.swift
import SwiftUI

extension View {
    /// Small shadow - Subtle elevation
    /// Blur: 4pt, Offset: (0, 1), Opacity: 4%
    func shadowSmall() -> some View {
        self.shadow(color: Color.black.opacity(0.04), radius: 4, x: 0, y: 1)
    }

    /// Medium shadow - Standard elevation
    /// Blur: 8pt, Offset: (0, 2), Opacity: 8%
    func shadowMedium() -> some View {
        self.shadow(color: Color.black.opacity(0.08), radius: 8, x: 0, y: 2)
    }

    /// Large shadow - High elevation
    /// Blur: 16pt, Offset: (0, 4), Opacity: 12%
    func shadowLarge() -> some View {
        self.shadow(color: Color.black.opacity(0.12), radius: 16, x: 0, y: 4)
    }

    /// Extra large shadow - Maximum elevation
    /// Blur: 24pt, Offset: (0, 8), Opacity: 16%
    func shadowXLarge() -> some View {
        self.shadow(color: Color.black.opacity(0.16), radius: 24, x: 0, y: 8)
    }
}

// DesignSystem/Tokens/RadiusTokens.swift
import SwiftUI

extension CGFloat {
    // MARK: - Corner Radius Scale

    /// 4pt - Small radius for buttons, chips
    static let radiusSmall: CGFloat = 4

    /// 8pt - Medium radius for buttons, inputs
    static let radiusMedium: CGFloat = 8

    /// 12pt - Large radius for cards
    static let radiusLarge: CGFloat = 12

    /// 16pt - Extra large radius for large cards, modals
    static let radiusXLarge: CGFloat = 16

    /// 20pt - Double extra large for special elements
    static let radiusXXLarge: CGFloat = 20

    /// 999pt - Fully rounded (pills, avatars)
    static let radiusRound: CGFloat = 999
}
```

## Component Patterns

### Button Components

```swift
// DesignSystem/Components/Buttons/PrimaryButton.swift
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
            .background(
                isEnabled ? Color.brandPrimary : Color.contentTertiary
            )
            .cornerRadius(.radiusMedium)
        }
        .disabled(!isEnabled || isLoading)
        .accessibilityLabel(title)
        .accessibilityAddTraits(.isButton)
        .accessibilityValue(isLoading ? "Loading" : "")
        .accessibilityHint(isEnabled ? "" : "Button is disabled")
    }
}

// DesignSystem/Components/Buttons/SecondaryButton.swift
import SwiftUI

struct SecondaryButton: View {
    let title: String
    let action: () -> Void
    var isEnabled: Bool = true
    var fullWidth: Bool = true

    var body: some View {
        Button(action: action) {
            Text(title)
                .textStyle(.labelLarge, color: isEnabled ? .brandPrimary : .contentTertiary)
                .frame(maxWidth: fullWidth ? .infinity : nil)
                .padding(.vertical, .spacingM)
                .padding(.horizontal, .spacingL)
                .background(Color.uiSurface)
                .overlay(
                    RoundedRectangle(cornerRadius: .radiusMedium)
                        .stroke(isEnabled ? Color.brandPrimary : Color.contentTertiary, lineWidth: 2)
                )
        }
        .disabled(!isEnabled)
        .accessibilityLabel(title)
        .accessibilityAddTraits(.isButton)
    }
}

// DesignSystem/Components/Buttons/TextButton.swift
import SwiftUI

struct TextButton: View {
    let title: String
    let action: () -> Void
    var isEnabled: Bool = true

    var body: some View {
        Button(action: action) {
            Text(title)
                .textStyle(.labelMedium, color: isEnabled ? .brandPrimary : .contentTertiary)
                .padding(.vertical, .spacingS)
                .padding(.horizontal, .spacingM)
        }
        .disabled(!isEnabled)
        .accessibilityLabel(title)
        .accessibilityAddTraits(.isButton)
    }
}

// Usage Examples
#Preview("Button Variants") {
    VStack(spacing: .spacingL) {
        PrimaryButton(title: "Primary Button", action: {})
        PrimaryButton(title: "Disabled", action: {}, isEnabled: false)
        PrimaryButton(title: "Loading", action: {}, isLoading: true)

        SecondaryButton(title: "Secondary Button", action: {})
        SecondaryButton(title: "Disabled", action: {}, isEnabled: false)

        TextButton(title: "Text Button", action: {})
        TextButton(title: "Disabled", action: {}, isEnabled: false)
    }
    .padding()
    .background(Color.uiBackground)
}
```

### Card Components

```swift
// DesignSystem/Components/Cards/ContentCard.swift
import SwiftUI

struct ContentCard: View {
    let title: String
    let description: String
    let imageURL: URL?
    var onTap: (() -> Void)?

    var body: some View {
        Button(action: { onTap?() }) {
            VStack(alignment: .leading, spacing: .spacingM) {
                // Image
                if let imageURL {
                    AsyncImage(url: imageURL) { phase in
                        switch phase {
                        case .empty:
                            placeholderView
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        case .failure:
                            placeholderView
                                .overlay(
                                    Image(systemName: "photo")
                                        .foregroundColor(.contentTertiary)
                                )
                        @unknown default:
                            placeholderView
                        }
                    }
                    .frame(height: 200)
                    .clipped()
                }

                // Content
                VStack(alignment: .leading, spacing: .spacingS) {
                    Text(title)
                        .textStyle(.titleMedium)
                        .lineLimit(2)

                    Text(description)
                        .textStyle(.bodySmall)
                        .foregroundColor(.contentSecondary)
                        .lineLimit(3)
                }
                .padding(.horizontal, .spacingM)
                .padding(.bottom, .spacingM)
            }
        }
        .buttonStyle(PlainButtonStyle())
        .background(Color.uiSurface)
        .cornerRadius(.radiusLarge)
        .shadowMedium()
        .accessibilityElement(children: .combine)
        .accessibilityLabel("\(title), \(description)")
        .accessibilityAddTraits(onTap != nil ? .isButton : [])
    }

    private var placeholderView: some View {
        Color.uiSurface
    }
}

// DesignSystem/Components/Cards/ProfileCard.swift
import SwiftUI

struct ProfileCard: View {
    let name: String
    let subtitle: String
    let avatarURL: URL?
    var isVerified: Bool = false
    var onTap: (() -> Void)?

    var body: some View {
        Button(action: { onTap?() }) {
            HStack(spacing: .spacingM) {
                // Avatar
                AsyncImage(url: avatarURL) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    default:
                        Color.uiSurface
                            .overlay(
                                Image(systemName: "person.fill")
                                    .foregroundColor(.contentTertiary)
                            )
                    }
                }
                .frame(width: 56, height: 56)
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(Color.uiBorder, lineWidth: 1)
                )

                // Content
                VStack(alignment: .leading, spacing: .spacingXS) {
                    HStack(spacing: .spacingXS) {
                        Text(name)
                            .textStyle(.titleMedium)
                            .lineLimit(1)

                        if isVerified {
                            Image(systemName: "checkmark.seal.fill")
                                .foregroundColor(.brandPrimary)
                                .font(.labelSmall)
                                .accessibilityLabel("Verified")
                        }
                    }

                    Text(subtitle)
                        .textStyle(.bodySmall)
                        .foregroundColor(.contentSecondary)
                        .lineLimit(1)
                }

                Spacer()

                if onTap != nil {
                    Image(systemName: "chevron.right")
                        .foregroundColor(.contentTertiary)
                        .font(.labelMedium)
                }
            }
            .padding(.spacingM)
        }
        .buttonStyle(PlainButtonStyle())
        .background(Color.uiSurface)
        .cornerRadius(.radiusLarge)
        .shadowSmall()
        .accessibilityElement(children: .combine)
        .accessibilityLabel("\(name), \(subtitle)\(isVerified ? ", Verified" : "")")
        .accessibilityAddTraits(onTap != nil ? .isButton : [])
    }
}

#Preview("Card Components") {
    ScrollView {
        VStack(spacing: .spacingL) {
            ContentCard(
                title: "SwiftUI Best Practices",
                description: "Learn the latest patterns for building modern iOS apps with SwiftUI",
                imageURL: URL(string: "https://picsum.photos/400/300"),
                onTap: {}
            )

            ProfileCard(
                name: "Jane Doe",
                subtitle: "iOS Engineer",
                avatarURL: URL(string: "https://i.pravatar.cc/300?img=1"),
                isVerified: true,
                onTap: {}
            )
        }
        .padding()
    }
    .background(Color.uiBackground)
}
```

### Input Components

```swift
// DesignSystem/Components/Inputs/CustomTextField.swift
import SwiftUI

struct CustomTextField: View {
    let placeholder: String
    @Binding var text: String
    var isSecure: Bool = false
    var keyboardType: UIKeyboardType = .default
    var textContentType: UITextContentType?
    var errorMessage: String?
    @FocusState private var isFocused: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: .spacingXS) {
            // Input field
            Group {
                if isSecure {
                    SecureField(placeholder, text: $text)
                } else {
                    TextField(placeholder, text: $text)
                }
            }
            .textStyle(.bodyMedium)
            .padding(.spacingM)
            .background(Color.uiSurface)
            .overlay(
                RoundedRectangle(cornerRadius: .radiusMedium)
                    .stroke(borderColor, lineWidth: isFocused ? 2 : 1)
            )
            .keyboardType(keyboardType)
            .textContentType(textContentType)
            .autocapitalization(.none)
            .focused($isFocused)
            .accessibilityLabel(placeholder)

            // Error message
            if let errorMessage {
                Text(errorMessage)
                    .textStyle(.bodySmall, color: .statusError)
                    .padding(.leading, .spacingS)
            }
        }
    }

    private var borderColor: Color {
        if let _ = errorMessage {
            return .statusError
        } else if isFocused {
            return .brandPrimary
        } else {
            return .uiBorder
        }
    }
}

#Preview("Text Fields") {
    VStack(spacing: .spacingL) {
        CustomTextField(
            placeholder: "Email",
            text: .constant(""),
            keyboardType: .emailAddress,
            textContentType: .emailAddress
        )

        CustomTextField(
            placeholder: "Password",
            text: .constant(""),
            isSecure: true,
            textContentType: .password
        )

        CustomTextField(
            placeholder: "Email",
            text: .constant("invalid@"),
            keyboardType: .emailAddress,
            errorMessage: "Please enter a valid email address"
        )
    }
    .padding()
    .background(Color.uiBackground)
}
```

## Layout Patterns

### Screen Template Pattern

```swift
// Features/FeatureName/Views/FeatureNameView.swift
import SwiftUI

struct FeatureNameView: View {
    @StateObject private var viewModel = FeatureNameViewModel()

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: .spacingL) {
                    // Header section
                    headerSection

                    // Main content
                    contentSection

                    // Actions
                    actionsSection
                }
                .padding(.spacingL)
            }
            .background(Color.uiBackground)
            .navigationTitle("Feature Name")
            .navigationBarTitleDisplayMode(.large)
        }
    }

    private var headerSection: some View {
        VStack(alignment: .leading, spacing: .spacingM) {
            Text("Welcome")
                .textStyle(.headlineMedium)

            Text("This is a description of the feature")
                .textStyle(.bodyMedium)
                .foregroundColor(.contentSecondary)
        }
    }

    private var contentSection: some View {
        VStack(spacing: .spacingM) {
            // Content here
            ForEach(0..<3) { index in
                ContentCard(
                    title: "Item \(index + 1)",
                    description: "Description for item \(index + 1)",
                    imageURL: nil
                )
            }
        }
    }

    private var actionsSection: some View {
        VStack(spacing: .spacingM) {
            PrimaryButton(title: "Primary Action", action: {})
            SecondaryButton(title: "Secondary Action", action: {})
        }
    }
}

#Preview {
    FeatureNameView()
}
```

### List Pattern with Sections

```swift
import SwiftUI

struct SectionedListView: View {
    let sections: [Section]

    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: .spacingL, pinnedViews: [.sectionHeaders]) {
                ForEach(sections) { section in
                    SwiftUI.Section {
                        ForEach(section.items) { item in
                            itemRow(item)
                        }
                    } header: {
                        sectionHeader(section.title)
                    }
                }
            }
            .padding(.spacingL)
        }
        .background(Color.uiBackground)
    }

    private func sectionHeader(_ title: String) -> some View {
        Text(title)
            .textStyle(.titleMedium)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical, .spacingS)
            .background(Color.uiBackground)
    }

    private func itemRow(_ item: Item) -> some View {
        HStack(spacing: .spacingM) {
            Text(item.title)
                .textStyle(.bodyMedium)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundColor(.contentTertiary)
                .font(.labelSmall)
        }
        .padding(.spacingM)
        .background(Color.uiSurface)
        .cornerRadius(.radiusMedium)
    }
}

struct Section: Identifiable {
    let id = UUID()
    let title: String
    let items: [Item]
}

struct Item: Identifiable {
    let id = UUID()
    let title: String
}
```

### Empty State Pattern

```swift
import SwiftUI

struct EmptyStateView: View {
    let icon: String
    let title: String
    let message: String
    var actionTitle: String?
    var action: (() -> Void)?

    var body: some View {
        VStack(spacing: .spacingL) {
            Spacer()

            Image(systemName: icon)
                .font(.system(size: 64))
                .foregroundColor(.contentTertiary)

            VStack(spacing: .spacingS) {
                Text(title)
                    .textStyle(.titleLarge)

                Text(message)
                    .textStyle(.bodyMedium)
                    .foregroundColor(.contentSecondary)
                    .multilineTextAlignment(.center)
            }

            if let actionTitle, let action {
                PrimaryButton(title: actionTitle, action: action, fullWidth: false)
                    .padding(.top, .spacingM)
            }

            Spacer()
        }
        .padding(.spacingXL)
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    EmptyStateView(
        icon: "tray",
        title: "No Items",
        message: "You don't have any items yet. Tap the button below to get started.",
        actionTitle: "Add Item",
        action: {}
    )
    .background(Color.uiBackground)
}
```

## Preview Patterns

### Multiple State Previews

```swift
#Preview("Component States") {
    VStack(spacing: .spacingXL) {
        Group {
            Text("Default State")
                .textStyle(.titleSmall)
            ComponentView()
        }

        Group {
            Text("Loading State")
                .textStyle(.titleSmall)
            ComponentView(isLoading: true)
        }

        Group {
            Text("Error State")
                .textStyle(.titleSmall)
            ComponentView(hasError: true)
        }

        Group {
            Text("Empty State")
                .textStyle(.titleSmall)
            ComponentView(isEmpty: true)
        }
    }
    .padding()
    .background(Color.uiBackground)
}
```

### Light and Dark Mode Preview

```swift
#Preview("Light Mode") {
    ContentView()
        .preferredColorScheme(.light)
}

#Preview("Dark Mode") {
    ContentView()
        .preferredColorScheme(.dark)
}
```

### Device Size Previews

```swift
#Preview("iPhone SE") {
    ContentView()
        .previewDevice(PreviewDevice(rawValue: "iPhone SE (3rd generation)"))
}

#Preview("iPhone 15 Pro") {
    ContentView()
        .previewDevice(PreviewDevice(rawValue: "iPhone 15 Pro"))
}

#Preview("iPad Pro") {
    ContentView()
        .previewDevice(PreviewDevice(rawValue: "iPad Pro (12.9-inch) (6th generation)"))
}
```

## Best Practices Summary

1. **Always use design tokens** - Never hardcode colors, fonts, or spacing
2. **Provide accessibility labels** - Every interactive element needs proper accessibility support
3. **Create multiple previews** - Show default, loading, error, and empty states
4. **Test dark mode** - Always preview components in both light and dark modes
5. **Use semantic naming** - Name based on purpose, not appearance
6. **Extract reusable components** - Don't repeat yourself
7. **Document complex logic** - Add comments for non-obvious code
8. **Follow SwiftUI conventions** - Use proper state management patterns
9. **Keep views focused** - Each view should have a single responsibility
10. **Optimize performance** - Use LazyVStack/LazyHStack for long lists

## Code Quality Checklist

Before marking code generation complete:

- [ ] All colors use design tokens (no hardcoded hex values)
- [ ] All fonts use typography tokens
- [ ] All spacing uses spacing tokens
- [ ] Accessibility labels added to interactive elements
- [ ] Preview providers created with multiple states
- [ ] Dark mode tested and verified
- [ ] Code follows feature-based organization
- [ ] No force unwrapping (no `!` operator)
- [ ] Proper error handling in place
- [ ] Documentation comments added where needed
