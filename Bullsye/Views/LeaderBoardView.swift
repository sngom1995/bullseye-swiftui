//
//  LeaderBoardView.swift
//  Bullsye
//
//  Created by Samba NGOM on 07/12/2022.
//


import SwiftUI

struct LeaderboardView: View {
    @Binding var isLeaderBordVisible : Bool
    @Binding var game: Game
  var body: some View {
    ZStack {
      Color("BackgroundColor").edgesIgnoringSafeArea(.all)
        VStack(spacing: 10) {
            HeaderView(isLeaderBordVisible: $isLeaderBordVisible)
            LabelView()
            ScrollView{
                VStack(spacing: 10.0){
                    ForEach(game.leaderboadEntries.indices){i in
                        RowView(index: i, score: game.leaderboadEntries[i].score, date: game.leaderboadEntries[i].date)}
                    
                }
            }}
        .frame(width: .infinity)
        .padding(.top, 20)
    }
  }
}

struct RowView: View {
  let index: Int
  let score: Int
  let date: Date

  var body: some View {
    HStack {
      RoundedTextView(text: String(index))
      Spacer()
      ScoreText(score: score)
        .frame(width: Constants.Leaderboard.leaderboardScoreColWidth)
      Spacer()
      DateText(date: date)
        .frame(width: Constants.Leaderboard.leaderboardDateColWidth)
    }
    .background(
      RoundedRectangle(cornerRadius: .infinity)
        .strokeBorder(Color("LeaderboardRowColor"), lineWidth: Constants.General.strokeWidth)
    )
    .padding(.leading)
    .padding(.trailing)
    .frame(maxWidth: Constants.Leaderboard.leaderboardMaxRowWidth)
  }
}

struct HeaderView: View {
    @Binding var isLeaderBordVisible : Bool

  var body: some View {
    ZStack {
      BigBoldText(text: "Leaderboard")
      HStack {
        Spacer()
        Button(action: {
            isLeaderBordVisible.toggle()
        }) {
          RoundedImageViewFilled(systemName: "xmark")
            .padding(.trailing)
        }
      }
    }
  }
}

struct LabelView: View {
  var body: some View {
    HStack {
      Spacer()
        .frame(width: Constants.General.roundedViewLength)
      Spacer()
      LabelText(text: "Score")
        .frame(width: Constants.Leaderboard.leaderboardScoreColWidth)
      Spacer()
      LabelText(text: "Date")
        .frame(width: Constants.Leaderboard.leaderboardDateColWidth)
    }
    .padding(.leading)
    .padding(.trailing)
    .frame(maxWidth: Constants.Leaderboard.leaderboardMaxRowWidth)
  }
}

struct LeaderboardView_Previews: PreviewProvider {
  static var previews: some View {
      LeaderboardView(isLeaderBordVisible: .constant(false), game: .constant(Game()))
    LeaderboardView(isLeaderBordVisible: .constant(false),game: .constant(Game()))
      .previewLayout(.fixed(width: 568, height: 320))
    LeaderboardView(isLeaderBordVisible: .constant(false),game: .constant(Game()))
      .preferredColorScheme(.dark)
    LeaderboardView(isLeaderBordVisible: .constant(false),game: .constant(Game()))
      .preferredColorScheme(.dark)
      .previewLayout(.fixed(width: 568, height: 320))
  }
}
