//
//  HistoryViewController.swift
//  Rock Paper Scissors
//
//  Created by Nico Schuele on 03/08/16.
//  Copyright © 2016 Nico Schuele. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Results.results.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ResultCell")!
        let result = Results.results[indexPath.row]
        cell.textLabel?.text = result.result
        cell.detailTextLabel?.text = "\(result.playerHand) vs \(result.aiHand)"
        return cell
    }

    @IBAction func closeHistory(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
