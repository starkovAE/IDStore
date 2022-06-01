//
//  ProfileManagerModel.swift
//  IDStore
//
//  Created by Александр Старков on 01.06.2022.
//

import Foundation
import RealmSwift

class ProfileManagerModel: Object {
    @Persisted var userFirstName: String = "Unknow"
    @Persisted var userSecondName: String = "Unknow"
    @Persisted var jobTitle: String = "Unknow"
    @Persisted var numberPhone: String = "Unknow"
    @Persisted var email: String = "Unknow"
    
}
