//
//  CatalogueCell.swift
//  CatalogueOfExercises
//
//  Created by Antony Kolesynskyi on 5/1/19.
//  Copyright © 2019 Antony Kolesynskyi. All rights reserved.
//

import UIKit

class CatalogueCell: UITableViewCell {
    
    @IBOutlet weak var exerciseNameLabel: UILabel!
    @IBOutlet weak var exercisesNumbLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
