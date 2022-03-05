//
//  ViewController.swift
//  Flashcards
//
//  Created by Amiyah Richardson on 2/26/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var answer: UILabel!
    @IBOutlet weak var question: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func didTaponFlashcard(_ sender: Any) {question.isHidden = true
    }
    
    
}

