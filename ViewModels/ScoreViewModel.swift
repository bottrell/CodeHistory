//
//  ScoreViewModel.swift
//  CodeHistory
//
//  Created by Jordan Bottrell on 6/21/22.
//

import Foundation

struct ScoreViewModel {
    let correctGuesses: Int
    let incorrectGuesses: Int
     
      var percentage: Int {
        (correctGuesses * 100 / (correctGuesses + incorrectGuesses))
      }
}
