//
//  TextView.swift
//  Bullsye
//
//  Created by Samba NGOM on 06/12/2022.
//

import SwiftUI

struct TextView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}
struct LabelText: View{
    var labelText: String
    var body: some View{
        Text(labelText.uppercased())
            .foregroundColor(Color("TextColor"))
    }
}
struct BodyText: View{
    var labelText: String
    var body: some View{
        Text(labelText.uppercased())
            .font(.subheadline)
            .fontWeight(.bold)
            .multilineTextAlignment(.center)
            .lineSpacing(12.0)
            .foregroundColor(Color("TextColor"))
    }
}
struct ButtonText: View{
    var labelText: String
    var body: some View{
        Text(labelText.uppercased())
            .bold()
            .padding()
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .background(Color.accentColor)
            .cornerRadius(12.0)
          
    }
}
struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            BodyText(labelText: "you scored 200 points\n 🎉🎉🎉")
             ButtonText(labelText: "Start A new game")
        }
        .padding()
    }
}
