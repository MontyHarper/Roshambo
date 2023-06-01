//
//  ResultViewController.swift
//  Roshambo
//
//  Created by Monty Harper on 5/30/23.
//

import Foundation
import UIKit

class ResultViewController: UIViewController {

    var labelText: String?
    var imageName: String?
    
    @IBAction func playAgain() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet var winner: UILabel!
    @IBOutlet var illustration: UIImageView!
   

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let labelText = self.labelText {
            self.winner.text = labelText
        } else {
            self.winner.text = "Something Went Wrong"
        }
        
       
        if let imageName = self.imageName {
            self.illustration.image = UIImage(named: imageName)
        } else {
            self.illustration.image = nil
        }
         
        
    }
    
    
}
