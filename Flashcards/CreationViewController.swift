//
//  CreationViewController.swift
//  Flashcards
//
//  Created by Amiyah Richardson on 3/18/22.
//

import UIKit

class CreationViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    let text = UITextField().self

    
    @IBAction func didTaponCancel(_ sender: Any) {
        dismiss(animated: true)
    }
 
    @IBAction func question(_ sender: Any) {
    }
    
    
    @IBAction func answer(_ sender: Any) {
    }
    

    @IBAction func didTaponDone(_ sender: Any) {
        
       
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
   

}
