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
    
    @IBOutlet weak var playCountLabel: UILabel!
    
    var selectedHand: Hand?
    
    @IBAction func play(sender: UIButton) {
        switch sender.tag {
        case 0:
            playHand(Hands.rock)
        case 1:
            playHand(Hands.paper)
        default:
            playHand(Hands.scissors)
        }
    }
    
    func playHand(hand: Hand) {
        selectedHand = hand
        performSegueWithIdentifier("showResult", sender: self)
    }
    
    func displayPlayCount() {
        let gameWord = Results.playCount == 1 ? "game" : "games"
        let message = "\(Results.playCount) \(gameWord) played"
        playCountLabel.text = message
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        displayPlayCount()
        
        print(Results.results)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier ==  "showResult" {
            let targetVC = segue.destinationViewController as! ResultViewController
            targetVC.opponentHand = Game.randomDraw()
            
            if let value = selectedHand {
                targetVC.playerHand = value
            }
        }
    }
}
