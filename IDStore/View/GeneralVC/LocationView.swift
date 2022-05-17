//
//  SearchView.swift
//  IDStore
//
//  Created by Александр Старков on 15.05.2022.
//

import UIKit
import MapKit
import CoreLocation

class LocationView: UIView {

    let mapView:MKMapView = {
       let mapView = MKMapView()
        
        mapView.layer.cornerRadius = 10
        mapView.translatesAutoresizingMaskIntoConstraints = false
       return mapView
    } ()
   
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
        backgroundColor = .clear //установили цвет
        layer.cornerRadius = 10
        addShadowOnView(setColor: .black, setOpacity: 0.7, setRadius: 2.0)
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(mapView)
    }
    
    

}//Закрывает класс
extension LocationView {
    
    private func setConstrains() {
        
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            mapView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            mapView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            mapView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
    }
}
