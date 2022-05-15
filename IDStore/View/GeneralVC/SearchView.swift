//
//  SearchView.swift
//  IDStore
//
//  Created by Александр Старков on 15.05.2022.
//

import UIKit

class SearchView: UIView {

   
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
       setConstrains()
//        setDelegates()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupViews() {
        backgroundColor = .specialGray //установили цвет
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    

}//Закрывает класс
extension SearchView {
    
    private func setConstrains() {
        
        NSLayoutConstraint.activate([
           
        ])
    }
}
