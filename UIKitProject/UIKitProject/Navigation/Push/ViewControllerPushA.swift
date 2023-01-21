//
//  ViewControllerPushA.swift
//  UIKitProject
//
//  Created by YeltsinMacPro13 on 20/01/23.
//

import Foundation

import UIKit

class ViewControllerPushA: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "ViewControllerPushA"
//        self.navigationItem.rig
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .done, target: self, action: #selector(nextViewController))
    }
    
//    creamos el metodo de Next
    @objc
    private func nextViewController(){
//        utilizamos el push para cambiar de controller y lo instanciamos
        self.navigationController?.pushViewController(ViewControllerPushB(), animated: true)
    }
    
}
