//
//  MatchedGeometryEffect.swift
//  SwiftAdvancedTopics
//
//  Created by Artem on 06.07.2023.
//

import SwiftUI

struct MatchedGeometryEffect: View {
    
    @State private var isClicked: Bool = false
    @Namespace private var namespase
    var body: some View {
        VStack {
            
            if !isClicked {
              Circle()
                    .matchedGeometryEffect(id: "rectangle", in: namespase)
                    .frame(width: 100, height: 100)
                    
                //                .offset(y: isClicked ?
                //                        UIScreen.main.bounds.height*0.75 : 0)
            }
                
                Spacer()
            if isClicked {
                RoundedRectangle(cornerRadius: 25)
                    .matchedGeometryEffect(id: "rectangle", in: namespase)
                    .frame(width: 300, height: 200)
                  
            }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.red)
            .onTapGesture {
                withAnimation(.easeInOut) {
                    isClicked.toggle()
                }
            }
        }
    }


struct MatchedGeometryEffect_Previews: PreviewProvider {
    static var previews: some View {
        MatchedGeometryEffectExample2()
    }
}


struct MatchedGeometryEffectExample2: View {
    
    let categories: [String] = ["Home", "Popular", "Saved"]
    @State private var selected: String = ""
    @Namespace private var namespace2
    
    
    var body: some View {
        HStack{
            ForEach(categories, id: \.self) { category in
                ZStack (alignment: .bottom){
                    if selected == category{
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.red.opacity(0.5))
                            .matchedGeometryEffect(id: "category_background", in: namespace2)
                            .frame(width: 35, height: 2)
                            .offset(y: 10)
                    }
                    Text(category)
                        .foregroundColor(selected == category ? .red : .black)
                    
                }
                .frame(maxWidth: .infinity)
                .frame(height: 55)
                .onTapGesture {
                    withAnimation(.spring()) {
                        selected = category
                    }
                }
            }
        }
        .padding()
    }
}
