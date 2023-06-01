//
//  ThrowViewController.swift
//  Roshambo
//
//  Created by Monty Harper on 5/30/23.
//

import UIKit

class ThrowViewController: UIViewController {

    // I turned rock paper scissors into a Type with this enum
    
    enum Throw {
        case rock
        case paper
        case scissors
    }
    
    // This function determines the app's throw randomly

    func myThrow() -> Throw {
        let throwOption = [Throw.rock,Throw.paper,Throw.scissors]
        let choice = Int.random(in:0...2)
        return (throwOption[choice])
    }
    
    // This function determines the result of the two throws, using a duple to return both the text for the label and the name of the image to show. "Me/my" is the app, and "you/your" is the human player.
    
    func result(myThrow:Throw,yourThrow:Throw) -> (String,String) {
        
        switch myThrow {
            
        case Throw.rock:
            
            switch yourThrow {
            case Throw.rock:
                return ("We both threw rock. It's a tie.","itsATie.png")
            case Throw.paper:
                return ("Paper beats rock. You win!","PaperCoversRock.jpg")
            case Throw.scissors:
                return ("Rock beats scissors. I win!","RockCrushesScissors.jpeg")
            }
            
        case Throw.paper:
            
            switch yourThrow {
            case Throw.rock:
                return ("Paper beats rock. I win!", "PaperCoversRock.jpg")
            case Throw.paper:
                return ("We both threw paper. It's a tie.", "itsATie.png")
            case Throw.scissors:
                return ("Scissors beats paper. You win!", "ScissorsCutPaper.jpg")
            }
            
        case Throw.scissors:
            
            switch yourThrow {
            case Throw.rock:
                return ("Rock beats scissors. You win!", "RockCrushesScissors.jpeg")
            case Throw.paper:
                return ("Scissors beats paper. I win!", "ScissorsCutPaper.jpg")
            case Throw.scissors:
                return ("We both threw scissors. It's a tie.", "itsATie.png")
            }
        }
        
    }
    
    // This function represents the first method of transition. It is connected to the rock button. It sets up the Result image controller and then presents it programmatically.
    
    @IBAction func throwRock() {
       
        let controller: ResultViewController
        controller = storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
        let result = result(myThrow:myThrow(),yourThrow:Throw.rock)
        controller.labelText = result.0
        controller.imageName = result.1
        present(controller, animated: true, completion: nil)
    }
    
    // This function represents the second method of transition. It is connected to the paper button and calls a segue to the Result image controller programmatically. The setup is done below in the override prepare for segue function.
    
    @IBAction func throwPaper() {
        self.performSegue(withIdentifier: "throwPaper", sender: self)
    }
    
    // This function represents the third method of transition. It is called whenever a segue is triggered. The scissors button triggers a segue directly, and the paper button triggers a segue programatically through the above IBAction. This function choses which results to send to the results view controller using a switch statement based on which segue is called.
    
    override func prepare (for segue: UIStoryboardSegue, sender: Any?) {
       
        let controller = segue.destination as! ResultViewController
        
        switch segue.identifier {
            
        case "throwPaper":
            let result = result(myThrow:myThrow(),yourThrow:Throw.paper)
            controller.labelText = result.0
            controller.imageName = result.1
            
        case "throwScissors":
            let result = result(myThrow:myThrow(),yourThrow:Throw.scissors)
            controller.labelText = result.0
            controller.imageName = result.1
            
        default:
            controller.labelText = "Something Went Wrong"
            controller.imageName = nil
            
        }
            

    }
}
    


