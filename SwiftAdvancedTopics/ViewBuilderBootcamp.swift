//
//  ViewBuilderBootcamp.swift
//  SwiftAdvancedTopics
//
//  Created by Artem on 07.07.2023.
//

import SwiftUI

struct HeaderViewRegular: View {
    
    let title: String
    let description: String?
    let iconName: String?
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.semibold)
            if let description = description {
                Text(description)
                    .font(.callout)
            }
            if let iconName = iconName {
                Image(systemName: iconName)
            }
            
            RoundedRectangle(cornerRadius: 5)
                .frame(height: 2)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}

struct HeaderViewGeneric<Content:View>: View {
    
    let title: String
    let content: Content
    
    init(title: String, @ViewBuilder content:() -> Content) {
        self.title = title
        self.content = content()
    }
    
    var body: some View {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
           content
                
                RoundedRectangle(cornerRadius: 5)
                    .frame(height: 2)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
        }
    }


struct CustomHStack<Content:View> : View {
   
    let content: Content
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        HStack {
            content
        }
    }
}



struct ViewBuilderBootcamp: View {
    var body: some View {
        VStack {
            HeaderViewRegular(title: "New Title", description: "Hello", iconName: "heart.fill")
            HeaderViewRegular(title: "New Title2", description: "Hey, Man!", iconName: "star.fill")
//            HeaderViewRegular(title: "New Title3", description: nil, iconName: nil)
//            HeaderViewGeneric(title: "Generic Title", content: HeaderViewRegular(title: "Awesome", description: "YEE", iconName: "moon.fill"))
//
//            HeaderViewGeneric(title: "Generic Title2", content: HStack {
//                Text("helooo")
//                Image(systemName: "bolt.fill")
//            }
            CustomHStack {
                Text("Hi")
                Text("Hi")
            }
            HeaderViewGeneric(title: "Generic Title") {
                HStack{
                    Text("Hi")
                    Image(systemName: "heart.fill")
                    Image(systemName: "star.fill")
                }
            }
            
            
            Spacer()
        }
    }
}


struct ViewBuilderBootcamp_Previews: PreviewProvider {
    static var previews: some View {
//        ViewBuilderBootcamp()
        LocalViewBuilder(type: .three)
    }
}

struct LocalViewBuilder : View {
    enum ViewType {
        case one, two, three
    }
    let type: ViewType
    
    var body: some View {
        VStack {
         headerSection
        }
    }
    
    
    @ViewBuilder private var headerSection: some View {
        switch type {
        case .one:
            viewOne
        case .two:
            viewTwo
        case .three:
            viewThree
        }
//        if type == .one {
//            viewOne
//        } else if type == .two {
//            viewTwo
//        } else if type == .three {
//            viewThree
//        }
    }
    
    
    
    private var viewOne: some View {
        Text("One")
    }
    
    private var viewTwo: some View {
        VStack{
            Text("TWOOO")
            Image(systemName: "heart.fill")
        }
        
    }
    private var viewThree: some View {
        HStack {
            Image(systemName: "heart.fill")
            Text("Three")
        }
    }
}
