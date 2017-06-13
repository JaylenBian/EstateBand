//
//  UserListViewController.swift
//  EstateBand
//
//  Created by Minecode on 2017/6/12.
//  Copyright © 2017年 org.minecode. All rights reserved.
//

import UIKit
import CoreData

class UserListViewController: UITableViewController {
    
    // Data
    var appDelegate: AppDelegate!
    var userArray: [AnyObject]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Reload Data
        self.appDelegate = UIApplication.shared.delegate as! AppDelegate
        // 设置导航数据
        
        // 设置底栏数据
        self.tabBarItem.title = "Worker List"
        self.tabBarItem.image = UIImage(named: "userList")
        // 装载表格数据
        self.tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let request = NSFetchRequest<NSFetchRequestResult>()
        let entity = NSEntityDescription.entity(forEntityName: "User", in: self.appDelegate.managedObjectContext)
        request.entity = entity
        userArray = try! self.appDelegate.managedObjectContext.fetch(request) as [AnyObject]
        self.tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath)
        let user = userArray[indexPath.row] as! User
        
        cell.textLabel?.text = user.name
        cell.detailTextLabel?.text = String(format: "%@%d", String("WorkID: "), user.workNumber)
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let rowNo = indexPath.row
            let deleteUser = userArray[rowNo] as! User
            
            self.appDelegate.managedObjectContext.delete(deleteUser)
            
            do{
                try self.appDelegate.managedObjectContext.save()
            } catch {
                let alert = UIAlertController(title: "Failed", message: "Something error!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Confirm", style: .cancel, handler: {
                    (action) in self.dismiss(animated: true, completion: nil)
                }))
                self.present(alert, animated: true, completion: nil)
            }
            userArray.remove(at: rowNo)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } 
    }
    

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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPath = self.tableView.indexPath(for: sender as! UITableViewCell)
        let target = segue.destination as! UserDetailViewController
        target.user = userArray[indexPath!.row] as! User
    }
    

}
