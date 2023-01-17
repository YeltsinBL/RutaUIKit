//
//  TableView.swift
//  UIKitProject
//
//  Created by YeltsinMacPro13 on 16/01/23.
//

import Foundation
import UIKit

//Creación de un modelo visual para la tableview
struct Device {
    let tittle: String
    let imageName: String
}
//Creación de Array para que sea una celda de la TableView
let house = [
    Device(tittle: "Laptop", imageName: "laptopcomputer"),
    Device(tittle: "Mac Mini", imageName: "macmini"),
    Device(tittle: "Mac Pro", imageName: "macpro.gen3"),
    Device(tittle: "Pantallas", imageName: "display.2"),
    Device(tittle: "Apple Tv", imageName: "appletv")
]


//Agregamos 'UITableViewDelegate' para realizar acciones y modificar las propiedades en la tabla
class TableView: UIView, UITableViewDataSource, UITableViewDelegate {
    
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
//        agregamos el Delegate a la tabla
        tblTableView.delegate = self
//        Registramos una celda
//        tblTableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
//        Registramos la celda custom
        tblTableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "CustomTableViewCell")
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
//    Métodos necesarios que pide Xcode para utilizar el dataSource
//    Damos un valor del número de elementos que vamos a mostrar en el TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        house.count
    }
//    Preguntamos al TableView que elemento mostrar por cada constante del array house
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        utilizamos el identificador de la celda para que se pueda mostrar en la vista
//        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        
//        Agregamos el nuevo identificador de la celda custom y la casteamos para que lo tomo como referencia
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell

//        obtenemos el indice del array mediante el indexPath.row
        let model = house[indexPath.row]
//        rellenamos las celdas
//        var listContentConfiguration = UIListContentConfiguration.cell()
//        listContentConfiguration.text = model.tittle
//        listContentConfiguration.image = UIImage(systemName: model.imageName)
//        asignamos la configuración a la celda creada
//        cell.contentConfiguration = listContentConfiguration
        
//        si no se castea la celda custom no aparecera este metodo para llenar los datos
        cell.configure(model: model)
        
        return cell
    }
//    Método al hacer clic en una celda
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = house[indexPath.row]
        print("Celda: \(model.tittle)")
    }
    
}
