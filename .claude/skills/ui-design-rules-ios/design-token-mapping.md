# Figma to SwiftUI Design Token Mapping Reference

This document provides comprehensive mapping tables for converting Figma design properties to SwiftUI code.

## Color Mappings

### Figma Variable → Asset Catalog → SwiftUI Extension

| Figma Variable Name | Asset Catalog Path | SwiftUI Extension | Usage |
|---------------------|-------------------|-------------------|-------|
| Primary/500 | Brand/Primary.colorset | `Color.brandPrimary` | Primary CTAs, key brand elements |
| Secondary/500 | Brand/Secondary.colorset | `Color.brandSecondary` | Secondary actions, accents |
| Tertiary/500 | Brand/Tertiary.colorset | `Color.brandTertiary` | Highlights, special elements |
| Background/Light | UI/Background.colorset | `Color.uiBackground` | Screen backgrounds |
| Surface/Light | UI/Surface.colorset | `Color.uiSurface` | Cards, modals, elevated content |
| Divider | UI/Divider.colorset | `Color.uiDivider` | Separator lines |
| Border | UI/Border.colorset | `Color.uiBorder` | Input borders, containers |
| Text/Primary | Content/Primary.colorset | `Color.contentPrimary` | Primary text and icons |
| Text/Secondary | Content/Secondary.colorset | `Color.contentSecondary` | Secondary text |
| Text/Tertiary | Content/Tertiary.colorset | `Color.contentTertiary` | Disabled text, placeholders |
| Success | Status/Success.colorset | `Color.statusSuccess` | Success states |
| Warning | Status/Warning.colorset | `Color.statusWarning` | Warning states |
| Error | Status/Error.colorset | `Color.statusError` | Error states |
| Info | Status/Info.colorset | `Color.statusInfo` | Informational states |

### Color Modes Mapping

| Figma Mode | Asset Catalog Appearance | SwiftUI Automatic |
|------------|--------------------------|-------------------|
| Light | Light Appearance | Auto-switches |
| Dark | Dark Appearance | Auto-switches |
| Default | Any Appearance (fallback) | Used as default |

### Asset Catalog .colorset JSON Structure

```json
{
  "colors" : [
    {
      "color" : {
        "color-space" : "srgb",
        "components" : {
          "alpha" : "1.000",
          "blue" : "1.000",
          "green" : "0.400",
          "red" : "0.000"
        }
      },
      "idiom" : "universal"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "color" : {
        "color-space" : "srgb",
        "components" : {
          "alpha" : "1.000",
          "blue" : "1.000",
          "green" : "0.580",
          "red" : "0.300"
        }
      },
      "idiom" : "universal"
    }
  ],
  "info" : {
    "author" : "xcode",
    "version" : 1
  }
}
```

## Typography Mappings

### Figma Text Style → SwiftUI Font Extension

| Figma Style Name | Font Family | Size (pt) | Weight | SwiftUI Extension | Usage |
|------------------|-------------|-----------|--------|-------------------|-------|
| Display/Large | SF Pro Display | 57 | Regular | `Font.displayLarge` | Splash screens, hero text |
| Display/Medium | SF Pro Display | 45 | Regular | `Font.displayMedium` | Large headers |
| Display/Small | SF Pro Display | 36 | Regular | `Font.displaySmall` | Section headers |
| Headline/Large | SF Pro Display | 32 | Regular | `Font.headlineLarge` | Major sections |
| Headline/Medium | SF Pro Display | 28 | Regular | `Font.headlineMedium` | Subsections |
| Headline/Small | SF Pro Display | 24 | Regular | `Font.headlineSmall` | Card headers |
| Title/Large | SF Pro Text | 22 | Regular | `Font.titleLarge` | Screen titles |
| Title/Medium | SF Pro Text | 16 | Medium | `Font.titleMedium` | List titles |
| Title/Small | SF Pro Text | 14 | Medium | `Font.titleSmall` | Compact titles |
| Body/Large | SF Pro Text | 16 | Regular | `Font.bodyLarge` | Main content (large) |
| Body/Medium | SF Pro Text | 14 | Regular | `Font.bodyMedium` | Main content |
| Body/Small | SF Pro Text | 12 | Regular | `Font.bodySmall` | Captions, fine print |
| Label/Large | SF Pro Text | 14 | Medium | `Font.labelLarge` | Button labels |
| Label/Medium | SF Pro Text | 12 | Medium | `Font.labelMedium` | Form labels |
| Label/Small | SF Pro Text | 11 | Medium | `Font.labelSmall` | Tiny labels, badges |

