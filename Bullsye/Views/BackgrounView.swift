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
        .background(Color("BackgroundColor").edgesIgnoringSafeArea(.all))
        
        
    }
}
struct TopView: View {
    @Binding var game: Game
    var body: some View {
        HStack(alignment: .top){
            RoundedImageViewSroked(systemName: "arrow.counterclockwise")
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
struct BackgrounView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroungView(game: .constant(Game()))
    }
}
