//
//  RealmManager.swift
//  IDStore
//
//  Created by Александр Старков on 01.06.2022.
//

import Foundation
import RealmSwift

class RealmManager {
    static let shared = RealmManager() //у экземпляров мы не сможем менять значения этого свойства
    private init() {}
    let localRealm  = try! Realm()
    //MARK: - UserProfileModel
    func saveUserModel(model: ProfileUserModel) {//метод для для сохранения модели
        try! localRealm.write {
            localRealm.add(model)
        }
    }
    
    func updateProfileUserModel(model: ProfileUserModel) {
        let user = localRealm.objects(ProfileUserModel.self)
        
        try! localRealm.write {
            user[0].userFirstName = model.userFirstName
            user[0].userSecondName = model.userSecondName
            user[0].modelPhone = model.modelPhone
            user[0].numberPhone = model.numberPhone
            user[0].email = model.email
            
        }
    }
    
    func deleteProfileUserModel(model: ProfileUserModel) {//метод для удаления модели
        try! localRealm.write {
            localRealm.delete(model)
        }
    }
    //MARK: - ManagerModel
    func saveUserModel(model: ProfileManagerModel) {//метод для для сохранения модели
        try! localRealm.write {
            localRealm.add(model)
        }
    }
    
    func updateProfileManagerModel(model: ProfileManagerModel) {
        let manager = localRealm.objects(ProfileManagerModel.self)
        
        try! localRealm.write {
            manager[0].userFirstName = model.userFirstName
            manager[0].userSecondName = model.userSecondName
            manager[0].jobTitle = model.jobTitle
            manager[0].numberPhone = model.numberPhone
            manager[0].email = model.email
            
        }
    }
    
    func deleteProfileManagerModel(model: ProfileManagerModel) {//метод для удаления модели
        try! localRealm.write {
            localRealm.delete(model)
        }
    }
    
    
    //MARK: - ProductModel
    func saveProductModel(model: ProductModel) {//метод для для сохранения модели
        try! localRealm.write {
            localRealm.add(model)
        }
    }
    func updateProductModel(model: ProductModel,
                            title: String,
                            vendorCodeProduct: String,
                            colorProduct: String,
                            priceProduct: String,
                            descriptionProduct: String,
                            categoryProduct: String,
                            amountProduct: Int,
                            productImage: Data?,
                            availability: Bool,
                            isFavorite: Bool) {
        try! localRealm.write {
            model.titleProduct = title
            model.vendorCodeProduct = vendorCodeProduct
           // model.colorProduct = colorProduct
            model.priceProduct = priceProduct
            model.descriptionProduct = descriptionProduct
            model.categoryProduct = categoryProduct
            model.amountProduct = amountProduct
            model.productImage = productImage
            model.availability = availability
            model.isFavorite = isFavorite
        }
    }
    func deleteProductModel(model: ProductModel) {//метод для удаления модели
        try! localRealm.write {
            localRealm.delete(model)
        }
    }
}
