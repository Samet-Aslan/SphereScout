//
//  ContentView.swift
//  SphereScout
//
//  Created by Samet Aslan on 06/05/2020.
//  Copyright © 2020 Samet Aslan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        
        TabView(selection: $selection){
            SearchView()
                .font(.title)
                .tabItem {
                    VStack {
                        Image("search")
                        Text("Search")
                    }
                }
                .tag(0)
            FavListView()
                .font(.title)
                .tabItem {
                    VStack {
                        Image("fav")
                        Text("Favoriten")
                    }
                }
                .tag(1)
            
            SettingsView()
                .font(.title)
                .tabItem{
                VStack {
                        Image("settings")
                        Text("Einstellungen")
                    }
                }
            .tag(2)
        }.background(Color.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()

    }
}
