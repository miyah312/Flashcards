//
//  ViewController.swift
//  Flashcards
//
//  Created by Amiyah Richardson on 2/26/22.
//

import UIKit

struct Flashcard {
    var question: String
    var answer: String
}

class ViewController: UIViewController {
    
   
    @IBOutlet weak var frontQuestionLabel: UILabel!
    
    @IBOutlet weak var backAnswerLabel: UILabel!
    
    var flashcards = [Flashcard]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func didTaponFlashcard(_ sender: Any)
    
    { frontQuestionLabel.isHidden = !frontQuestionLabel.isHidden
    
    }
    
func updateFlashcard(question: String, answer: String) {
    
    let flashcard = Flashcard (question: question, answer: answer)
    frontQuestionLabel.text = flashcard.question
    backAnswerLabel.text = flashcard.answer
    
    flashcards.append(flashcard)
        
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let navgationController = segue.destination as! UINavigationController
        
        let creationController = navgationController.topViewController as! CreationViewController
        
        creationController.flashcardsController = self
        
    }

    }
