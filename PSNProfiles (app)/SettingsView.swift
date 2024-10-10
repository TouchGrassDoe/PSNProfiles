//
//  PreferencesView.swift
//  PSNProfiles (app)
//
//  Created by Aaron Doe on 10/10/2024.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false

    var body: some View {
        VStack {

            Toggle(isOn: $isDarkMode) {
                Text("Dark Mode")
            }
            .padding()
            .onChange(of: isDarkMode) { value in
                if value {
                    UIApplication.shared.windows.first?.overrideUserInterfaceStyle = .dark
                } else {
                    UIApplication.shared.windows.first?.overrideUserInterfaceStyle = .light
                }
            }

            Spacer()

            Text("©️ 2024 Aaron Doe. All rights reserved. (v0.3)")
                .font(.footnote)
                .foregroundColor(.gray)
                .padding()
        }
        .navigationTitle("Settings")
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}

struct PreferencesView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
