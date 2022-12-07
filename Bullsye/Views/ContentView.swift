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
    @State private var sliderValue: Float = 50.0
    @State private var game : Game = Game()
    var body: some View {
        ZStack{
            BackgroungView(game: $game)
            VStack{
                InstructionText(text:"🎯🎯🎯\nPUT THE BULLSEYE AS CLOSE AS YOU CAN")
                
                 
                    BigNumberText(text: String(game.target))
                        
                    
                        .padding(.bottom, isAlertVisibe ?  0 : 100)
                        .padding()
            
                if isAlertVisibe {
                    PointsView(game: $game, sliderValue: $sliderValue, isAlertVisible: $isAlertVisibe)
                        .transition(.scale)
                }
                else{
                    Button(action: {
                        withAnimation{
                            self.isAlertVisibe.toggle()
                        }
                        game.setGain(sliderValue: Int(sliderValue))
                        
                    }) {
                        Text("Hit me".uppercased())
                            .font(.title3)
                            .bold()
                        
                    }
                    .transition(.scale)
                    .padding(20.0)
                    .background(ZStack{
                        Color("ButtonColor")
                        LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint:.top, endPoint:.bottom)
                    })
                    .foregroundColor(Color.white)
                    .cornerRadius(21.0)
                    
                    
                }
            }
          
            if !isAlertVisibe { HStack{
                Text("1")
                    .bold()
                Slider(value: $sliderValue, in: 1.0...100.0)
                  
                Text("100")
                    .bold()
            }
            .transition(.scale)
                
                .padding()}
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
       
    }
}
