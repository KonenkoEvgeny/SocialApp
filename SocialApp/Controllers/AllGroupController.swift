//
//  AllGroupController.swift
//  SocialApp
//
//  Created by Evgeny Konenko on 25.07.2021.
//

import UIKit

class AllGroupController: UITableViewController {
        
    var allGroup = [Group]()
    let reuseIdentifierUniversalTableCell = "reuseIdentifierUniversalTableCell"

    func setupGroup() -> [Group]{
        var resultArray = [Group]()
        
        // задаем первую группу
        let firstGroup = Group(title: "Германия", avatar: UIImage(named: "Merkel_avatar")!, description: "страна Германия")
        resultArray.append(firstGroup)

        // задаем вторую группу
        let secondGroup = Group(title: "Индия", avatar: UIImage(named: "Narendra_avatar")!, description: "страна Индия")
        resultArray.append(secondGroup)
        
        return resultArray
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allGroup = setupGroup()
        self.tableView.register(UINib(nibName: "UniversalTableCell", bundle: nil), forCellReuseIdentifier: reuseIdentifierUniversalTableCell)
    }

    // MARK: - Table view data source

    // задаем количество секций
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    //задаем количество ячеек = количеству групп
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return allGroup.count
    }

    
    // задаем использование универсальной ячейки
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifierUniversalTableCell", for: indexPath) as? UniversalTableCell else {return UITableViewCell()}

        // Configure the cell...
        cell.configure(group: allGroup[indexPath.row])

        return cell
    }
    
    // задаем высоту ячейки
   override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 60
    }
    
    
    // проверяем нотификатор
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? UniversalTableCell,
              let cellObject = cell.saveObject as? Group
        else {return}
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "sendGroup"), object: cellObject)
        self.navigationController?.popViewController(animated: true)
    }
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

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
