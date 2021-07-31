//
//  UniversalTableCell.swift
//  SocialApp
//
//  Created by Evgeny Konenko on 24.07.2021.
//

import UIKit

class UniversalTableCell: UITableViewCell {

   // @IBOutlet weak var avatarImageView: UIImageView!
   // @IBOutlet weak var backView: UIView!
@IBOutlet weak var titleLabel: UILabel!
@IBOutlet weak var avatarImageView: AvatarView!
    
    var saveObject: Any?
    
    func setup() {
        
        // перенес в классы аватара и тени
//        avatarImageView.layer.cornerRadius = 25 // делаем аватарку круглой
//        avatarImageView.contentMode = .scaleAspectFill // обрезаем картинку под круг
        
//        backView.layer.cornerRadius = 25 // работаем с тенью
//        backView.layer.shadowColor = UIColor.black.cgColor
//        backView.layer.shadowRadius = 5
//        backView.layer.shadowOffset = CGSize(width: 5, height: 5)
//        backView.layer.shadowOpacity = 0.5
//
    }
    
    func clearCell(){
        self.avatarImageView.image = nil
        self.titleLabel.text = nil
        saveObject = nil
    }
    
    override func prepareForReuse() {
        clearCell()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
        clearCell()
        // Initialization code
    }

    func configure(title: String?, image: UIImage?){
        titleLabel.text = title
        avatarImageView.image = image
    }
    
    func configure(user: User){
        saveObject = user
        titleLabel.text = user.name
        avatarImageView.image = user.avatar
    }

    func configure(group: Group){
        saveObject = group
        titleLabel.text = group.title
        avatarImageView.image = group.avatar
    }
}
