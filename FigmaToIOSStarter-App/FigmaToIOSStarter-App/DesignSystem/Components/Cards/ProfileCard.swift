//
//  ProfileCard.swift
//  FigmaToIOSStarter
//
//  Profile card component demonstrating design system usage
//  Shows avatar, name, subtitle, and optional verified badge
//

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
                        avatarPlaceholder
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

    private var avatarPlaceholder: some View {
        Color.uiSurface
            .overlay(
                Image(systemName: "person.fill")
                    .foregroundColor(.contentTertiary)
                    .font(.system(size: 24))
            )
    }
}

// MARK: - Preview

#Preview("Profile Cards") {
    ScrollView {
        VStack(spacing: .spacingL) {
            ProfileCard(
                name: "Jane Doe",
                subtitle: "iOS Engineer",
                avatarURL: URL(string: "https://i.pravatar.cc/300?img=1"),
                isVerified: true,
                onTap: {}
            )

            ProfileCard(
                name: "John Smith",
                subtitle: "Product Designer",
                avatarURL: nil,
                isVerified: false,
                onTap: {}
            )

            ProfileCard(
                name: "Alex Johnson",
                subtitle: "Engineering Manager",
                avatarURL: URL(string: "https://i.pravatar.cc/300?img=3"),
                isVerified: true
            )

            ProfileCard(
                name: "Alexandra Von Stuffington-Wellington III",
                subtitle: "Senior Vice President of Strategic Marketing Operations and Business Development",
                avatarURL: nil,
                isVerified: false,
                onTap: {}
            )
        }
        .padding()
    }
    .background(Color.uiBackground)
}

#Preview("Dark Mode") {
    VStack(spacing: .spacingL) {
        ProfileCard(
            name: "Jane Doe",
            subtitle: "iOS Engineer",
            avatarURL: URL(string: "https://i.pravatar.cc/300?img=1"),
            isVerified: true,
            onTap: {}
        )

        ProfileCard(
            name: "John Smith",
            subtitle: "Product Designer",
            avatarURL: nil,
            isVerified: false
        )
    }
    .padding()
    .background(Color.uiBackground)
    .preferredColorScheme(.dark)
}
