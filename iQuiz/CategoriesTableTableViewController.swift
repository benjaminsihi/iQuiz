//
//  CategoriesTableTableViewController.swift
//  iQuiz
//
//  Created by Personal on 2/12/19.
//  Copyright © 2019 Benjamin Shi. All rights reserved.
//

import UIKit

class CategoriesTableTableViewController: UITableViewController {
    var data = [
        Category(title: "Mathematics", subtitle: "Math Questions", questions: ["Question 1", "Question 2"], imageName: "math"),
        Category(title: "Marvel Super Heroes", subtitle: "Marvel Super Hero Questions", questions: ["Question 1", "Question 2"], imageName: "marvel"),
        Category(title: "Science", subtitle: "Science Questions", questions: ["Question 1", "Question 2"], imageName: "science")
    ]
    
    @IBAction func settingsPressed(_ sender: Any) {
        let refreshAlert = UIAlertController(title: "Settings", message: "Settings go here", preferredStyle: UIAlertController.Style.alert)
        
        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
                    refreshAlert.dismiss(animated: true, completion: nil)
                }))
        
        present(refreshAlert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "iQuiz"
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // TODO : FACTOR OUT THE DATA SOURCE

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cells = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
        
        let element = data[indexPath.row]
        cells.textLabel?.text = element.title
        cells.detailTextLabel?.text = element.subtitle
        cells.imageView?.image = element.image
        //print(cell)

        return cells
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Categories"
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    
//    // Override to support rearranging the table view.
//    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
//
//    }
//
//
//
//    // Override to support conditional rearranging of the table view.
//    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
//        // Return false if you do not want the item to be re-orderable.
//        return true
//    }
 


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let rowClicked = tableView.indexPathForSelectedRow?.row
        if segue.identifier == "CatToQuiz" {
            let destination = segue.destination as! QuestionsTableViewController
            destination.category = data[rowClicked!]
        }
    }
 

}
