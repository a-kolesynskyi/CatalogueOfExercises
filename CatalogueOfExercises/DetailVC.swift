//
//  DetailVC.swift
//  CatalogueOfExercises
//
//  Created by Antony Kolesynskyi on 5/3/19.
//  Copyright © 2019 Antony Kolesynskyi. All rights reserved.
//

import UIKit
import YoutubePlayer_in_WKWebView

class DetailVC: UIViewController {

    @IBOutlet weak var exercisesWebView: WKYTPlayerView!
    @IBOutlet weak var exercisesDescriptLabel: UILabel!
    
    let currentVideoID = dataArray.arrayOfVideoID[pageType][exercisesIndex]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        exercisesDescriptLabel.text = detailDescription
        view.backgroundColor = coloreType
        let playerVars: [AnyHashable: Any] = ["playsinline" : 1,
                                              "origin": "https://www.youtube.com"]
        self.exercisesWebView.load(withVideoId: String("\(currentVideoID)"), playerVars: playerVars)
        self.navigationItem.title = String("\(exercisesName)")
        exercisesDescriptLabel.textColor = UIColor.white
        self.navigationController?.navigationBar.barTintColor = coloreType
    }
}
