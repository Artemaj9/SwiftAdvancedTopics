//
//  ViewModifierBootcamp.swift
//  SwiftAdvancedTopics
//
//  Created by Artem on 06.07.2023.
//

import SwiftUI

struct DefaultButtonViewModifier: ViewModifier {
    
    let backgroundColor: Color
    
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundColor(.white)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(backgroundColor)
            .cornerRadius(10)
            .shadow(radius: 10)
            .padding()
    }
}

extension View {
    func withDefaultButtonFormatting(backgroundColor: Color) -> some View {
        modifier(DefaultButtonViewModifier(backgroundColor: backgroundColor))
    }
}

struct ViewModifierBootcamp: View {
    
    var body: some View {
        VStack {
            Text("Hello, world!")
                .withDefaultButtonFormatting(backgroundColor: .indigo)
              //  .modifier(DefaultButtonViewModifier())
            
            Text("Hello, everyone!")
                .font(.headline)
                .foregroundColor(.white)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(10)
                .shadow(radius: 10)
                .padding()
            
            Text("Hello, world!")
                .modifier(DefaultButtonViewModifier(backgroundColor: .green))
            
    
        }
        
    }
}

struct ViewModifierBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ViewModifierBootcamp()
    }
}
