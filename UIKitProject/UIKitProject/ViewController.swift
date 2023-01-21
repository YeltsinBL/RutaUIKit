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
    
    /**Para mostrar una vista de tipo Sheet**/
    private lazy var btnShowSheet: UIButton = {
        var configuration = UIButton.Configuration.bordered()
        configuration.title = "Mostrar Sheet"
        
        let button = UIButton(type: .system, primaryAction: UIAction(handler: { _ in
            //self.startNavigation() //para mostrar vistas Modales
            self.presentSheetController()//para mostrar una Sheet Presentation
        }))
        button.configuration = configuration
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    func startNavigation(){
        present(ViewControllerA(), animated: true)
    }
    func presentSheetController(){
        let viewControllerToPresent = SheetViewController()

        present(viewControllerToPresent, animated: true)
        
    }
    /**Para mostrar una vista de tipo Sheet**/
    
//    creamos las variables de las nuevas clases
//    private var dataSource : TableViewDataSource?
//    private var delegate : TableViewDelegate?
    
//    Cargamos la vista
    override func loadView() {
        super.loadView()
//        self.view = OnBoardingView()
//        self.view = ButtonView()
//        self.view = LabelView()
//        self.view = ImageView()
//        self.view = TableView()
/*        Otra forma de llamar a la a la tabla hacia la Vista*/
//        let tableView = UITableView()
////        asignamos las instancias a las propiedasdes
////        self.dataSource = TableViewDataSource(dataSource: house)
//        Cambio: pasamos el array de arrays para obtener los títulos
//        self.dataSource = TableViewDataSource(dataSource: allMyDevices)
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
        
//        self.view = StackView()
//        self.view = CollectionView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Para acceder a la vista
        view.backgroundColor = .white
        
        [btnShowSheet].forEach(view.addSubview)
        NSLayoutConstraint.activate([
            btnShowSheet.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            btnShowSheet.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

}

