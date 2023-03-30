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
       
       
    @IBOutlet weak var wellDoneLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
           
           wellDoneLabel.text = "Well done \(name )"
           pointsLabel.text = "You got \(points) points"

           // Do any additional setup after loading the view.
    }
       

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
