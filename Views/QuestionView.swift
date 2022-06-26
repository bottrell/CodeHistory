//
//  QuestionView.swift
//  CodeHistory
//
//  Created by Jordan Bottrell on 6/20/22.
//

import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var viewModel: GameViewModel
  let question: Question
 
  var body: some View {
    VStack {
      Text(question.questionText)
        .font(.largeTitle)
        .bold()
        .multilineTextAlignment(.leading)
      Spacer()
        HStack {
                ForEach(0..<question.possibleAnswers.count) { answerIndex in
                    Button(action: {
                                print("Tapped on option with the text: \(question.possibleAnswers[answerIndex])")
                                viewModel.makeGuess(atIndex: answerIndex)
                              }) {
                                ChoiceTextView(choiceText: question.possibleAnswers[answerIndex])
                                  .background(viewModel.color(forOptionIndex: answerIndex)) // New line
                              }.disabled(viewModel.guessWasMade)

                }
              }
              if viewModel.guessWasMade {
                  Button(action: { viewModel.displayNextScreen() }) {
                      BottomTextView(dialogue: "Next")
                  }
              }
    }
  }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        let myquestion = Question(questionText: "are you ok?",
                                  possibleAnswers: ["yes, no"],
                                  correctAnswerIndex: 1)
        QuestionView(question: myquestion)
    }
}
