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
        add(newWord: Word(word: "lasagne"))
        add(newWord: Word(word: "pasta"))
        add(newWord: Word(word: "cat"))
        add(newWord: Word(word: "hat"))
        add(newWord: Word(word: "horse"))
        add(newWord: Word(word: "computer"))
        add(newWord: Word(word: "hard ware"))
        add(newWord: Word(word: "socks"))
        add(newWord: Word(word: "book"))
        add(newWord: Word(word: "couch"))
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
