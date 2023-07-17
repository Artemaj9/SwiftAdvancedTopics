//
//  ScrollViewOffsetPreferenceKeyBootcamp.swift
//  SwiftAdvancedTopics
//
//  Created by Artem on 17.07.2023.
//

import SwiftUI


struct ScrollViewOffsetPreferenceKey: PreferenceKey {
    
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () ->
                       CGFloat) {
        value = nextValue()
    }
}

extension View {
    func onScrollViewOffsetChanged(action: @escaping(_ offset: CGFloat)) -> Void) -> some View {
        self
            .background(
                GeometryReader {geo in
                    Text("")
                        .preference(key: ScrollViewOffsetPreferenceKey.self,
                                    value: geo.frame(in: .global).minY)
                }
            )
            .onPreferenceChange(ScrollViewOffsetPreferenceKey.self, perform: { value in
              action(value)
            })
        
    }
}
struct ScrollViewOffsetPreferenceKeyBootcamp: View {
    
    let title: String = "New tittle here!!!"
    @State private var scrollViewOffset: CGFloat = 0
    
    
    var body: some View {
            ScrollView {
                VStack {
                    titleLayer
                        .opacity((Double(scrollViewOffset) - 33) / 58)
                        .onScrollViewOffsetChanged { value in
                            self.scrollViewOffset = value
                    contentLayer
                }
                .padding()
            }
            .overlay(Text("\(scrollViewOffset)")))
            .overlay(navBarLayer
                .opacity((scrollViewOffset < 95 && scrollViewOffset > -5000) ? abs(Double(95-scrollViewOffset))/5000  : 10000/(5000 - Double(scrollViewOffset))),
                     alignment: .top)
            .padding()
        }
    }
                     


extension ScrollViewOffsetPreferenceKeyBootcamp {
    
    
    private var titleLayer: some View {
        Text(title)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity, alignment: .leading)
        
    }
    
    private var contentLayer: some View {
        ForEach(0..<100) { _ in
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.red.opacity(0.3))
                .frame(width: 300, height: 200)
        }
    }
    
    private var navBarLayer: some View {
        Text(title)
            .font(.headline)
            .frame(maxWidth: .infinity)
            .frame(height: 55)
            .background(Color.blue)
    }
}




struct ScrollViewOffsetPreferenceKeyBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewOffsetPreferenceKeyBootcamp()
    }
}
