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

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        LabelText(labelText: "Test")
    }
}
