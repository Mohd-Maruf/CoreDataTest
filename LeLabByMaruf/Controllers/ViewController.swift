//
//  ViewController.swift
//  LeLabByMaruf
//
//  Created by Mohammad Maruf on 27/04/21.
//  Copyright © 2021 Mohammad Maruf. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeTableViewCell")
            tableView.tableFooterView = UIView()
        }
    }
    
    // MARK: Variables & Models
    private var usersArray = [UsersData]()
    private var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    
    // MARK: View Lyfe cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coreDataFetchRequest()
        getUserListApi()
    }
    
    // MARK: CoreData Helper functions
    private func coreDataFetchRequest() {
        let request : NSFetchRequest<UsersData> = UsersData.fetchRequest()
        usersArray.removeAll()
        do {
            self.usersArray = try context.fetch(request)
        } catch  {
            print(error.localizedDescription)
        }
        tableView.reloadData()
    }

    //MARK: Delete object from core data
    private func deleteContext() {
        let fetchRequest: NSFetchRequest<UsersData> = UsersData.fetchRequest()
        let objects = try! context.fetch(fetchRequest)
        for obj in objects {
            context.delete(obj)
        }
        updateCoreData()
    }
    
    // MARK: Updating all date to persistantly
    private func updateCoreData() {
        do {
            try context.save() // <- remember to put this :)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    // MARK: CoreData Save function
    private func saveCoreData(_ users: [Users]) {
        deleteContext()
        for item in users {
            let selectedUser = UsersData(context: self.context)
            selectedUser.id = "\(item.id ?? 0)"
            selectedUser.name = item.name
            selectedUser.username = item.username
            selectedUser.city = item.address?.city
            selectedUser.company = item.company?.name
            selectedUser.email = item.email
            selectedUser.phone = item.phone
            selectedUser.street = item.address?.street
            selectedUser.suite = item.address?.suite
            selectedUser.website = item.website
            selectedUser.zipcode = item.address?.zipcode
            updateCoreData()
        }
        coreDataFetchRequest()
    }
    
    // MARK: Webservice handler
    private func getUserListApi() {
        NetworkManager.shared.getUsersService { (result) in
            DispatchQueue.main.async {
                self.handleApiResponse(result)
            }
        }
    }
    
    private func handleApiResponse(_ result: Result<[NSDictionary], Error>) {
        switch result {
        case .success(let model):
            saveCoreData(Users.getModelArray(model))
            tableView.reloadData()
        case .failure(let error):
            showInformationAlert(message: error.localizedDescription)
        }
    }
}

// MARK: TableView DataSourse, Delegates
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell") as! HomeTableViewCell
        
        cell.configureCell(usersArray[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = storyboard?.instantiateViewController(identifier: "UserDetailViewController") as! UserDetailViewController
        controller.user = usersArray[indexPath.row]
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
}
