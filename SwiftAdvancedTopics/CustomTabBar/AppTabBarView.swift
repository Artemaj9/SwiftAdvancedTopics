//
//  AppTabBarView.swift
//  SwiftAdvancedTopics
//
//  Created by Artem on 27.07.2023.
//

import SwiftUI

// Generics
// View Builder
// PreferenceKey
// MatchedGeometryEffect

struct AppTabBarView: View {
    @State private var selection: String = "home"
    @State private var tabSelection: TabBarItem = TabBarItem(iconName: "heart", title: "Love", color: .red)
    var body: some View {
        CustomTabBarContainerView(selection: $tabSelection) {
            Color.blue
        }
    }
}

struct AppTabBarView_Previews: PreviewProvider {
    
    static let tabs: [TabBarItem] = [
        TabBarItem(iconName: "heart", title: "Love", color: .red),
        TabBarItem(iconName: "house", title: "Home", color: .orange),
        TabBarItem(iconName: "person", title: "Profile", color: .green)
    ]
    static var previews: some View {
        AppTabBarView()
    }
}

extension AppTabBarView {
    private var defaultTabView: some View {
        TabView(selection: $selection) {
            Color.red
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            Color.blue
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favorites")
                }
            Color.orange
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
        }
        
    }
}
