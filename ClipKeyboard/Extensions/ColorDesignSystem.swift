//
//  ColorDesignSystem.swift
//  ClipKeyboard
//
//  Native Neutral Design System Colors
//  Based on DESIGN_GUIDE.md v1.0
//

import SwiftUI
#if canImport(UIKit)
import UIKit
#endif

extension Color {
    // MARK: - Primary Colors

    /// Primary color for CTA, links, and selections
    /// Light: #007AFF, Dark: #0A84FF
    static let appPrimary = Color("Primary")

    /// Success color for completion states
    /// Light: #34C759, Dark: #30D158
    static let appSuccess = Color("Success")

    /// Destructive color for delete actions
    /// Light: #FF3B30, Dark: #FF453A
    static let appDestructive = Color("Destructive")

    /// Favorite color for starred items
    /// Light: #FF9500, Dark: #FF9F0A
    static let appFavorite = Color("Favorite")

    // MARK: - Background Colors

    /// Base background - app background
    /// Light: #F2F2F7, Dark: #000000
    static let appBackground = Color(UIColor.systemGroupedBackground)

    /// Surface background - cards and cells
    /// Light: #FFFFFF, Dark: #1C1C1E
    static let appSurface = Color(UIColor.secondarySystemGroupedBackground)

    /// Elevated background - modals and sheets
    /// Light: #FFFFFF, Dark: #2C2C2E
    static let appElevated = Color(UIColor.tertiarySystemGroupedBackground)

    // MARK: - Text Colors

    /// Primary text color
    /// Light: #000000, Dark: #FFFFFF
    static let appTextPrimary = Color(UIColor.label)

    /// Secondary text color (60% opacity)
    /// Light: #3C3C43, Dark: #EBEBF5
    static let appTextSecondary = Color(UIColor.secondaryLabel)

    /// Tertiary text color (30% opacity) - hints and placeholders
    /// Light: #3C3C43, Dark: #EBEBF5
    static let appTextTertiary = Color(UIColor.tertiaryLabel)

    // MARK: - UI Element Colors

    /// Separator line color
    /// Light: #3C3C43 30%, Dark: #545458 60%
    static let appSeparator = Color(UIColor.separator)

    /// Fill color for backgrounds
    /// Light: #787880 20%, Dark: #787880 36%
    static let appFill = Color(UIColor.systemFill)

    /// Keyboard background
    /// Light: #D1D3D9, Dark: #2C2C2E
    static let appKeyboardBackground = Color(UIColor.systemGray5)
}

// MARK: - Toast Colors
extension Color {
    /// Toast background
    /// #1C1C1E with 90% opacity
    static var toastBackground: Color {
        Color(UIColor(red: 28/255, green: 28/255, blue: 30/255, alpha: 0.9))
    }

    /// Toast text
    /// #FFFFFF
    static let toastText = Color.white
}

// MARK: - Helper Extensions
extension Color {
    /// Create color from hex string
    /// - Parameter hex: Hex string (e.g., "#007AFF")
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
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
