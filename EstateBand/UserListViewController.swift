//
//  UserListViewController.swift
//  EstateBand
//
//  Created by Minecode on 2017/6/12.
//  Copyright © 2017年 org.minecode. All rights reserved.
//

import UIKit
import CoreData



class UserListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // Widget List
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var logoutButton: UIBarButtonItem!
    var deleteButton: UIBarButtonItem!
    
    // Data
    var appDelegate: AppDelegate!
    var userArray: [AnyObject]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.appDelegate = UIApplication.shared.delegate as! AppDelegate
        // 设置导航数据
        self.navigationItem.title = "Worker List"
        deleteButton = UIBarButtonItem(title: "Delete", style: .plain, target: self, action: #selector(toggleDelete(_:)))
        self.navigationItem.leftBarButtonItem = deleteButton
        // 设置底栏数据
        self.tabBarItem.title = "Worker List"
        self.tabBarItem.image = UIImage(named: "userList")
        // 装载表格数据
        self.automaticallyAdjustsScrollViewInsets = false
        self.tableView.dataSource = self
        // 设置界面数据
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // 创建要抓取的目标实体
        let request = NSFetchRequest<NSFetchRequestResult>()
        let entity = NSEntityDescription.entity(forEntityName: "User", in: self.appDelegate.managedObjectContext)
        request.entity = entity
        userArray = try! self.appDelegate.managedObjectContext.fetch(request) as [AnyObject]
        self.tableView.reloadData()
        // 修改界面数据
        headerLabel.text = "\(userArray.count) workers"
    }
    
    func toggleDelete(_ sender: AnyObject) {
        self.tableView.setEditing(!self.tableView.isEditing, animated: true)
        if self.tableView.isEditing {
            deleteButton.title = "Done"
        } else {
            deleteButton.title = "Delete"
        }
    }
    
    @IBAction func logoutAction(_ sender: UIBarButtonItem) {
        let loginViewController = self.storyboard?.instantiateViewController(withIdentifier: "loginView")
        present(loginViewController!, animated: true, completion: nil)
    }
    
    // MARK: - realization of TableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath)
        let user = userArray[indexPath.row] as! User
        
        cell.textLabel?.text = user.name
        cell.detailTextLabel?.text = String(format: "%@%d", String("WorkID: "), user.workNumber)
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let rowNo = indexPath.row
            let deleteUser = userArray[rowNo] as! User
            self.appDelegate.managedObjectContext.delete(deleteUser)
            do {
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
    
//    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
//        NSLog("Here")
//        let userDetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "userDetailView") as! UserDetailViewController
//        userDetailViewController.user = userArray[indexPath.row] as! User
//        self.navigationController?.pushViewController(userDetailViewController, animated: true)
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue2UserDetailView" {
            let indexPath = self.tableView.indexPath(for: sender as! UITableViewCell)
            let target = segue.destination as! UserDetailViewController
            target.user = userArray[indexPath!.row] as! User
        }
    }
    
}
