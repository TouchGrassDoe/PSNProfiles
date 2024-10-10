//
//  NewsView.swift
//  PSNProfiles (app)
//
//  Created by Aaron Doe on 10/10/2024.
//

import SwiftUI

struct NewsView: View {
    var body: some View {
        VStack {
            List {
                Text("ASTRO BOT IS GOTY 2024")
                Text("XBOX IS A DEAD PLATFORM")
                Text("YOU LOVE TO SEE IT!")
                Text("THIS FEATURE IS COMING SOOOOON")
                Text("HI JAMES & AMY, GEOFF & BECKY")
                Text("I'VE RAN OUT OF THINGS TO WRITE :)")
            }
        }
        .navigationTitle("News")
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
