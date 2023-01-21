//
//  CollectionViewModern.swift
//  UIKitProject
//
//  Created by YeltsinMacPro13 on 20/01/23.
//

import Foundation
import UIKit

//se necesita crear una estructura con un ID y debe ser Hashable sino no se podra utilizar el UICollectionViewDiffableDataSource
struct Devic: Hashable {
    let id: UUID = UUID()
    let tittle: String
    let imageName: String
}
let hom = [
    Devic(tittle: "Laptop", imageName: "laptopcomputer"),
    Devic(tittle: "Mac Mini", imageName: "macmini"),
    Devic(tittle: "Mac Pro", imageName: "macpro.gen3"),
    Devic(tittle: "Pantallas", imageName: "display.2"),
    Devic(tittle: "Apple Tv", imageName: "appletv")
]
let offi = [
    Devic(tittle: "Laptop", imageName: "laptopcomputer"),
    Devic(tittle: "Mac Mini", imageName: "macmini"),
    Devic(tittle: "Mac Pro", imageName: "macpro.gen3")
]

class CollectionViewModern : UIView{
    
    lazy var cvCollection: UICollectionView = {
//        instanciamos la configuracion
        let configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
//        instanciamos el layout
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
//        instanciamos el CollectionView
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
        
    }()
    private let lblLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "CollectionView Moderno"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 32)
        return label
    }()
    
//    conectar los datos con la vista
    lazy var dataSource: UICollectionViewDiffableDataSource<Int, Devic> = {
//        definimos el aspecto visual de la celda
        let deviceCell = UICollectionView.CellRegistration<UICollectionViewListCell, Devic>{ cell, indexPath, model in
            var listContentConfiguration = UIListContentConfiguration.cell()
            listContentConfiguration.text = model.tittle
            listContentConfiguration.image = UIImage(systemName: model.imageName)
            cell.contentConfiguration = listContentConfiguration
        }
//        hacemos que se utilice la nueva celda creada
        let dataSoure = UICollectionViewDiffableDataSource<Int,Devic>(collectionView: cvCollection) {collectionView,indexPath,model in
            return collectionView.dequeueConfiguredReusableCell(using: deviceCell, for: indexPath, item: model)
        }
        return dataSoure
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
        [lblLabel,cvCollection].forEach(addSubview)
    }
    private func configureConstrains(){
        NSLayoutConstraint.activate([
            
            lblLabel.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            lblLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            lblLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            cvCollection.topAnchor.constraint(equalTo: lblLabel.bottomAnchor, constant: 30),
            cvCollection.leadingAnchor.constraint(equalTo: leadingAnchor),
            cvCollection.trailingAnchor.constraint(equalTo: trailingAnchor),
            cvCollection.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),
        ])
        
//        conectamos los datos del array con el collectionview
        var snapshot = dataSource.snapshot()
        snapshot.appendSections([0, 1])
        snapshot.appendItems(hom, toSection: 0)
        snapshot.appendItems(offi, toSection: 1)
        dataSource.apply(snapshot)
        
//        simulacion en tiempo de ejecucion en 2 segundos
        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
            snapshot.appendItems([.init(tittle: "New Divice", imageName: "appletv")], toSection: 0)
            snapshot.appendItems([.init(tittle: "New Divice 2", imageName: "appletv")], toSection: 0)
            self.dataSource.apply(snapshot)
        }
    }
}
