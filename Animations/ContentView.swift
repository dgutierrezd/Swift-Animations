//
//  ContentView.swift
//  Animations
//
//  Created by Daniel Gutierrez on 6/09/21.
//

import SwiftUI

struct ContentView: View {
    @State var flag = true
    @State var scale: CGFloat = 1.0
    @State private var animation = 0.0
    @State private var half = false
    @State private var dim = false
    
    var body: some View {
        rectangleAnimation
    }
    
    var heartAnimation: some View {
        Image(systemName: "heart.fill")
            .resizable()
            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
            .foregroundColor(.pink)
            .scaleEffect(scale)
            .animation(
                Animation.easeOut(duration: 0.5)
                    .repeatForever()
            )
            .overlay(
                Image(systemName: "heart.fill")
                    .resizable()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.pink)
                    .scaleEffect(CGFloat(1 + animation))
                    .opacity(1 - animation)
            )
            .onAppear {
                withAnimation(Animation.easeOut(duration: 1).repeatForever(autoreverses: false)) {
                    animation = 1
                }
            }
            .onAppear {
                self.scale = 1.5
            }
    }
    
    var rectangleAnimation: some View {
        VStack {
            RoundedRectangle(cornerRadius: 5)
                .foregroundColor(flag ? /*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/ : .green)
                .rotationEffect(Angle(degrees: flag ? 360 : 0))
                .frame(width: flag ? 50 : /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 50)
                .offset(x: flag ? -100 : 100)
                .animation(.easeInOut(duration: 2.0))
            
            Button("Animate") {
                self.flag.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
