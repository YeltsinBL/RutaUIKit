//
//  ViewController.swift
//  UIKitProject
//
//  Created by YeltsinMacPro13 on 13/01/23.
//

import UIKit

//Creación de un modelo visual para la tableview
//struct Device {
//    let tittle: String
//    let imageName: String
//}

class ViewController: UIViewController {
    
    
//    creamos las variables de las nuevas clases
//    private var dataSource : TableViewDataSource?
//    private var delegate : TableViewDelegate?
    
//    Cargamos la vista
    override func loadView() {
//        self.view = OnBoardingView()
//        self.view = ButtonView()
//        self.view = LabelView()
//        self.view = ImageView()
        self.view = TableView()
/*        Otra forma de llamar a la a la tabla hacia la Vista*/
//        let tableView = UITableView()
////        asignamos las instancias a las propiedasdes
//        self.dataSource = TableViewDataSource(dataSource: house)
//        self.delegate = TableViewDelegate()
////        conectamos los datos con la vista mediante el dataSource
//        tableView.dataSource = dataSource
////        agregamos el Delegate a la tabla
//        tableView.delegate = delegate
////        Registramos la celda custom
//        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "CustomTableViewCell")
////        agregamos la tabla a la vista
//        view = tableView
/*        Otra forma de llamar a la a la tabla hacia la Vista*/
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Para acceder a la vista
        view.backgroundColor = .white

    }

}

