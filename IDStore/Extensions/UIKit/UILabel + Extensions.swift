//
//  UILabel + Extensions.swift
//  IDStore
//
//  Created by Александр Старков on 13.05.2022.
//

import UIKit
extension UILabel {
   convenience init(text: String = "") { // convenience  init - обозначает вспомогательный инициализатор
       self.init()
       self.text = text
       self.font = .avenirMedium14()
       self.textColor = .specialBlack
       self.translatesAutoresizingMaskIntoConstraints = false
   }
}
