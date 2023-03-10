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


class TableView: UIView {
    
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
    
//    creamos las variables de las nuevas clases
    private var dataSource : TableViewDataSource?
    private var delegate : TableViewDelegate?
    
    private func setup(){
        addSubviews()
        configureConstrains()
    }
    
    private func addSubviews() {
        
//        asignamos las instancias a las propiedades
//        self.dataSource = TableViewDataSource(dataSource: house)
//        Cambio: pasamos el array de arrays para obtener los títulos
        self.dataSource = TableViewDataSource(dataSource: allMyDevices)
        self.delegate = TableViewDelegate()
        
//        tblTableView.backgroundColor = .blue
//        conectamos los datos con la vista mediante el dataSource
        tblTableView.dataSource = dataSource
//        agregamos el Delegate a la tabla
        tblTableView.delegate = delegate
//        Registramos una celda
//        tblTableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
//        Registramos la celda custom
        tblTableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "CustomTableViewCell")
//        agregar la vista creada por código a la vista padre
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


}
