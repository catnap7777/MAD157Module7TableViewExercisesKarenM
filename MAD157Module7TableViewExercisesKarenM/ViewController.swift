//
//  ViewController.swift
//  MAD157Module7TableViewExercisesKarenM
//
//  Created by Karen Mathes on 10/1/20.
//  Copyright © 2020 TygerMatrix Software. All rights reserved.
//

//******************************************************************
//***..  Part 4 - GroupedTableViewApp
//******************************************************************

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet var petTable: UITableView!
    
    //.. without trying to use sections
//    let petArray = ["cat", "dog", "parakeet", "parrot", "canary", "finch", "tropical fish", "goldfish", "sea horses", "hamster", "gerbil", "rabbit", "turtle", "snake", "lizard", "hermit crab"]
    
    //.. with using sections
    let petArray = [["Mammal", "cat", "dog", "hamster", "gerbil", "rabbit"], ["Bird", "parakeet", "parrot", "canary", "finch"], ["Fish", "tropical fish", "goldfish", "sea horses"], ["Reptile", "turtle", "snake", "lizard"]]
    
    let cellID = "cellID"
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        petTable.delegate = self
        petTable.dataSource = self
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return petArray.count
        //.. When determining the number of rows in each section, we need to subtract 1 because the section header appears at the beginning of each array.
        return petArray[section].count - 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //.. use this if defining visually with storyboard and inspector identifier with "cellID"
        //.. since the first element of each array contains a section header, we need to skip over this header by adding 1 to the array index like this line,
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID")
////        cell?.textLabel?.text = petArray[indexPath.row]
////        cell?.textLabel?.text = petArray[indexPath.row + 1]
//        return cell!
        //.. use this if defining without visual (ie. no prototype cell on story board)
        //..
//..  let cellID = "cellID" // --> in Class and
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        if (cell == nil ) {
            cell = UITableViewCell(style: UITableViewCell.CellStyle.default,reuseIdentifier: cellID)
        }
        
        cell?.textLabel?.text = petArray[indexPath.section][indexPath.row + 1]
        return cell!

    }
    
    func tableView( _ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //..since the first element of each array contains a section header, we need to skip over this header by adding 1 to the array index like this line...
        //.. we need to identify the item the user tapped on with this code

//        let selectedItem = petArray[indexPath.row]
        let selectedItem = petArray[indexPath.section][indexPath.row + 1]

        let alert = UIAlertController(title: "Your Choice", message: "\(selectedItem)", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: {
            action -> Void in
            //Just dismiss the action sheet
        })
        
        alert.addAction(okAction)
        self.present(alert, animated: true , completion: nil )
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return petArray[section][0]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return petArray.count
    }

}

