//
//  FriendsViewController.swift
//  SocialApp
//
//  Created by Evgeny Konenko on 24.07.2021.
//

import UIKit

class FriendsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let reuseIdentifierUniversalTableCell = "reuseIdentifierUniversalTableCell"
    
    let segueToPhotoController = "fromFriendsToPhoto"
    
    var friendsArray = [User]()
    
    func configure(userArray: [User]){
        self.friendsArray = userArray
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()

        self.tableView.register(UINib(nibName: "UniversalTableCell", bundle: nil), forCellReuseIdentifier: reuseIdentifierUniversalTableCell)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    

}

extension FriendsViewController: UITableViewDelegate, UITableViewDataSource {
    
    //методы датасурса
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierUniversalTableCell, for: indexPath) as? UniversalTableCell else {return UITableViewCell()}
        
       // cell.configure(title: friendsArray[indexPath.row].name, image: friendsArray[indexPath.row].avatar)
        cell.configure(user: friendsArray[indexPath.row])
        
        return cell
    }
    
    
    //методы делегата
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 60
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueToPhotoController,
            let dst = segue.destination as? PhotoController,
            let user = sender as? User {
            dst.photoArray = user.photoArray
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        guard let cell = tableView.cellForRow(at: indexPath) as? UniversalTableCell,
              let cellObject = cell.saveObject as? User
        else {return}
    performSegue(withIdentifier: segueToPhotoController, sender: cellObject)
    }

}

