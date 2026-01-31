//
//  ButtonStyles.swift
//  ClipKeyboard
//
//  Native Neutral Design System - Button Styles
//  Based on DESIGN_GUIDE.md v1.0
//

import SwiftUI

// MARK: - Primary Button Style
/// Primary action button
/// Background: Primary color (#007AFF)
/// Text: White, Headline (17pt Semibold)
/// Height: 50px, Corner Radius: 10px
struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .background(Color.appPrimary)
            .cornerRadius(10)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.easeOut(duration: 0.1), value: configuration.isPressed)
    }
}

// MARK: - Secondary Button Style
/// Secondary action button
/// Background: Transparent
/// Text: Primary color, Headline (17pt Semibold)
struct SecondaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline)
            .foregroundColor(.appPrimary)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.easeOut(duration: 0.1), value: configuration.isPressed)
    }
}

// MARK: - Destructive Button Style
/// Destructive action button (delete, remove)
/// Background: Transparent
/// Text: Destructive color (#FF3B30), Headline (17pt Semibold)
struct DestructiveButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline)
            .foregroundColor(.appDestructive)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.easeOut(duration: 0.1), value: configuration.isPressed)
    }
}

// MARK: - Button Style Previews
struct ButtonStyles_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20) {
            Button("Primary Button") { }
                .buttonStyle(PrimaryButtonStyle())

            Button("Secondary Button") { }
                .buttonStyle(SecondaryButtonStyle())

            Button("Destructive Button") { }
                .buttonStyle(DestructiveButtonStyle())
        }
        .padding()
    }
}

// MARK: - Convenience Extensions
extension ButtonStyle where Self == PrimaryButtonStyle {
    static var appPrimary: PrimaryButtonStyle {
        PrimaryButtonStyle()
    }
}

extension ButtonStyle where Self == SecondaryButtonStyle {
    static var appSecondary: SecondaryButtonStyle {
        SecondaryButtonStyle()
    }
}

extension ButtonStyle where Self == DestructiveButtonStyle {
    static var appDestructive: DestructiveButtonStyle {
        DestructiveButtonStyle()
    }
}