### Font Weight Conversion

| Figma Weight | Numeric Value | SwiftUI Weight |
|--------------|---------------|----------------|
| Thin | 100 | `.ultraLight` |
| Extra Light | 200 | `.thin` |
| Light | 300 | `.light` |
| Regular | 400 | `.regular` |
| Medium | 500 | `.medium` |
| Semi Bold | 600 | `.semibold` |
| Bold | 700 | `.bold` |
| Extra Bold | 800 | `.heavy` |
| Black | 900 | `.black` |

### Line Height Mapping

| Figma Line Height | SwiftUI Equivalent |
|-------------------|--------------------|
| Auto | Default (no modifier) |
| % value | `.lineSpacing(calculated)` |
| Fixed px | `.lineSpacing(fixedValue - fontSize)` |

### Letter Spacing Mapping

| Figma Tracking | SwiftUI Equivalent |
|----------------|--------------------|
| 0% | Default (no modifier) |
| X% | `.tracking(fontSize * X / 100)` |
| X px | `.kerning(X)` |

## Spacing Mappings

### Figma Padding/Gap → SwiftUI Spacing

| Figma Value (px) | Token Name | SwiftUI Constant | Usage |
|------------------|------------|------------------|-------|
| 2 | spacing-xxs | `CGFloat.spacingXXS` | Minimal spacing, tight elements |
| 4 | spacing-xs | `CGFloat.spacingXS` | Icon-text gap |
| 8 | spacing-s | `CGFloat.spacingS` | Related elements |
| 16 | spacing-m | `CGFloat.spacingM` | Default gap, standard padding |
| 24 | spacing-l | `CGFloat.spacingL` | Section separation |
| 32 | spacing-xl | `CGFloat.spacingXL` | Major sections |
| 48 | spacing-xxl | `CGFloat.spacingXXL` | Screen margins |
| 64 | spacing-xxxl | `CGFloat.spacingXXXL` | Hero spacing |

### Auto Layout Properties → SwiftUI Stack Parameters

| Figma Property | Figma Value | SwiftUI Equivalent |
|----------------|-------------|--------------------|
| Direction | Horizontal | `HStack` |
| Direction | Vertical | `VStack` |
| Primary axis alignment | Packed | Default (leading/top) |
| Primary axis alignment | Space Between | `Spacer()` between items |
| Counter axis alignment | Top/Left | `.leading` or `.top` |
| Counter axis alignment | Center | `.center` |
| Counter axis alignment | Bottom/Right | `.trailing` or `.bottom` |
| Item Spacing | X px | `spacing: .spacingToken` |
| Padding Left | X px | `.padding(.leading, .spacingToken)` |
| Padding Right | X px | `.padding(.trailing, .spacingToken)` |
| Padding Top | X px | `.padding(.top, .spacingToken)` |
| Padding Bottom | X px | `.padding(.bottom, .spacingToken)` |
| Padding All | X px | `.padding(.spacingToken)` |

### Resizing Behavior → SwiftUI Modifiers

| Figma Resize | Horizontal | Vertical | SwiftUI Equivalent |
|--------------|------------|----------|-------------------|
| Hug | Hug | Hug | No `.frame()` modifier |
| Fill | Fill | Hug | `.frame(maxWidth: .infinity)` |
| Hug | Hug | Fill | `.frame(maxHeight: .infinity)` |
| Fill | Fill | Fill | `.frame(maxWidth: .infinity, maxHeight: .infinity)` |
| Fixed | Fixed (W) | Fixed (H) | `.frame(width: W, height: H)` |

