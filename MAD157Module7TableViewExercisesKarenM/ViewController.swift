//
//  ViewController.swift
//  MAD157Module7TableViewExercisesKarenM
//
//  Created by Karen Mathes on 10/1/20.
//  Copyright © 2020 TygerMatrix Software. All rights reserved.
//

//******************************************************************
//***..  Part 3 - TableViewAppWithAlert
//******************************************************************

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet var petTable: UITableView!
    
    let petArray = ["cat", "dog", "parakeet", "parrot", "canary", "finch", "tropical fish", "goldfish", "sea horses", "hamster", "gerbil", "rabbit", "turtle", "snake", "lizard", "hermit crab"]
    
    let cellID = "cellID"
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        petTable.delegate = self
        petTable.dataSource = self
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        if (cell == nil ) {
            cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: cellID)
       }
        
       cell?.textLabel?.text = petArray[indexPath.row]
        return cell!
    }
    
    func tableView( _ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedItem = petArray[indexPath.row]
        
        let alert = UIAlertController(title: "Your Choice", message: "\(selectedItem)", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: {
            action -> Void in
            //Just dismiss the action sheet
        })
        
        alert.addAction(okAction)
        self.present(alert, animated: true , completion: nil )
    }

}

