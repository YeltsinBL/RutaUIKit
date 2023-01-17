//
//  TableViewDataSource.swift
//  UIKitProject
//
//  Created by YeltsinMacPro13 on 16/01/23.
//

import Foundation
import UIKit

//Creación de Array para que sea una celda de la TableView
let house = [
    Device(tittle: "Laptop", imageName: "laptopcomputer"),
    Device(tittle: "Mac Mini", imageName: "macmini"),
    Device(tittle: "Mac Pro", imageName: "macpro.gen3"),
    Device(tittle: "Pantallas", imageName: "display.2"),
    Device(tittle: "Apple Tv", imageName: "appletv")
]
let work = [
    Device(tittle: "iPhone", imageName: "iphone"),
    Device(tittle: "iPad", imageName: "ipad"),
    Device(tittle: "Airpods", imageName: "airpods"),
    Device(tittle: "AppleWatch", imageName: "applewatch")
]
let allMyDevices = [house, work]

final class TableViewDataSource: NSObject, UITableViewDataSource{
    
//    Hacemos que la clase espere un array de modelos
    private let dataSource: [[Device]]
    
    init(dataSource: [[Device]]){
        self.dataSource = dataSource
    }
    
//    Métodos necesarios que pide Xcode para utilizar el dataSource
//    Obtenemos el número de secciones que tiene el array
    func numberOfSections(in tableView: UITableView) -> Int {
        dataSource.count
    }
//    Damos un valor del número de elementos que vamos a mostrar en el TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        dataSource.count
//        Cambio: para saber el número de elementos que hay por sección
        dataSource[section].count
    }
//    Preguntamos al TableView que elemento mostrar por cada constante del array house
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
//        utilizamos el identificador de la celda para que se pueda mostrar en la vista
//        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
            
//        Agregamos el nuevo identificador de la celda custom y la casteamos para que lo tomo como referencia
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell

//        obtenemos el indice del array mediante el indexPath.row
//        let model = dataSource[indexPath.row]
//        cambio: especificamos en que sección estamos para obtener los datos correctos
        let model = dataSource[indexPath.section][indexPath.row]
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
    
//    Agregamos una cabecera a las secciones de la Tabla
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        Especificamos el título por sección
        if section == 0 {
            return "Equipos en Casa"
        }else {
            return "Equipos en el Trabajo"
        }
    }
    
}
