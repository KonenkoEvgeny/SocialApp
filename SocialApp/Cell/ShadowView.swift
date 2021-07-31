//
//  ShadowView.swift
//  SocialApp
//
//  Created by Evgeny Konenko on 31.07.2021.
//

import UIKit

class ShadowView: UIView {
    
    @IBInspectable var cornerRadius: CGFloat = 25 {
        didSet {updateCornerRadius()}
    }
    @IBInspectable var shadowColor: UIColor = .black {
        didSet {updateShadowColor()}
    }
    @IBInspectable var shadowRadius: CGFloat = 5 {
        didSet {updateShadowRadius()}
    }
    @IBInspectable var shadowOffset = CGSize(width: 5, height: 5) {
        didSet {updateShadowRadius()}
    }
    @IBInspectable var shadowOpacity: Float = 0.5 {
        didSet {updateShadowOpacity()}
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
        layer.cornerRadius = 25 // работаем с тенью
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 5
        layer.shadowOffset = CGSize(width: 5, height: 5)
        layer.shadowOpacity = 0.5
    }
    
    private func updateCornerRadius(){
        layer.cornerRadius = cornerRadius
    }
    private func updateShadowColor(){
        layer.shadowColor = shadowColor.cgColor
    }
    private func updateShadowRadius(){
        layer.shadowRadius = shadowRadius
    }
    private func updateShadowOffset(){
        layer.shadowOffset = shadowOffset
    }
    private func updateShadowOpacity(){
        layer.shadowOpacity = shadowOpacity
    }

}


//extension ShadowView {
//
//   /// Радиус гараницы
//    @IBInspectable var cornerRadius: CGFloat {
//        set { layer.cornerRadius = newValue  }
//        get { return layer.cornerRadius }
//    }
//    /// Толщина границы
//    @IBInspectable var borderWidth: CGFloat {
//        set { layer.borderWidth = newValue }
//        get { return layer.borderWidth }
//    }
//    /// Цвет границы
////    @IBInspectable var borderColor: UIColor? {
////        set { layer.borderColor = newValue?.cgColor  }
////        get { return layer.borderColor?.UIColor }
////    }
//    /// Смещение тени
//    @IBInspectable var shadowOffset: CGSize {
//        set { layer.shadowOffset = newValue  }
//        get { return layer.shadowOffset }
//    }
//    /// Прозрачность тени
//    @IBInspectable var shadowOpacity: Float {
//        set { layer.shadowOpacity = newValue }
//        get { return layer.shadowOpacity }
//    }
//    /// Радиус блура тени
//    @IBInspectable var shadowRadius: CGFloat {
//        set {  layer.shadowRadius = newValue }
//        get { return layer.shadowRadius }
//    }
//    /// Цвет тени
////    @IBInspectable var shadowColor: UIColor? {
////        set { layer.shadowColor = newValue?.cgColor }
////        get { return layer.shadowColor?.UIColor }
////    }
//    /// Отсекание по границе
//    @IBInspectable var _clipsToBounds: Bool {
//        set { clipsToBounds = newValue }
//        get { return clipsToBounds }
//    }

