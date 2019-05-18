//
//  CatalogueVC.swift
//  CatalogueOfExercises
//
//  Created by Antony Kolesynskyi on 5/1/19.
//  Copyright © 2019 Antony Kolesynskyi. All rights reserved.
//

import UIKit

var exercisesIndex = Int()
var exercisesName = String()
var detailDescription = String()
var coloreType = UIColor()
var dataArray = CatalogueData()

class CatalogueVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var startButton: UIButton!

    var indexOfPage: Int = 0
    var exercisesTitle = String()
    var arrayOfExercises = dataArray.fullExercisesArray[pageType]
    var arrayOfDescription = dataArray.fullArrayOfDescription[pageType]
    var arrayOfColors = dataArray.fullArrayOfColors[pageType]
    let headerTypeColor = [UIColor.FlatColor.Red.Valencia,
                           UIColor.FlatColor.Blue.BlueWhale,
                           UIColor.FlatColor.Red.Valencia,
                           UIColor.FlatColor.Blue.Chambray]
    
    @IBAction func startButtonAction(_ sender: Any) {
        performSegue(withIdentifier: "start", sender: self)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        myTableView.reloadData()
        self.navigationController?.navigationBar.barTintColor = headerTypeColor[pageType]
        self.myTableView.backgroundColor = headerTypeColor[pageType]
        if let index = myTableView.indexPathForSelectedRow {
        myTableView.deselectRow(at: index, animated: true)

        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        startButton.layer.cornerRadius = 8
        startButton.layer.backgroundColor = #colorLiteral(red: 0.8636800051, green: 0.3133581281, blue: 0.2774325013, alpha: 1)

//        UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
//        UserDefaults.standard.synchronize()
//        print(Array(UserDefaults.standard.dictionaryRepresentation().keys).count)
//

    }
    
     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayOfExercises.count
    }
    
   
    //header view
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 175))
        headerView.backgroundColor = headerTypeColor[pageType]
        exercisesTitle = dataArray.exercisesTitles[pageType]
        
        
        var pageControl = UIPageControl()
        pageControl = UIPageControl(frame: CGRect(x: headerView.bounds.maxX / 2 - 15, y: headerView.bounds.maxY - 25, width: 25, height: 25))
        pageControl.numberOfPages = 4
        pageControl.currentPage = pageType
        pageControl.pageIndicatorTintColor = UIColor.white
        pageControl.currentPageIndicatorTintColor = UIColor.black
        pageControl.tintColor = UIColor.white
        headerView.addSubview(pageControl)
        
        let label = UILabel(frame: headerView.frame)
        label.text = String("\(exercisesTitle)")
        label.textColor = UIColor.white
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 30)
        label.textAlignment = .center
        label.numberOfLines = 3
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        headerView.addSubview(label)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 175
    }

     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CatalogueCell", for: indexPath) as! CatalogueCell
        let index = indexPath.row + 1
        cell.exerciseNameLabel.text = arrayOfExercises[indexPath.row]
        cell.exercisesNumbLabel.text = String(index)
        cell.backgroundColor = arrayOfColors[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        exercisesIndex = indexPath.row
        exercisesName = arrayOfExercises[indexPath.row]
        coloreType = arrayOfColors[indexPath.row]
        detailDescription = arrayOfDescription[indexPath.row]
        performSegue(withIdentifier: "Exercises", sender: self)

    }
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
}
