//
//  UIButton + Extension.swift
//  IDStore
//
//  Created by Александр Старков on 19.05.2022.
//

import UIKit
extension UIButton {
    convenience init(setImageName imageName: String, setSelector selector: Selector, setTarget target: Any) { // convenience  init - обозначает вспомогательный инициализатор
       self.init()
        self.setImage(UIImage(named: imageName)?.withRenderingMode(.alwaysOriginal), for: .normal)
        self.tintColor = .black // подцвечивать цветом наш текст и Image
        self.addTarget(target, action: selector, for: .touchUpInside)
        self.translatesAutoresizingMaskIntoConstraints = false
      
   }
}
