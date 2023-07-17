//
//  GeometryPreferenceKeyBootcamp.swift
//  SwiftAdvancedTopics
//
//  Created by Artem on 17.07.2023.
//

import SwiftUI

struct GeometryPreferenceKeyBootcamp: View {
    
    @State private var rectSize: CGSize = .zero
    
    var body: some View {
        
        VStack {
            Text("Hello world")
                .frame(width: rectSize.width, height: rectSize.height, alignment: .center)
                .background(Color.blue)
            Spacer()
            HStack {
                Rectangle()
                
                GeometryReader { geo in
                Rectangle()
                        .updateRectangleGeoSize(geo.size)
            }
                Rectangle()
            }
            .frame(height: 55)
        }
        .padding()
        .onPreferenceChange(RectangleGeometrySizePreferenceKey.self, perform: {
            value in
            self.rectSize = value
            
        })
    }
}

struct GeometryPreferenceKeyBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        GeometryPreferenceKeyBootcamp()
    }
}





extension View {
    
    func updateRectangleGeoSize(_ size: CGSize) -> some View {
        preference(key: RectangleGeometrySizePreferenceKey.self, value: size)
    }
}


struct RectangleGeometrySizePreferenceKey: PreferenceKey {
    
    static var defaultValue: CGSize = .zero
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
}
