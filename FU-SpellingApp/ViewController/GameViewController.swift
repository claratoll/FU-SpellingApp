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
    
    var deck = Deck()
    
    var randomWord: String = ""
    
    var timer : Timer?
    var timeRemaining = 30
    
  //  var player : Player?
    var players = Players()
    
    var recievingName : String = ""
    var playerPoints : Int = 0
    
    //a timer for how long time the user got before the game is finished
    //points for when the user writes correct answer
    //color changes on the background if the user writes wrong letter
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textField.delegate = self
        
        randomWord = deck.randomWord()

        wordLabel.text = randomWord
        
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
        
        //update countdown label
        timerLabel.text = "\(timeRemaining) + \(playerPoints)"
        if timeRemaining == 0 {
            //stop timer
            timer?.invalidate()
            //timer = nil
            
            players.add(player: Player(points: playerPoints, name: recievingName))
            print(players.count + 1)
        }
    }
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
