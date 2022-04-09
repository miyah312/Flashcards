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
    
    var flashcards = [Flashcard]()
    var currentIndex = 0
    
    @IBOutlet weak var frontQuestionLabel: UILabel!
    @IBOutlet weak var backAnswerLabel: UILabel!
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var prevButton: UIButton!
    
    @IBAction func didTapOnNext(_ sender: Any) {
        
        currentIndex = currentIndex + 1
        updateNextPrevButtons()
        animateCardOut()
    }
    
    @IBOutlet weak var card: UIView!
    
    func updateLabels(){
        let currentFlashcard = flashcards[currentIndex]
       frontQuestionLabel.text = currentFlashcard.question
       backAnswerLabel.text = currentFlashcard.answer
   }
    
    @IBAction func didTapOnPrev(_ sender: Any) {
        currentIndex = 0
        updateNextPrevButtons()
        animateCardIn()
    }
    
    func saveAllFlashcardsToDisk() {
        
        let dictionaryArray = flashcards.map { (card) -> [String: String] in return ["question": card.question, "answer": card.answer]
        }
            
            UserDefaults.standard.set(dictionaryArray, forKey: "flashcards")
            
            print("🎊 Flashcards saved to UserDefaults" )
        }
        
    func readSavedFlashcards() {
        if let dictionaryArray = UserDefaults.standard.array(forKey: "flashcards") as? [[String : String]] {
            
            let savedCards = dictionaryArray.map {dictionary -> Flashcard in return Flashcard (question: dictionary["question"]!, answer: dictionary["answer"]!)
                
            }
            flashcards.append(contentsOf: savedCards)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        readSavedFlashcards()
        // Do any additional setup after loading the view.
        if flashcards.count == 0 {
        updateFlashcard(question: "What is 'Hello' in Spanish?", answer: "Hola")
        } else {
            updateLabels()
            updateNextPrevButtons()
        }
    }

    @IBAction func didTaponFlashcard(_ sender: Any) {
    
        flipFlashcard() }

    func flipFlashcard () {
        
        UIView.transition(with: card, duration: 0.3, options: .transitionFlipFromRight, animations:{ self.frontQuestionLabel.isHidden = true } )
        
        if frontQuestionLabel.isHidden == false {
            frontQuestionLabel.isHidden = true
        }
        
    }
    
    func animateCardOut () {
        UIView.animate(withDuration: 0.3, animations:{ self.card.transform = CGAffineTransform.identity.translatedBy(x: -300.0, y: 0.0) }, completion:{ finished in
            
            self.updateLabels()
            
            self.animateCardIn()
        } )
    }
    
    func animateCardIn () {
        card.transform = CGAffineTransform.identity.translatedBy(x: 300.0, y: 0.0)
                
                UIView.animate(withDuration: 0.3) { self.card.transform = CGAffineTransform.identity
                            }
    }
    
    func animatePressPrev () {
        UIView.animate(withDuration: 0.3, animations: { self.card.transform = CGAffineTransform.identity.translatedBy(x: 300.0, y: 0.0) }, completion:{ finished in
            
            self.updateLabels()
            
            self.animateCardOut()
                       } )
                       }
    
    func updateNextPrevButtons() {
                if currentIndex == flashcards.count - 1{
                    nextButton.isEnabled = false
                } else {
                    nextButton.isEnabled = true
                }
                if currentIndex == 0{
                    prevButton.isEnabled = false
                } else {
                    prevButton.isEnabled = true
            }
    }
    
    func updateFlashcard(question : String ,answer : String){
            let flashcard = Flashcard (question: question, answer: answer)
            
        frontQuestionLabel.text = flashcard.question
        backAnswerLabel.text = flashcard.answer
            
        flashcards.append(flashcard)
        
        updateNextPrevButtons()
        
        print("🥳 Added new flashcards")
        currentIndex = flashcards.count - 1
        print("🥳 We now have \(flashcards.count) flashcards")
        
        updateLabels()
        updateNextPrevButtons()
        saveAllFlashcardsToDisk()
            
            dismiss(animated: true)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let navigationController = segue.destination as! UINavigationController
        
        let creationController = navigationController.topViewController as! CreationViewController
        
        creationController.flashcardsController = self
    }

}

