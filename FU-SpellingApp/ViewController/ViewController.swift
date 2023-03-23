//
//  ViewController.swift
//  FU-SpellingApp
//
//  Created by Clara Toll on 2023-03-20.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var nameField: UITextField!
    
    let goToGameSegue = "toGameSegue"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //create segue send thing with categories
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == goToGameSegue {
            if let destinationViewController = segue.destination as? GameViewController{
                destinationViewController.recievingName = nameField.text ?? "new player"
            }
        }
    }

    
    @IBAction func unwindToStart(segue: UIStoryboardSegue) {}
}

