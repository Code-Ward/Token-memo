//
//  KeyboardSetupOnboardingView.swift
//  Token memo
//
//  Simplified to single screen per "Silent Partner" concept
//

import SwiftUI
#if canImport(UIKit)
import UIKit
#endif

struct KeyboardSetupOnboardingView: View {
    var exitAction: () -> Void

    var body: some View {
        ZStack {
            // Simple gradient background
            LinearGradient(
                colors: [
                    .blue.opacity(0.6),
                    .purple.opacity(0.6)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            VStack(spacing: 30) {
                Spacer()

                // App Icon
                ZStack {
                    Circle()
                        .fill(Color.white.opacity(0.2))
                        .frame(width: 100, height: 100)

                    Image(systemName: "keyboard")
                        .font(.system(size: 50))
                        .foregroundColor(.white)
                }

                // Title
                Text(NSLocalizedString("키보드를 추가해주세요", comment: "Setup keyboard title"))
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.bottom, 10)

                // 3 Simple Steps
                VStack(alignment: .leading, spacing: 16) {
                    StepView(
                        number: "1",
                        text: NSLocalizedString("설정 > 키보드", comment: "Step 1")
                    )

                    StepView(
                        number: "2",
                        text: NSLocalizedString("새 키보드 추가", comment: "Step 2")
                    )

                    StepView(
                        number: "3",
                        text: NSLocalizedString("Clip Keyboard 선택", comment: "Step 3")
                    )
                }
                .padding(.horizontal, 40)

                Spacer()

                // Bottom Buttons
                HStack(spacing: 12) {
                    Button {
                        exitAction()
                    } label: {
                        Text(NSLocalizedString("나중에", comment: "Later button"))
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(Color.white.opacity(0.2))
                            .cornerRadius(10)
                    }

                    Button {
                        if let url = URL(string: UIApplication.openSettingsURLString) {
                            UIApplication.shared.open(url)
                        }
                        // Exit after opening settings
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            exitAction()
                        }
                    } label: {
                        Text(NSLocalizedString("설정 열기", comment: "Open settings button"))
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.blue)
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(Color.white)
                            .cornerRadius(10)
                    }
                }
                .padding(.horizontal, 30)
                .padding(.bottom, 30)
            }
        }
    }
}

// MARK: - Step View Component
struct StepView: View {
    let number: String
    let text: String

    var body: some View {
        HStack(spacing: 12) {
            ZStack {
                Circle()
                    .fill(Color.white.opacity(0.3))
                    .frame(width: 32, height: 32)

                Text(number)
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.white)
            }

            Text(text)
                .font(.system(size: 16))
                .foregroundColor(.white)

            Spacer()
        }
    }
}

// MARK: - Preview
struct KeyboardSetupOnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardSetupOnboardingView(exitAction: { })
    }
}
