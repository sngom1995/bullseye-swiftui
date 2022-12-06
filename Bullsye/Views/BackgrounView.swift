//
//  BackgrounView.swift
//  Bullsye
//
//  Created by Samba NGOM on 06/12/2022.
//

import SwiftUI

struct BackgroungView: View {
    @Binding var game: Game
    var body: some View {
        VStack{
            TopView(game: $game)
            Spacer()
            BottomView(game: $game)
        }
        .padding()
        .background(
            RingsView()
        )
        
        
    }
}
struct TopView: View {
    @Binding var game: Game
    var body: some View {
        HStack(alignment: .top){
            Button(action: {
                game.restartGame()
            }){
                RoundedImageViewSroked(systemName: "arrow.counterclockwise")
            }
            Spacer()
            RoundedImageViewFilled(systemName: "list.dash")
        }
    }
}

struct NumberView: View {
    var title: String
    var score: Int
    var body: some View{
        VStack{
            LabelText(labelText: title)
            RoundeRectText(text: score)
        }
    }
}
struct BottomView: View {
    @Binding var game: Game
    var body: some View {
        HStack(alignment: .top){
           
                NumberView(title: "Score", score:game.score)
            Spacer()
                NumberView(title: "Round", score:game.round)
           
        }
    }
}
struct RingsView: View {
    @Environment(\.colorScheme) var colorScheme
  var body: some View {
    ZStack {
      Color("BackgroundColor")
        .edgesIgnoringSafeArea(.all)
        let opacity = colorScheme == .dark ? 0.1 : 0.3
      ForEach(1..<6) { ring in
        let size = CGFloat(ring * 100)
        Circle()
          .stroke(lineWidth: 20.0)
          .fill(
            
            RadialGradient(gradient: Gradient(colors: [Color("RingsColor").opacity(opacity), Color("RingsColor").opacity(0)]), center: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, startRadius: 100, endRadius: 3)
          )
          .frame(width: size, height: size)
      }
    }
  }
}
struct BackgrounView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroungView(game: .constant(Game()))
    }
}