## Effect Mappings

### Shadows

| Figma Property | Example Value | SwiftUI Equivalent |
|----------------|---------------|-------------------|
| Drop Shadow (small) | X:0, Y:1, Blur:4, #000 4% | `.shadow(color: Color.black.opacity(0.04), radius: 4, x: 0, y: 1)` |
| Drop Shadow (medium) | X:0, Y:2, Blur:8, #000 8% | `.shadow(color: Color.black.opacity(0.08), radius: 8, x: 0, y: 2)` |
| Drop Shadow (large) | X:0, Y:4, Blur:16, #000 12% | `.shadow(color: Color.black.opacity(0.12), radius: 16, x: 0, y: 4)` |
| Inner Shadow | N/A | Not directly supported (use overlay) |

#### Shadow Token Extensions

```swift
extension View {
    func shadowSmall() -> some View {
        shadow(color: Color.black.opacity(0.04), radius: 4, x: 0, y: 1)
    }

    func shadowMedium() -> some View {
        shadow(color: Color.black.opacity(0.08), radius: 8, x: 0, y: 2)
    }

    func shadowLarge() -> some View {
        shadow(color: Color.black.opacity(0.12), radius: 16, x: 0, y: 4)
    }
}
```

### Corner Radius

| Figma Value (px) | Token Name | SwiftUI Constant | Usage |
|------------------|------------|------------------|-------|
| 4 | radius-small | `CGFloat.radiusSmall` | Buttons (small), chips |
| 8 | radius-medium | `CGFloat.radiusMedium` | Buttons, inputs |
| 12 | radius-large | `CGFloat.radiusLarge` | Cards |
| 16 | radius-xlarge | `CGFloat.radiusXLarge` | Large cards, modals |
| 999 | radius-round | `CGFloat.radiusRound` | Fully rounded (pills, avatars) |

### Border/Stroke

| Figma Property | Example Value | SwiftUI Equivalent |
|----------------|---------------|-------------------|
| Stroke Width | 1px | `.overlay(RoundedRectangle(cornerRadius: X).stroke(Color.uiBorder, lineWidth: 1))` |
| Stroke Color | #E0E0E0 | Use `Color.uiBorder` token |
| Stroke Position | Inside | Default with `.overlay()` |
| Stroke Position | Outside | Use `.border()` or padding trick |
| Stroke Position | Center | Default with `.stroke()` on Shape |

### Blur

| Figma Effect | Blur Amount | SwiftUI Equivalent |
|--------------|-------------|-------------------|
| Layer Blur | X px | `.blur(radius: X)` |
| Background Blur | X px | `.background(.ultraThinMaterial)` (iOS 15+) |

## Component-Specific Mappings

### Button States

| Figma Variant | State Property | SwiftUI Implementation |
|---------------|----------------|------------------------|
| Default | - | Base styling |
| Hover | isHovered | `.onHover { isHovered = $0 }` |
| Pressed | isPressed | Button's built-in press state or custom `DragGesture` |
| Disabled | isEnabled: false | `.disabled(!isEnabled)` + opacity/color change |
| Loading | isLoading | Show `ProgressView()`, disable interaction |

### Input States

| Figma Variant | State Property | SwiftUI Implementation |
|---------------|----------------|------------------------|
| Default | - | Base styling |
| Focused | isFocused | `@FocusState` binding (iOS 15+) |
| Error | hasError | Conditional border color/message |
| Disabled | isEnabled: false | `.disabled(true)` |
| Filled | text.isEmpty | Conditional styling based on text content |

### Icons

| Figma Icon Type | SwiftUI Equivalent |
|-----------------|-------------------|
| SF Symbol name | `Image(systemName: "heart.fill")` |
| Custom vector | Export as PDF, add to Assets, use `Image("iconName")` |
| Simple shape | Recreate with `Path`, `Circle`, `Rectangle`, etc. |

## Layout Conversion Patterns

