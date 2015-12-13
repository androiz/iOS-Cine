//
//  SesionesTableViewController.swift
//  Cine
//
//  Created by Andrés Rojano Ruiz on 8/12/15.
//  Copyright © 2015 Andrés Rojano Ruiz. All rights reserved.
//

import UIKit

class SesionesTableViewController: UITableViewController {
    
    var film:NSDictionary = [:]
    
    var sessions = [:]
    var days = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        let str_sessions = self.film["sessions"] as? String
        self.sessions = convertStringToDictionary(str_sessions!)!
        self.days = (self.sessions.allKeys as! [String])
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
        return self.sessions.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let reuseIdentifier = "SessionCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier, forIndexPath: indexPath) as! SesionesTableViewCell
        
        if(self.days != 0){
            cell.day!.text = self.days[indexPath.row] as? String
            
            var newView = UIView(frame: CGRectMake(200, 10, 100, 50))
            newView.backgroundColor=UIColor.greenColor()
            cell.contentView.addSubview(newView)
        }

        return cell
    }
    
    func convertStringToDictionary(data: String) -> [NSObject: AnyObject]? {
        if let data = data.dataUsingEncoding(NSUTF8StringEncoding) {
            var json = [:]
            do {
                json = try NSJSONSerialization.JSONObjectWithData(data, options:[]) as! [NSObject: AnyObject]
            } catch let myJSONError {
                print(myJSONError)
            }
            return json as [NSObject : AnyObject]
        }
        return nil
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

}
