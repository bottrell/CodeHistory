//
//  BottomTextview.swift
//  CodeHistory
//
//  Created by Jordan Bottrell on 6/20/22.
//

import SwiftUI

struct BottomTextView: View {
    var dialogue: String
    
    var body: some View {
        HStack {
            Spacer()
            Text(dialogue)
                .font(.body)
                .bold()
                .padding()
            Spacer()
        }.background(GameColor.accent)
    }
}

struct BottomTextView_Previews: PreviewProvider {
    static var previews: some View {
        BottomTextView(dialogue: "Ok Let's Go!")
    }
}
