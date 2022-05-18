//
//  UIView + Extension.swift
//  IDStore
//
//  Created by Александр Старков on 19.05.2022.
//
import UIKit
extension UIView {
    convenience init(setColor color: UIColor?, setRadius cornerRadius: CGFloat, setAlpha alpha: CGFloat) { // convenience  init - обозначает вспомогательный инициализатор
       self.init()
        self.backgroundColor = color
        self.layer.cornerRadius = cornerRadius
        self.alpha = alpha
        self.addShadowOnView(setColor: .black, setOpacity: 0.3, setRadius: 0.3)
       self.translatesAutoresizingMaskIntoConstraints = false
   }
}
