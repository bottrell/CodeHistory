//
//  GameView.swift
//  CodeHistory
//
//  Created by Jordan Bottrell on 6/13/22.
//

import SwiftUI

struct GameView: View {
 
  @StateObject var viewModel = GameViewModel()
 
  var body: some View {
    ZStack {
      GameColor.main.ignoresSafeArea()
      VStack {
        Text(viewModel.questionProgressText)
          .font(.callout)
          .multilineTextAlignment(.leading)
          .padding()
        QuestionView(question: viewModel.currentQuestion)
      }
    }
    .background(
        NavigationLink(destination: ScoreView(viewModel: ScoreViewModel(correctGuesses: viewModel.correctGuesses, incorrectGuesses: viewModel.incorrectGuesses)),
                       isActive: .constant(viewModel.gameIsOver),
                       //emptyView() does not display anything,
                       //rather, it observes silently in the background
                       label : {EmptyView() })
    )
    .foregroundColor(.white)
    .navigationBarHidden(true)
    .environmentObject(viewModel)
  }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
