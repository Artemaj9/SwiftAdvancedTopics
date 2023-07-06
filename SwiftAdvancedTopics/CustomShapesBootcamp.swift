//
//  CustomShapesBootcamp.swift
//  SwiftAdvancedTopics
//
//  Created by Artem on 06.07.2023.
//

import SwiftUI


struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        }
    }
}

struct Diamond : Shape {
    func path(in rect: CGRect) -> Path {
        Path {path in
            let horizontalOffset: CGFloat = rect.width * 0.2
            path.move(to: CGPoint(x: rect.midX , y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX - horizontalOffset, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX + horizontalOffset, y: rect.midY))
        }
    }
}


struct Trapezoid: Shape {
    func path(in rect: CGRect) -> Path {
        Path {path in
            let horizontalOffset: CGFloat = rect.width * 0.3

            path.move(to: CGPoint(x: rect.minX + horizontalOffset, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x:rect.maxX - horizontalOffset, y: rect.minY ))
        }
    }
}

struct CustomShapesBootcamp: View {
    var body: some View {
        VStack {
            
           
//            Triangle()
//                .frame(width: 200, height: 200)
//
//            Diamond()
//                .frame(width: 300, height: 300)
            ZStack{
                
                Image("Zvezdopad")
                    .frame(width: 400, height: 900)
                    .mask(Triangle()
                        .fill(LinearGradient(gradient: Gradient(colors: [Color.green.opacity(0.98), Color.blue.opacity(0.3), Color.blue.opacity(0.1)]), startPoint: .leading, endPoint: .trailing)) )
                //                    .fill(LinearGradient(gradient: Gradient(colors: [Color.red.opacity(0.2), Color.blue.opacity(0.1)]), startPoint: .leading, endPoint: .trailing))
            }
                
                
            
               // .frame(width: 200, height: 200)
                                 //                .frame(width: 400, height: 500))
            
            //            Image("Zvezdopad")
            //          // Triangle()
            //                .resizable()
            //                .scaledToFill()
            //.trim(from: 0, to: 0.5)
            //                .stroke(style: StrokeStyle(lineWidth: 3, lineCap: .round,  dash: [5]))
            //              .foregroundColor(.mint)
            
            //  .fill(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue, Color.orange, Color.green]), startPoint: .leading, endPoint: .trailing))
            //                .frame(width: 400, height: 500)
            //                .clipShape(
            //                    Triangle()
            //            }            .rotation(Angle(degrees: 9)))
        }
        }
        }

struct CustomShapesBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        CustomShapesBootcamp()
    }
}
