//
//  CustomSettingsVC.swift
//  CatalogueOfExercises
//
//  Created by Antony Kolesynskyi on 5/10/19.
//  Copyright © 2019 Antony Kolesynskyi. All rights reserved.
//

import UIKit

class CustomSettingsVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let customUserInfo = [10, 15, 30, 45, 60]
    let userDataKind = ["restTime","trainingTime"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 75))
        footerView.backgroundColor = UIColor.clear
        let label = UILabel(frame: CGRect(x: 15, y: footerView.frame.minY, width: footerView.frame.maxX - 30, height: footerView.frame.maxY - 30))
        label.text = String("Выбирете ту скорость, с которой вам будет работать удобнее всего. Учитывайте ваши навыки и опыт.")
        label.font = UIFont(name: "Apple SD Gothic Neo", size: 13)
        label.numberOfLines = 3
        label.textColor = UIColor.white
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        footerView.addSubview(label)
        return footerView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 75
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 50))
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    


     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return customUserInfo.count
    }

    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customСellId", for: indexPath)
        cell.textLabel?.text = String("\(customUserInfo[indexPath.row]) секунд")
        cell.backgroundColor = #colorLiteral(red: 0.7760609984, green: 0.3380751014, blue: 0.3274240494, alpha: 1)
        cell.textLabel?.textColor = UIColor.white
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        tableView.cellForRow(at:indexPath)!.accessoryType = .checkmark
        
        for cellPath in tableView.indexPathsForVisibleRows! {
            if cellPath == indexPath {
                if indexOfCell == 0 {
                print("was selected cell with index \(indexPath.row)")
                UserDefaults.standard.set(customUserInfo[indexPath.row] + 1, forKey: userDataKind[indexOfCell])
                } else {
                    UserDefaults.standard.set(customUserInfo[indexPath.row], forKey: userDataKind[indexOfCell])
                }
                continue
            }
            tableView.cellForRow(at: cellPath)!.accessoryType = .none
        }
        
    }
    

   

}
