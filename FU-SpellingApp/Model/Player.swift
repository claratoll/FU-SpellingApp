//
//  Player.swift
//  FU-SpellingApp
//
//  Created by Clara Toll on 2023-03-20.
//

import Foundation

class Player{
    var points : Int = 0
    var name : String = "user"
    
    init(points: Int, name: String) {
        self.points = points
        self.name = name
    }
}
