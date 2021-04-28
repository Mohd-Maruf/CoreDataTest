//
//  HomeTableViewCell.swift
//  LeLabByMaruf
//
//  Created by Mohammad Maruf on 27/04/21.
//  Copyright © 2021 Mohammad Maruf. All rights reserved.
//

import UIKit
import CoreData

class HomeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var namelabel: UILabel!
    @IBOutlet weak var phoneNumberlabel: UILabel!
    
    func configureCell(_ model: UsersData) {
        namelabel.text = model.name
        phoneNumberlabel.text = model.phone
    }
}
