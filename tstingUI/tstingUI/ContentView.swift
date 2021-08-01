//
//  ContentView.swift
//  tstingUI
//
//  Created by Romilda Voltigore on 8/1/21.
//  Copyright © 2021 Romilda Voltigore. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selected : Int = 0
    var body: some View {
        //Stroke and StrokeBorder применимы для округления рамок формы
        //Для округления кнопок - clipShape
        //Для того, чтобы повернуть объект - rotationEffect
        //Вращение в 3D - rotation3DEffect
        //Blur - размытие
        //Opacity - прозрачность
        //Contrast - контрастность
        VStack
        {
            Spacer()
            
            ZStack
            {
                HStack
                {
                    Button(action:
                    {
                        self.selected = 0
                    })
                    {
                        Image(systemName: "calendar")
                    }.foregroundColor(self.selected == 0 ? .black : .gray)
                    
                    Spacer(minLength: 12)
                    
                    Button(action:
                    {
                        self.selected = 1
                    })
                    {
                        Image(systemName: "calendar")
                    }.foregroundColor(self.selected == 1 ? .black : .gray)
                    
                    Spacer().frame(width: 120)
                    
                    Button(action:
                    {
                        self.selected = 2
                    })
                    {
                        Image(systemName: "calendar")
                    }.foregroundColor(self.selected == 2 ? .black : .gray)
                    Spacer(minLength: 12)
                    
                    Button(action:
                    {
                        self.selected = 3
                    })
                    {
                        Image(systemName: "calendar")
                    }.foregroundColor(self.selected == 3 ? .black : .gray)
                    
                }.padding() .padding(.horizontal,22).background(CurvedShape())
            }
            Button(action: {
                //
            })
            {
                Image(systemName:"heart").resizable()
            }.background(Color.yellow)
                .clipShape(Circle())
//                    .offset(y: -32)
                    .shadow(radius: 5)
//            {
//                Image(systemName: "heart")
//                    .renderingMode(.original)
//                    .padding(18)
//            }
        }.background(Color.blue)
            .edgesIgnoringSafeArea(.top)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct CurvedShape: View {
    var body: some View
    {
        Path
        { path in
            path.move(to: CGPoint(x:0, y: 0))
            path.addLine(to: CGPoint(x: UIScreen.main.bounds.width, y: 0))
            path.addLine(to: CGPoint(x: UIScreen.main.bounds.width, y: 55))
            path.addArc(center: CGPoint(x:UIScreen.main.bounds.width / 2, y: 55), radius: 30, startAngle: .zero, endAngle: .init(degrees: 180), clockwise: true)
            path.addLine(to: CGPoint(x: 0, y: 55))
        }.fill(Color.white)
            .rotationEffect(.init(degrees: 180))
    }
}
