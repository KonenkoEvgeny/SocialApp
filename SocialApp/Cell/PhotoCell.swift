//
//  PhotoCell.swift
//  SocialApp
//
//  Created by Evgeny Konenko on 25.07.2021.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var photoImageView: UIImageView!

    func setup(){}
    
    func clearCell(){
        photoImageView.image = nil
    }
    
    override func prepareForReuse() {
        clearCell()
    }
    
    func configure(image: UIImage){
        photoImageView.image = image
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
        clearCell()
    }

}
