//
//  SettingsViewController.swift
//  HiitAttack
//
//  Created by Noam Efergan on 17/05/2020.
//  Copyright © 2020 Noam Efergan. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import Firebase

class SettingsViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    

    
    // MARK: - variables
    
    var entries = [ConstantsForApp.results.first!.nameOfUser, ConstantsForApp.results.first!.logOutWord]
    let tableView = UITableView()
    let FaceBLoginManager = LoginManager()

   
    // MARK: View did load
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        placeTableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellID")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 80
    }
    
    //MARK: - Functions
    
    func placeTableView(){
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
                NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }


}

    //MARK: - extention

extension SettingsViewController:UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
        cell.textLabel?.text = entries[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if entries[indexPath.row] == "Logout"{
            let alert = UIAlertController(title: "LOGOUT", message: "Are you sure you want to log out?", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Nope", style: UIAlertAction.Style.default, handler: nil))
            let cancelAction = UIAlertAction(title: "Yes", style: UIAlertAction.Style.destructive) {
                UIAlertAction in
                self.logOutOfEverything()
            }
            alert.addAction(cancelAction)
            self.present(alert, animated: true, completion: nil)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func logOutOfEverything(){
        FaceBLoginManager.logOut()
        do {
         try Auth.auth().signOut()
        }catch{
            print("Was already logged out with email")
        }
        self.navigationController?.popToRootViewController(animated: true)
        
        
    }
    
    
}
