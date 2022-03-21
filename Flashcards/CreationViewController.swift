//
//  CreationViewController.swift
//  Flashcards
//
//  Created by Amiyah Richardson on 3/18/22.
//

import UIKit

class CreationViewController: UIViewController {
    
    var flashcardsController: ViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var questionEntered: UITextField!
    
    
    @IBOutlet weak var answerEntered: UITextField!
    
    @IBAction func didTaponCancel(_ sender: Any) {
        dismiss(animated: true)
    }
 
    @IBAction func didTaponDone(_ sender: Any) {
        
        let questionText = questionEntered.text
        
        let answerText = answerEntered.text
        
        flashcardsController.updateFlashcard(question: questionText!, answer: answerText!)

        dismiss(animated: true)
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
   

}
