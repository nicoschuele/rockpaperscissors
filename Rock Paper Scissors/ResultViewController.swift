//
//  ResultViewController.swift
//  Rock Paper Scissors
//
//  Created by Nico Schuele on 08/07/16.
//  Copyright © 2016 Nico Schuele. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var resultIcon: UIImageView!
    @IBOutlet weak var resultMessage: UILabel!
    @IBOutlet weak var playerChoice: UIImageView!
    @IBOutlet weak var opponentChoice: UIImageView!
    
    var playerHand: Hand?
    var opponentHand: Hand?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // If one of the hands is nil, just dismiss the view
        if playerHand == nil || opponentHand == nil {
            self.dismissViewControllerAnimated(true, completion: nil)
            return
        }
        
        // Set the UI
        playerChoice.image = UIImage(named: (playerHand?.imageName)!)
        opponentChoice.image = UIImage(named: (opponentHand?.imageName)!)
        
        // Figure out the winner
        switch Game.comparePlayerHand(playerHand!, withOpponent: opponentHand!) {
        case .Win:
            resultIcon.image = UIImage(named: "win")
            resultMessage.text = "You win!"
        case .Lose:
            resultIcon.image = UIImage(named: "lose")
            resultMessage.text = "You lose..."
        case .Tie:
            resultIcon.image = UIImage(named: "tie")
            resultMessage.text = "It's a tie!"
        }
        
        
    }
    
    @IBAction func playAgain(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}
