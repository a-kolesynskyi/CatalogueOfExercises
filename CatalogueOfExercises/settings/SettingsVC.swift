//
//  SettingsVC.swift
//  CatalogueOfExercises
//
//  Created by Antony Kolesynskyi on 5/10/19.
//  Copyright © 2019 Antony Kolesynskyi. All rights reserved.
//

import UIKit

var indexOfCell = Int()

class SettingsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let settingsTitles = ["Передышка","Длительность упражнения"]
    let headerTitles = ["First title","Second title"]
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.7760609984, green: 0.3380751014, blue: 0.3274240494, alpha: 1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - Table view data source
     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return settingsTitles.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 50))
        footerView.backgroundColor = UIColor.clear
        return footerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 75))
        footerView.backgroundColor = UIColor.clear
        return footerView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 75
    }

    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingsCell", for: indexPath)
        cell.textLabel?.text = String("\(settingsTitles[indexPath.row])")
        cell.textLabel?.font = UIFont(name: "AppleSDGothicNeo", size: 18)
        cell.backgroundColor = #colorLiteral(red: 0.7556931973, green: 0.3860400915, blue: 0.3728385568, alpha: 1)
        cell.textLabel?.textColor = UIColor.white
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "settingsCustomatization", sender: self)
        indexOfCell = indexPath.row
        print("\(indexOfCell)")
    }


}
