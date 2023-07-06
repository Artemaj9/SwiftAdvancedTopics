//
//  ButtonStyleBootcamp.swift
//  SwiftAdvancedTopics
//
//  Created by Artem on 06.07.2023.
//

import SwiftUI

struct PressableButtonStyle : ButtonStyle {
    
    let scaledAmount: CGFloat
    
    init(scaledAmount: CGFloat){
        self.scaledAmount = scaledAmount
    }
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? scaledAmount : 1.0)
            .brightness(configuration.isPressed ? 0.05 : 0)
            .opacity(configuration.isPressed ? 0.9 : 1)
    }
}

extension View {
    func withPressableStyle(scaledAmount: CGFloat = 0.9) -> some View {
        buttonStyle(PressableButtonStyle(scaledAmount: scaledAmount))
    }
}

struct ButtonStyleBootcamp: View {
    var body: some View {
        Button {
            
        } label: {
            Text("Click me")
                .withDefaultButtonFormatting(backgroundColor: .green)
//                .font(.headline)
//                .foregroundColor(.white)
//                .frame(height: 55)
//                .frame(maxWidth: .infinity)
//                .background(Color.blue)
//                .cornerRadius(10)
//                .shadow(color: Color.blue.opacity(0.3), radius: 10, x: 0, y: 10)
                
        }
        .withPressableStyle(scaledAmount: 1.01)
       // .buttonStyle(PressableButtonStyle())
        .padding(40)

    }
}

struct ButtonStyleBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ButtonStyleBootcamp()
    }
}
