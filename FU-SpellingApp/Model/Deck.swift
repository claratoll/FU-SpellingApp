//
//  Deck.swift
//  FU-SpellingApp
//
//  Created by Clara Toll on 2023-03-20.
//

import Foundation

class Deck {
    private var deck = [Word]()
    
    init() {
        add(newWord: Word(word: "lasagne", category: "Hard"))
        add(newWord: Word(word: "pasta", category: "Medium"))
        add(newWord: Word(word: "cat", category: "Easy"))
        add(newWord: Word(word: "hat", category: "Easy"))
        add(newWord: Word(word: "horse", category: "Medium"))
        add(newWord: Word(word: "computer", category: "Hard"))
        add(newWord: Word(word: "hard ware", category: "Extreme"))
    }
    
    func add(newWord : Word){
        deck.append(newWord)
    }
    
    var count : Int {
        return deck.count
    }
    
    func randomWord() -> String{
        let randomIndex = Int(arc4random_uniform(UInt32(deck.count)))
        let randomWord = deck[randomIndex]
        
        //take in all words and put them in new order and provide randomWord
        return randomWord.word
    }
    
}
