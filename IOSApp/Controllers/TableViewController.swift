//
//  TableViewController.swift
//  IOSApp
//
//  Created by Xcode User on 2018-12-12.
//  Copyright © 2018 Kish. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    let getData = GetData()
    var timer : Timer!
    
    @IBOutlet var myTable : UITableView!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.refreshTable), userInfo: nil, repeats: true)
        getData.jsonParser()
        
    }
    
    // @objc is for timer
    @objc func refreshTable()
    {
        if(getData.dbData != nil)
        {
            if((getData.dbData?.count)!>0)
            {
                self.myTable.reloadData()
                self.timer.invalidate()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //tableView.backgroundView = UIImageView(image: UIImage(named: "background.png"))
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        tableView.backgroundView = UIImageView(image: UIImage(named: "backgroundTable1"))
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if getData.dbData != nil
        {
            return (getData.dbData?.count)!
        }
        else
        {
            return 0
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as?
            myDataTableViewCell ?? myDataTableViewCell(style: .default, reuseIdentifier: "myCell")
        
        // Configure the cell...
        let row = indexPath.row
        let rowData = getData.dbData![row] as NSDictionary
        
        //cell.ID.text = rowData["ID"] as? String
        cell.mySong.text = rowData["Name"] as? String
        //cell.Artist.text = rowData["Artist"] as? String
        //cell.Genre.text = rowData["Genre"] as? String
        print(rowData["Song"] as? String)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let split = self.splitViewController
        {
            let controllers = split.viewControllers
            let detailViewControllers = controllers[controllers.count-1] as? DetailViewController
            
            detailViewControllers?.updateSong(getData: getData, select: indexPath.row)
        }
    }
    
    
   
    
}
/*
 // Override to support conditional editing of the table view.
 override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
 // Return false if you do not want the specified item to be editable.
 return true
 }
 
 
 /*
 // Override to support editing the table view.
 override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
 if editingStyle == .delete {
 // Delete the row from the data source
 tableView.deleteRows(at: [indexPath], with: .fade)
 } else if editingStyle == .insert {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */
 
 /*
 // Override to support rearranging the table view.
 override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
 
 }
 */
 
 /*
 // Override to support conditional rearranging of the table view.
 override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
 // Return false if you do not want the item to be re-orderable.
 return true
 }
 */
 
 /*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destinationViewController.
 // Pass the selected object to the new view controller.
 }
 */
 
 }*/


