//
//  CustomTabBarContainerView.swift
//  SwiftAdvancedTopics
//
//  Created by Artem on 27.07.2023.
//

import SwiftUI

    struct CustomTabBarContainerView<Content:View>: View {
    
        @Binding var selection: TabBarItem
    let content: Content
        @State private var tabs: [TabBarItem] = []
        init(selection: Binding<TabBarItem>, @ViewBuilder content: () -> Content) {
            self._selection = selection
            self.content = content()
        }
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                content
            }
            CustomTabBarView(tabs: tabs, selection: $selection)
        }
    }
}

struct CustomTabBarContainerView_Previews: PreviewProvider {
    
    static let tabs: [TabBarItem] = [
        TabBarItem(iconName: "heart", title: "Love", color: .red),
        TabBarItem(iconName: "house", title: "Home", color: .orange),
        TabBarItem(iconName: "person", title: "Profile", color: .green)
    ]
    static var previews: some View {
        CustomTabBarContainerView(selection: .constant(tabs.first!)) {
            Color.red
        }
    }
}
