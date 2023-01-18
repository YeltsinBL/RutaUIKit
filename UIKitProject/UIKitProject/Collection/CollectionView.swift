//
//  CollectionView.swift
//  UIKitProject
//
//  Created by YeltsinMacPro13 on 18/01/23.
//

import Foundation
import UIKit

struct Devices {
    let tittle: String
    let imageName: String
}
let houses = [
    Devices(tittle: "Laptop", imageName: "laptopcomputer"),
    Devices(tittle: "Mac Mini", imageName: "macmini"),
    Devices(tittle: "Mac Pro", imageName: "macpro.gen3"),
    Devices(tittle: "Pantallas", imageName: "display.2"),
    Devices(tittle: "Apple Tv", imageName: "appletv"),
    Devices(tittle: "Laptop", imageName: "laptopcomputer"),
    Devices(tittle: "Mac Mini", imageName: "macmini"),
    Devices(tittle: "Mac Pro", imageName: "macpro.gen3"),
    Devices(tittle: "Pantallas", imageName: "display.2"),
    Devices(tittle: "Apple Tv", imageName: "appletv"),
    Devices(tittle: "Laptop", imageName: "laptopcomputer"),
    Devices(tittle: "Mac Mini", imageName: "macmini"),
    Devices(tittle: "Mac Pro", imageName: "macpro.gen3"),
    Devices(tittle: "Pantallas", imageName: "display.2"),
    Devices(tittle: "Apple Tv", imageName: "appletv"),
    Devices(tittle: "Laptop", imageName: "laptopcomputer"),
    Devices(tittle: "Mac Mini", imageName: "macmini"),
    Devices(tittle: "Mac Pro", imageName: "macpro.gen3"),
    Devices(tittle: "Pantallas", imageName: "display.2"),
    Devices(tittle: "Apple Tv", imageName: "appletv")
]
class CollectionView: UIView, UICollectionViewDataSource {

    
//    se debe especificar que layout se va a utilizar
    private let cvCollectionView : UICollectionView = {
//        creamos una constante que guarde la instancia de UICollectionViewLayout para que muestre las celdas
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal //cambiamos la orientacion del scroll, por defecto es vertical
        layout.itemSize = .init(width: 200, height: 60)
//        layout.minimumLineSpacing = 20 //dar espacio entre las columnas
//        layout.minimumInteritemSpacing = 20 //dar espacio entres los items de una columna
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    private let lblLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "CollectionView"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 32)
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup(){
        addSubviews()
        configureConstrains()
    }
    private func addSubviews() {
        cvCollectionView.layer.borderColor = UIColor.black.cgColor
        cvCollectionView.layer.borderWidth = 2
//        conectamos los datos con el CollectionView
        cvCollectionView.dataSource = self
//        registramos la celda con su identificador
        cvCollectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "CustomCollectionViewCell")
        [lblLabel, cvCollectionView].forEach(addSubview)
    }
    private func configureConstrains(){
        NSLayoutConstraint.activate([
            
            lblLabel.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            lblLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            lblLabel.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            
            cvCollectionView.topAnchor.constraint(equalTo: lblLabel.bottomAnchor, constant: 30),
            cvCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            cvCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            cvCollectionView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),
        ])
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        houses.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionViewCell", for: indexPath) as! CustomCollectionViewCell
//        para llenar las celdas con informacion utilizamos el indexPath
        let model = houses[indexPath.row]
        cell.configure(model: model)
        
        return cell
    }
}
