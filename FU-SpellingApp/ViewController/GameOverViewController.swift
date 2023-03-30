//
//  GameOverViewController.swift
//  FU-SpellingApp
//
//  Created by Clara Toll on 2023-03-30.
//

import UIKit

class GameOverViewController: UIViewController {

    var points = 0
    var name : String = ""
    
    var players = Players()
    
    let secondScoreBoardSegue = "secondScoreBoardSegue"
    
    @IBOutlet weak var wellDoneLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
           
           wellDoneLabel.text = "Well done \(name )"
           pointsLabel.text = "You got \(points) points"
        
        players.add(player: Player(points: points, name: name))
           // Do any additional setup after loading the view.
    }
       

    
    // MARK: - Navigation


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == secondScoreBoardSegue {
            if let destinationViewController = segue.destination as? ScoreBoardVC{
                print("helo")
            }
        }
    }

}
