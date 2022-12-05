//
//  ContentView.swift
//  Bullsye
//
//  Created by Samba NGOM on 05/12/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var isAlertVisibe = false
    @State private var whoThereIsVisibe = false
    @State private var sliderValue = 50.0
    @State private var game : Game = Game()
    var body: some View {
        ZStack{
            BackgroungView(game: $game)
            VStack{
                Text("🎯🎯🎯\nPUT THE BULLSEYE AS CLOSE AS YOU CAN".uppercased())
                    .bold()
                    .kerning(2.0)
                    .multilineTextAlignment(.center)
                    .lineSpacing(4.0)
                    .font(.footnote)
                    .foregroundColor(Color("TextColor"))
                    .padding()
                Text("\(game.target)")
                    .kerning(-1.0)
                    .font(.largeTitle)
                    .fontWeight(.black)
                HStack{
                    Text("1")
                        .bold()
                    Slider(value: $sliderValue, in: 1.0...100.0)
                    Text("100")
                        .bold()
                }
                .padding(20)
                Button(action: {
                    print("Hello , ")
                    self.isAlertVisibe.toggle()
                }) {
                    Text("Hit me".uppercased())
                        .font(.title3)
                        .bold()
                        
                }
                .padding(20.0)
                .background(ZStack{
                    Color("ButtonColor")
                    LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint:.top, endPoint:.bottom)
                })
                .foregroundColor(Color.white)
                .cornerRadius(21.0)
                .alert(isPresented: $isAlertVisibe, content: {
                    return Alert(title: Text("Hello , there"), message: Text("Slider's value is \(sliderValue), rounded value \(Int(sliderValue.rounded()))\n" + " you're score \(game.points(sliderValue: Int(sliderValue.rounded()))) points this round"), dismissButton: .default(Text("Awsome")))
                })
                
            }
            
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
       
    }
}
