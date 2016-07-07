//
//  MainViewController.swift
//  Rock Paper Scissors
//
//  Created by Nico Schuele on 08/07/16.
//  Copyright © 2016 Nico Schuele. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()     
    }

    @IBAction func play(sender: UIButton) {
        switch sender.tag {
        case 0:
            print("rock")
        case 1:
            print("paper")
        case 2:
            print("scissors")
        default:
            print("wtf?")
        }
    }
}
