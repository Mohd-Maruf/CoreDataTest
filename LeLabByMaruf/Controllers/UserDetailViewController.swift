//
//  UserDetailViewController.swift
//  LeLabByMaruf
//
//  Created by Mohammad Maruf on 27/04/21.
//  Copyright © 2021 Mohammad Maruf. All rights reserved.
//

import UIKit
import CoreData

class UserDetailViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    // MARK: Variables & Models
    var user = UsersData()

    // MARK: View Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationItem.title = user.name
    }
    
    // MARK: Configuring UI
    private func configureUI() {
        nameLabel.text = "Hello \(user.username ?? ""),"
        emailLabel.text = "Email: \(user.email ?? "")"
        phoneLabel.text = "Phone: \(user.phone ?? "")"
        websiteLabel.text = "Website: \(user.website ?? "")"
        companyLabel.text = "Company: \(user.company ?? "")"
        addressLabel.text = "Address: \(user.suite ?? "") \(user.street ?? ""),\n\(user.city ?? "")"
    }
}