### Flex Layout → Stack Alignment

| Figma Align Items | SwiftUI HStack Alignment | SwiftUI VStack Alignment |
|-------------------|--------------------------|--------------------------|
| Top / Left | `.top` | `.leading` |
| Center | `.center` | `.center` |
| Bottom / Right | `.bottom` | `.trailing` |
| Baseline | `.firstTextBaseline` | - |

### Absolute Positioning → SwiftUI Layout

| Figma Layout | Recommended SwiftUI Approach |
|--------------|------------------------------|
| X/Y coordinates | Avoid; use stacks + spacers |
| Constraints (left/right) | `.frame(maxWidth: .infinity)` + padding |
| Constraints (top/bottom) | `.frame(maxHeight: .infinity)` + padding |
| Centered | `Spacer()` on both sides or `.frame(maxWidth: .infinity)` + `.multilineTextAlignment(.center)` |

### Z-Index / Layer Order

| Figma Layer Order | SwiftUI Equivalent |
|-------------------|--------------------|
| Top layer | Last in `ZStack` |
| Bottom layer | First in `ZStack` |
| Bring forward | `.zIndex(higher number)` |
| Send backward | `.zIndex(lower number)` |

## Accessibility Mappings

### Figma Annotation → SwiftUI Modifier

| Figma Accessibility | SwiftUI Modifier | Example |
|---------------------|------------------|---------|
| Label | `.accessibilityLabel()` | `.accessibilityLabel("Add to cart")` |
| Hint | `.accessibilityHint()` | `.accessibilityHint("Adds item to shopping cart")` |
| Value | `.accessibilityValue()` | `.accessibilityValue("50% complete")` |
| Role | `.accessibilityAddTraits()` | `.accessibilityAddTraits(.isButton)` |
| Hidden | `.accessibilityHidden()` | `.accessibilityHidden(true)` |
| Grouped | `.accessibilityElement(children:)` | `.accessibilityElement(children: .combine)` |

## Quick Reference: Common Conversions

### Figma Frame → SwiftUI View

```
Figma Frame "Login Button"
├─ Width: Fill (300px)
├─ Height: Fixed (48px)
├─ Padding: 16px all sides
├─ Background: Primary/500
├─ Corner Radius: 8px
└─ Text: "Log In" (Label/Large, white)

↓↓↓

Button(action: loginAction) {
    Text("Log In")
        .font(.labelLarge)
        .foregroundColor(.white)
        .frame(maxWidth: .infinity)
        .frame(height: 48)
        .padding(.spacingM)
        .background(Color.brandPrimary)
        .cornerRadius(.radiusMedium)
}
```

### Figma Component with Variants → SwiftUI Enum-Based Component

```
Figma Component "Button"
Variants:
├─ Style: Primary / Secondary / Tertiary
└─ Size: Small / Medium / Large

↓↓↓

enum ButtonStyle { case primary, secondary, tertiary }
enum ButtonSize { case small, medium, large }

struct ConfigurableButton: View {
    let title: String
    let style: ButtonStyle
    let size: ButtonSize
    let action: () -> Void
    // ... implementation
}
```

## Conversion Tools

### Color Conversion

```swift
// Figma RGBA (0-1 range) to Hex
func rgbaToHex(r: Double, g: Double, b: Double, a: Double) -> String {
    String(format: "#%02X%02X%02X", Int(r * 255), Int(g * 255), Int(b * 255))
}

// Hex to SwiftUI Color (via extension)
extension Color {
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
```

## Notes & Best Practices

1. **Always prioritize semantic naming** over visual naming (e.g., `brandPrimary` not `blue`)
2. **Use Asset Catalog for all colors** to enable automatic dark mode support
3. **Create spacing/sizing tokens** even if Figma doesn't have variables
4. **Test in both light and dark mode** before marking conversion complete
5. **Add accessibility labels** to all interactive elements
6. **Use preview providers** to showcase multiple states and appearances
7. **Document any manual adjustments** made during conversion (e.g., responsive layout changes)
