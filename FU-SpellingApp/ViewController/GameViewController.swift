//
//  GameViewController.swift
//  FU-SpellingApp
//
//  Created by Clara Toll on 2023-03-20.
//

import UIKit

class GameViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    
    let toGameOverSegue = "toGameOverSegue"
    
    var deck = Deck()
    
    var randomWord: String = ""
    
    var timer : Timer?
    var timeRemaining = 30
    
    let gradientLayer = CAGradientLayer()
    let greenColor = UIColor.green.cgColor
    let redColor = UIColor.red.cgColor
    
    var players = Players()
    
    var recievingName : String = ""
    var playerPoints : Int = 0
    
    //a timer for how long time the user got before the game is finished
    //points for when the user writes correct answer
    //color changes on the background if the user writes wrong letter
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textField.delegate = self
        
        //start game
        randomWord = deck.randomWord()
        wordLabel.text = randomWord
        
        // Set up the gradient layer
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [greenColor, redColor]
        gradientLayer.locations = [0.0, 1.0]
        view.layer.insertSublayer(gradientLayer, at: 0)
                
        //start the countdown timer
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        // concatenate the text in the text field with the new characters
          let newText = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) ?? ""
          
        // check if the new text matches the expected word
        if newText == randomWord {
            randomWord = deck.randomWord()
            wordLabel.text = randomWord
            playerPoints += 1
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    textField.text = ""
                }
        }
        
          // always return true to allow the user to type
          return true
    }
    
    
    @objc func updateTimer(){
        timeRemaining -= 1
        
        // Calculate the percentage of the countdown completed
        let percentageCompleted = CGFloat(timeRemaining) / 30.0
                
        // Update the gradient layer's locations to change the color over time
        gradientLayer.locations = [0.0, NSNumber(value: Float(percentageCompleted))]
                
        //update countdown label
        timerLabel.text = "\(timeRemaining) + \(playerPoints)"
        if timeRemaining == 0 {
            //stop timer
            timer?.invalidate()
            view.layer.removeAllAnimations()
            
            players.add(player: Player(points: playerPoints, name: recievingName))
            print(players.count + 1)
            
            performSegue(withIdentifier: toGameOverSegue, sender: self)
        }
    }
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            
            if segue.identifier == toGameOverSegue {
                if let destinationViewController = segue.destination as? GameOverViewController{
                    timer?.invalidate()
                    destinationViewController.name = recievingName
                    destinationViewController.points = playerPoints
                }
            }
            
        }
    

}
