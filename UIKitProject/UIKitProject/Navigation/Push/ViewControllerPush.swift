//
//  ViewControllerPush.swift
//  UIKitProject
//
//  Created by YeltsinMacPro13 on 20/01/23.
//

import Foundation
import UIKit

class ViewControllerPush: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .green
        title = "ViewControllerPush"
//        para mostrar el boton siguiente al lado derecho, para el izquierdo utilizamos left
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .done, target: self, action: #selector(nextViewController))
    }
    
//    creamos el metodo de Next
    @objc
    private func nextViewController(){
//        utilizamos el push para cambiar de controller y lo instanciamos
        self.navigationController?.pushViewController(ViewControllerPushA(), animated: true)
    }
    
}
