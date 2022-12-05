//
//  RoundedView.swift
//  Bullsye
//
//  Created by Samba NGOM on 06/12/2022.
//

import SwiftUI

struct RoundedImageViewSroked: View {
    var systemName : String
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("TextColor"))
            .frame(width: 56.0, height: 56.0)
            .overlay(
                Circle()
                    .strokeBorder(Color("ButtonSrokeColor"),lineWidth: 2.0)
            )
    }
}

struct RoundedImageViewFilled: View {
    var systemName : String
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("ButtonFilledTextColor"))
            .foregroundColor(Color("TextColor"))
            .frame(width: 56.0, height: 56.0)
            
            .background(
                Circle()
                    .fill(Color("ButtonFilledBackgrounColor"))
            )
    }
}

struct RoundeRectText: View{
    var text: Int
    var body: some View{
        Text(String(text))
            .font(.title)
            .kerning(-1.0)
            .font(.largeTitle)
            .fontWeight(.black)
            .foregroundColor(Color("TextColor"))
            .frame(width: 80.0, height: 56.0)
            .background(
                RoundedRectangle(cornerRadius: 20.0)
                .strokeBorder(Color("ButtonSrokeColor"),lineWidth: 2.0))
    }
}
struct RoundedView_Previews: PreviewProvider {
    static var previews: some View {
        RoundeRectText(text: 45)
        RoundedImageViewFilled(systemName: "arrow.counterclockwise")
            .preferredColorScheme(.dark)
    }
}
