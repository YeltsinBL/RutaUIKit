//
//  TableView.swift
//  UIKitProject
//
//  Created by YeltsinMacPro13 on 16/01/23.
//

import Foundation
import UIKit

//Creacion de un modelo visual para la tableview
struct Device {
    let tittle: String
    let imageName: String
}
//Creacion de Array para que sea una celda de la TableView
let house = [
    Device(tittle: "Laptop", imageName: "laptopcomputer"),
    Device(tittle: "Mac Mini", imageName: "maacmini"),
    Device(tittle: "Mac Pro", imageName: "macpro.gen3"),
    Device(tittle: "Pantallas", imageName: "display.2"),
    Device(tittle: "Apple Tv", imageName: "appletv")
]



class TableView: UIView, UITableViewDataSource {
    
    private let tblTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
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
//        agregar la vista creada por código a la vista padre
        tblTableView.backgroundColor = .blue
//        conectamos los datos con la vista mediante el dataSource
        tblTableView.dataSource = self
//        Registramos una celda
        tblTableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        [tblTableView].forEach(addSubview)
    }
    
    private func configureConstrains(){
        NSLayoutConstraint.activate([
            
            tblTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tblTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tblTableView.topAnchor.constraint(equalTo: topAnchor),
            tblTableView.bottomAnchor.constraint(equalTo: bottomAnchor)
            
        ])
    }
//    Metodos necesarios que pide Xcode para utilizar el dataSource
//    Damos un valor del numero de elementos que vamos a mostrar en el TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        house.count
    }
//    Preguntamos al TableView que elemento mostrar por cada constante del array house
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        return cell
    }
}
