//
//  MainViewController.swift
//  Rock Paper Scissors
//
//  Created by Nico Schuele on 08/07/16.
//  Copyright © 2016 Nico Schuele. All rights reserved.
//

// This class demonstrates how to perform segues in 3 different ways:
// - rock: completely from code, without using a Storyboard segue
// - paper: mixed-mode between a manual Storyboard segue and code to trigger it
// - scissors: fully automatic from Storyboard

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()     
    }

    @IBAction func play(sender: UIButton) {
        switch sender.tag {
        case 0:
            rockPressed()
        case 1:
            paperPressed()
        default:
            rockPressed()
        }
    }
    
    func rockPressed() {
        let targetVC = self.storyboard?.instantiateViewControllerWithIdentifier("ResultViewController") as! ResultViewController
        targetVC.playerHand = Hands.rock
        targetVC.opponentHand = Game.randomDraw()
        presentViewController(targetVC, animated: true, completion: nil)
    }
    
    func paperPressed() {
        performSegueWithIdentifier("showResult", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier ==  "showResult" || segue.identifier == "showResultAutomatic" {
            let targetVC = segue.destinationViewController as! ResultViewController
            targetVC.opponentHand = Game.randomDraw()
            
            if segue.identifier == "showResult" {
                targetVC.playerHand = Hands.paper
            } else {
                targetVC.playerHand = Hands.scissors
            }
        }
    }
}
