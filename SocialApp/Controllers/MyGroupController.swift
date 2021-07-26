//
//  MyGroupController.swift
//  SocialApp
//
//  Created by Evgeny Konenko on 25.07.2021.
//

import UIKit

class MyGroupController: UITableViewController {

    var myGroup = [Group]()
    let reuseIdentifierUniversalTableCell = "reuseIdentifierUniversalTableCell"
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib(nibName: "UniversalTableCell", bundle: nil), forCellReuseIdentifier: reuseIdentifierUniversalTableCell)
        NotificationCenter.default.addObserver(self, selector: #selector(addNewGroup(_:)), name: NSNotification.Name(rawValue: "sendGroup"), object: nil)
    }
    
    func isContainInArraay(group: Group) -> Bool {
        if myGroup.contains(where: { itemGroup in itemGroup.title == group.title}){
            return true
        }
        return false
    }
    
    
    
    // добавляем группу из нотификатора
    @objc func addNewGroup(_ Notification: Notification){
        guard let newGroup = Notification.object as? Group else {return}
        
        if isContainInArraay(group: newGroup){return}
        myGroup.append(newGroup)
        self.tableView.reloadData()

    }
    
    // удаляем ячейку
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        myGroup.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .middle)
    }
    
    
    // количество секций
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    
    // количество ячеек = количеству групп в массиве групп
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return myGroup.count
    }

    
    // используем нашу универсальную ячейку
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifierUniversalTableCell", for: indexPath) as? UniversalTableCell else {return UITableViewCell()}

        // Configure the cell...
        cell.configure(group: myGroup[indexPath.row])

        return cell
    }
    
    // задаем высоту ячейки
   override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 60
    }

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
