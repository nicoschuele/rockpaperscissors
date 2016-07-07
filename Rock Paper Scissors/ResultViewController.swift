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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func playAgain(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}
