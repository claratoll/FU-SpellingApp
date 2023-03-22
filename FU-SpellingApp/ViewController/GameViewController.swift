//
//  GameViewController.swift
//  FU-SpellingApp
//
//  Created by Clara Toll on 2023-03-20.
//

import UIKit

class GameViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var wordLabel: UILabel!
    
    @IBOutlet weak var textField: UITextField!
    
    var deck = Deck()
    
    var randomWord: String = ""
    
    //a timer for how long time the user got before the game is finished
    //points for when the user writes correct answer
    //color changes on the background if the user writes wrong letter
    
  //  let words = ["apple", "banana", "orange"]


    override func viewDidLoad() {
        super.viewDidLoad()

        textField.delegate = self
        
        randomWord = deck.randomWord()

        wordLabel.text = randomWord
    }
    
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        // concatenate the text in the text field with the new characters
          let newText = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) ?? ""
          
   
        
        // check if the new text matches the expected word
        if newText == randomWord {
            randomWord = deck.randomWord()
            wordLabel.text = randomWord
            //textField.text = ""
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    textField.text = ""
                }
        }
        
          // always return true to allow the user to type
          return true
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
