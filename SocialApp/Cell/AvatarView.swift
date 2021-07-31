//
//  AvatarView.swift
//  SocialApp
//
//  Created by Evgeny Konenko on 31.07.2021.
//

import UIKit

@IBDesignable
class AvatarView: UIImageView {
    
    @IBInspectable var cornerRadius: CGFloat = 25 {
        didSet {updateCornerRadius()}
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    private func setup(){
        layer.cornerRadius = 25 // делаем аватарку круглой
        contentMode = .scaleAspectFill
    }
    
    private func updateCornerRadius(){
        layer.cornerRadius = cornerRadius
    }
}
