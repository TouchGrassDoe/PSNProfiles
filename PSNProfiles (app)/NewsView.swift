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
                Text("No News Found")
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
