//
//  TableViewDelegate.swift
//  UIKitProject
//
//  Created by YeltsinMacPro13 on 16/01/23.
//

import Foundation
import UIKit

//Agregamos 'UITableViewDelegate' para realizar acciones y modificar las propiedades en la tabla
final class TableViewDelegate: NSObject, UITableViewDelegate{
    
    //    Método al hacer clic en una celda
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let model = house[indexPath.row]
            print("Celda: \(model.tittle)")
        }
        
}
