//
//  MainTabBarController.swift
//  SocialApp
//
//  Created by Evgeny Konenko on 25.07.2021.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    
    func setupUser() -> [User]{
        var resultArray = [User]()
        
        let firstPhotoArray = [UIImage(named: "1_1")!,UIImage(named: "1_2")!, UIImage(named: "1_3")!]
        let firstUser = User(name: "Китай", avatar: UIImage(named: "jinping_avatar")!, photoArray: firstPhotoArray)
        resultArray.append(firstUser)
        
        let secondPhotoArray = [UIImage(named: "2_1")!,UIImage(named: "2_2")!, UIImage(named: "2_3")!]
        let secondUser = User(name: "Франция", avatar: UIImage(named: "macron_avatar")!, photoArray: secondPhotoArray)
        resultArray.append(secondUser)
        
        return resultArray
    }
    

    

    override func viewDidLoad() {
        super.viewDidLoad()
        
      if let friendsNavigationController = self.viewControllers?.first as? UINavigationController,
            let friendViewController = friendsNavigationController.viewControllers.first as? FriendsViewController {
        friendViewController.configure(userArray: setupUser())
      }

        
        
//        if let groupNavigationController = self.viewControllers?.[1] as? UINavigationController,
//              let groupViewController = groupNavigationController.viewControllers.first as? GroupViewController {
//                groupViewController.configure(userArray: setupUser())
//        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
