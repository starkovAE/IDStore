//
//  ProductModel.swift
//  IDStore
//
//  Created by Александр Старков on 01.06.2022.
//

import Foundation
import RealmSwift
import UIKit

class ProductModel: Object {
    @Persisted var titleProduct: String = "Unknow"
    @Persisted var vendorCodeProduct: String = "Unknow"
//    @Persisted var colorProduct: String = "Unknow"
    @Persisted var priceProduct: String = "Unknow"
    @Persisted var descriptionProduct: String = "Unknow"
    @Persisted var categoryProduct: String = "Unknow"
    @Persisted var amountProduct: Int = 0
    @Persisted var productImage: Data?
    @Persisted var availability: Bool = true
    @Persisted var isFavorite: Bool = false
    
    
    
}
