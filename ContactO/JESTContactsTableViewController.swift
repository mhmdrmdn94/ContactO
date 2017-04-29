//
//  JESTContactsTableViewController.swift
//  ContactO
//
//  Created by JETS on 4/29/17.
//  Copyright © 2017 JETS. All rights reserved.
//

import UIKit

class JESTContactsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        print("ContactsTable is shown .. :)")
        
        var addButton : UIBarButtonItem = UIBarButtonItem(title: "+", style: UIBarButtonItemStyle.Plain, target: self, action: "addNewContact")
        
        self.navigationItem.rightBarButtonItem = addButton
        
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         //self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        cell.textLabel?.text = "ContactName is HERE"
        cell.detailTextLabel?.text = "PhoneNumber"
        
        return cell
    }
 
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("\( indexPath.row )  is selected .. :) ")
        
        var details : JETSDetailsViewController = self.storyboard?.instantiateViewControllerWithIdentifier("detailsCtrl") as! JETSDetailsViewController
        
        self.navigationController?.pushViewController(details, animated: true)
        
    }
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
    
    func addNewContact (){
    
        print("Adding new Contact ... :)")
    
        var addCtrl : JETSAddViewController = self.storyboard?.instantiateViewControllerWithIdentifier("addCtrl") as! JETSAddViewController
        
        
        self.navigationController?.pushViewController(addCtrl, animated: true)
        
        
    }
    
    
    
    
}
