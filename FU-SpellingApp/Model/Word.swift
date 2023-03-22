//
//  Word.swift
//  FU-SpellingApp
//
//  Created by Clara Toll on 2023-03-20.
//

import Foundation


class Word {
    var word : String
    var category : String
    
    init(word: String, category: String) {
        self.word = word
        self.category = category
    }
    
    func getWordLength(_ word: String) -> Int {
        return word.count
    }
    
    func getCategory (category: String) {
        if category == "easy" {
            let easyWords = "hey"
            
            /*
             let word = "example"
             let wordLength = getWordLength(word)
             print("The word has \(wordLength) letters.")

             
             
             let words = ["apple", "banana", "orange", "pear", "kiwi", "grape"]
             let shortWords = words.filter { getWordLength($0) < 6 }
             let mediumWords = words.filter { getWordLength($0) >= 6 && getWordLength($0) < 8 }
             let longWords = words.filter { getWordLength($0) >= 8 }

             print("Short words: \(shortWords)") // ["apple", "pear", "kiwi"]
             print("Medium words: \(mediumWords)") // ["banana", "orange"]
             print("Long words: \(longWords)") // ["grape"]*/
        }
    }
}
