//
//  Players.swift
//  FU-SpellingApp
//
//  Created by Clara Toll on 2023-03-23.
//

import Foundation

class Players {
    private var players = [Player]()
    
    init() {
        add(player: Player(points: 8, name: "Aleandro"))
        add(player: Player(points: 10, name: "Elsie"))
    }
    
    func add(player: Player){
        players.append(player)
    }
    
    var count : Int{
        return players.count
    }
}
