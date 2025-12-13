# AI iOS Starter

A production-ready iOS starter template for building AI-powered applications with Claude Code integration. Features a complete design system, SwiftUI components, and MVVM architecture.

## Features

- **Complete Design System**: Production-ready design tokens for colors, typography, spacing, shadows, and corner radii
- **Dark Mode Support**: Automatic dark mode via Asset Catalog color sets
- **SwiftUI Components**: Reusable components (buttons, cards) built with design tokens
- **MVVM Architecture**: Organized project structure with Features/ folders
- **Accessibility**: Built-in accessibility support with proper labels and dynamic type
- **Claude Code Integration**: Sub-agents, skills, and MCP servers for AI-assisted development

## Project Structure

```
AIiOSStarter/
├── AIiOSStarter/
│   ├── AIiOSStarterApp.swift          # App entry point
│   ├── ContentView.swift              # Root content view
│   └── DesignSystem/
│       ├── Tokens/
│       │   ├── ColorTokens.swift      # Semantic color system
│       │   ├── TypographyTokens.swift # Typography scale
│       │   ├── SpacingTokens.swift    # 8pt grid spacing
│       │   ├── RadiusTokens.swift     # Corner radius scale
│       │   └── ShadowTokens.swift     # Elevation system
│       ├── Components/
│       │   ├── Buttons/
│       │   │   └── PrimaryButton.swift
│       │   └── Cards/
│       │       └── ProfileCard.swift
│       ├── Modifiers/                 # Custom view modifiers
│       └── Features/                  # Feature modules (MVVM)
│           ├── Home/
│           ├── Profile/
│           └── Authentication/
└── Assets.xcassets/
    ├── Brand/                          # Brand colors
    ├── UI/                             # UI colors
    ├── Content/                        # Content colors
    └── Status/                         # Status colors

.claude/
├── agents/
│   ├── ios-developer.md                # General iOS/SwiftUI developer
│   └── figma-to-ios-frontend.md        # Figma → SwiftUI converter (optional)
├── skills/
│   └── ui-design-rules-ios/            # Design system patterns & token mapping
└── mcp.json                            # MCP server configuration
```

## Design System

### Color Tokens

The design system includes semantic color tokens organized into categories:

- **Brand**: Primary, Secondary, Tertiary
- **UI**: Background, Surface, Border
- **Content**: Primary, Secondary, Tertiary
- **Status**: Success, Warning, Error, Info

All colors support automatic dark mode through Asset Catalog color sets.

### Typography

Typography tokens follow Material Design 3 principles:
- Display: Large, Medium, Small
- Headline: Large, Medium, Small
- Title: Large, Medium, Small
- Body: Large, Medium, Small
- Label: Large, Medium, Small

### Spacing

8pt grid system with semantic naming:
- XS: 4pt
- S: 8pt
- M: 16pt
- L: 24pt
- XL: 32pt
- XXL: 48pt

## Claude Code Integration

This starter includes Claude Code configuration for AI-assisted development:

### Sub-Agents

1. **ios-developer**: General iOS/SwiftUI development agent
   - Builds features using the design system
   - Follows MVVM architecture
   - Implements proper accessibility

2. **figma-to-ios-frontend** (Optional): Converts Figma designs to SwiftUI
   - Connects to Figma MCP server
   - Generates production-ready SwiftUI views
   - Maps design tokens automatically

### Skills

- **ui-design-rules-ios**: Expert knowledge for design tokens and SwiftUI patterns

### MCP Servers

- **Figma MCP** (Optional): For Figma design conversion
  - Local: `http://127.0.0.1:3845/mcp`
  - Remote: `https://mcp.figma.com/mcp`

## Getting Started

### Prerequisites

- Xcode 15.0 or later
- iOS 17.0 or later
- Claude Code CLI (optional, for AI-assisted development)

### Installation

1. Clone the repository
2. Open `AIiOSStarter.xcodeproj` in Xcode
3. Build and run (⌘+R)

### Using with Claude Code

1. Install Claude Code:
   ```bash
   brew install claude
   ```

2. Navigate to the project directory:
   ```bash
   cd path/to/Claude-Code-Feature-Playground
   ```

3. Start Claude Code:
   ```bash
   claude
   ```

4. Use sub-agents for development:
   ```
   > Use ios-developer agent to add a new feature
   ```

## Building Features

### Using the Design System

```swift
import SwiftUI

struct MyView: View {
    var body: some View {
        VStack(spacing: .spacingM) {
            Text("Hello, World!")
                .textStyle(.headlineLarge)
                .foregroundColor(.contentPrimary)

            PrimaryButton(title: "Get Started") {
                // Action here
            }
        }
        .padding(.spacingL)
        .background(Color.uiBackground)
    }
}
```

### MVVM Pattern

Organize features using MVVM architecture:

```
Features/
└── MyFeature/
    ├── Views/
    │   └── MyFeatureView.swift
    ├── ViewModels/
    │   └── MyFeatureViewModel.swift
    └── Models/
        └── MyFeatureModel.swift
```

## Optional: Figma Integration

The starter includes optional Figma integration for converting designs to SwiftUI:

1. Install Figma MCP server (see [docs/MCP_SETUP.md](docs/MCP_SETUP.md))

2. Enable Figma MCP in `.claude/mcp.json`:
   ```json
   {
     "mcpServers": {
       "figma-remote": {
         "url": "https://mcp.figma.com/mcp",
         "enabled": true
       }
     }
   }
   ```

3. Use the figma-to-ios-frontend agent:
   ```
   > Use figma-to-ios-frontend agent to convert [Figma URL] to SwiftUI
   ```

## Roadmap

Future sub-agents and tools to be added:

- **architect**: Software architecture planning and design
- **unit-tester**: Automated unit test generation
- **ai-engineer**: AI/ML model integration specialist
- **performance-optimizer**: App performance analysis and optimization
- **accessibility-auditor**: Accessibility compliance checker

## Contributing

This is a starter template. Feel free to customize it for your needs:

1. Update color tokens in `Assets.xcassets`
2. Add custom components to `DesignSystem/Components`
3. Create new features in `Features/`
4. Extend sub-agents in `.claude/agents/`

## License

MIT License - Feel free to use this starter for any project.

## Resources

- [Claude Code Documentation](https://code.claude.com/)
- [SwiftUI Documentation](https://developer.apple.com/documentation/swiftui)
- [Material Design 3](https://m3.material.io/)
- [iOS Human Interface Guidelines](https://developer.apple.com/design/human-interface-guidelines/)
