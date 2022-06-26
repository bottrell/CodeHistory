//
//  ScoreView.swift
//  CodeHistory
//
//  Created by Jordan Bottrell on 6/21/22.
//


import SwiftUI
 
struct ScoreView: View {
    let viewModel: ScoreViewModel
 
    var body: some View {
        ZStack {
            GameColor.main.ignoresSafeArea()
            VStack {
                Spacer()
                Text("Final Score:")
                    .font(.body)
                Text("\(viewModel.percentage)%")
                    .font(.system(size: 50))
                    .bold()
                    .padding()
                Spacer()
                VStack {
                    Text("\(viewModel.correctGuesses) ✅")
                    Text("\(viewModel.incorrectGuesses) ❌")
                }.font(.system(size: 30))
                Spacer()
                NavigationLink(
                    destination: GameView(),
                    label: {
                        BottomTextView(dialogue: "Re-take Quiz")
                    })
            }
            .foregroundColor(.white)
            .navigationBarHidden(true)
        }
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel: ScoreViewModel = ScoreViewModel(correctGuesses: 2, incorrectGuesses: 2)
        ScoreView(viewModel: viewModel)
    }
}
