//
//  PointsView.swift
//  Bullsye
//
//  Created by Samba NGOM on 06/12/2022.
//

import SwiftUI

struct PointsView: View {
    @Binding var game: Game
    @Binding var sliderValue: Float
    @Binding var isAlertVisible : Bool
    var body: some View {
        VStack(spacing: 10){
            Text("The slider value is")
                .kerning(2.0)
                .multilineTextAlignment(.center)
                .lineSpacing(4.0)
                .font(.footnote)
                .foregroundColor(Color("TextColor"))
                .padding()
            Text("\(Int(sliderValue))")
                .kerning(-1.0)
                .font(.largeTitle)
                .fontWeight(.black)
            BodyText(labelText: "you scored \(game.gain) points\n 🎉🎉🎉")
            Button(action:{
                withAnimation{
                    isAlertVisible.toggle()
                }
                game.startsNewRound(points: game.points(sliderValue: Int(sliderValue)))
              

            }){
                ButtonText(labelText: "Start A new game")

            }
        }
            .padding()
            .frame(maxWidth: 300)
            .background(Color("BackgroundColor"))
            .cornerRadius(21.0)
            .shadow(radius: 10.0,x: 5.0, y: 5.0)
            .transition(.scale)
    }
}

struct PointsView_Previews: PreviewProvider {
    static var previews: some View {
        PointsView(game: .constant(Game()), sliderValue: .constant(78),isAlertVisible:  .constant(true))
    }
}
