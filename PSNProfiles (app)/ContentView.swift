//
//  ContentView.swift
//  PSNProfiles (app)
//
//  Created by Aaron Doe on 07/10/2024.
//

import SwiftUI

struct ContentView: View {
    
 
    
    @StateObject var network = Network()
    
    struct GrowingButton: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .font(.largeTitle)
                .padding()
                .padding()
                .background(Color.accentColor)
                .foregroundColor(.white)
                .clipShape(Capsule())
                .scaleEffect(configuration.isPressed ? 1.2 : 1)
                .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
        }
    }
    
    func reload() {
       _ = network.checkConnection()
    }
    
    let defaults = UserDefaults.standard;
    
    var body: some View {
        ZStack {
            
            if (true) {
                WebView(url: URL(string: "https://PSNProfiles.com?v=\(defaults.integer(forKey:"counter"))")!).onAppear {
                    defaults.set(defaults.integer(forKey:"counter") + 1 , forKey: "counter")
                }
            }
            else {
                VStack {
                    Text("You need a internet connection to view PSNProfiles")
                        .font(.largeTitle)
                        .padding()
                        .padding()
                        .multilineTextAlignment(.center)
                    Button("Reload") {
                        reload()
                    }
                    .buttonStyle(GrowingButton())
                    .padding()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        .preferredColorScheme(.light)
    }
}
