//
//  AnyTransitionBootcamp.swift
//  SwiftAdvancedTopics
//
//  Created by Artem on 06.07.2023.
//

import SwiftUI

struct RotateViewModifier: ViewModifier {
    
    let rotation: Double
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(Angle(degrees: rotation))
            .offset(
                x: rotation != 0 ? UIScreen.main.bounds.width : 0,
                y: rotation != 0 ? UIScreen.main.bounds.height: 0)
    }
}

extension AnyTransition {
    
    static var rotating: AnyTransition {
      modifier(
            active: RotateViewModifier(rotation: 180),
            identity: RotateViewModifier(rotation: 0))
    }
    
    static func rotating(rotation: Double) -> AnyTransition {
       modifier(
            active: RotateViewModifier(rotation: rotation),
            identity: RotateViewModifier(rotation: 0))
    }
    
    
    static var rotateOn: AnyTransition {
        //return AnyTransition.asymmetric(
        asymmetric(
            insertion: .rotating,
            removal: .move(edge: .leading))
    }
}

struct AnyTransitionBootcamp: View {
    
    @State private var showRectangle: Bool = false
    
    
    
    var body: some View {
        VStack {
            Spacer()
            
            if showRectangle {
                RoundedRectangle(cornerRadius: 25.0)
                    .frame(width: 250, height: 300)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                   // .transition(.move(edge: .leading))
                  //  .modifier(RotateViewModifier())
                  //  .transition(AnyTransition.scale.animation(.easeInOut))
                   // .transition(AnyTransition.rotating.animation(.easeInOut))
                  //***  .transition(.rotating(rotation: 1080))
                 //   .transition(.asymmetric(insertion: .rotating, removal: .move(edge: .top)))
                    .transition(.rotateOn)
            }
            
            Spacer()
            
            Text("Click me")
                .withDefaultButtonFormatting(backgroundColor: .green)
                .padding(.horizontal, 40)
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        showRectangle.toggle()
                        
                    }
                }
        }
    }
}

struct AnyTransitionBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        AnyTransitionBootcamp()
    }
}
