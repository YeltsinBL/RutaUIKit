//
//  ViewController.swift
//  UIKitProject
//
//  Created by YeltsinMacPro13 on 13/01/23.
//

import UIKit

class ViewController: UIViewController {
    
//    Cargamos la vista
    override func loadView() {
//        self.view = OnBoardingView()
//        self.view = ButtonView()
        self.view = LabelView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Para acceder a la vista
        view.backgroundColor = .white

    }

}

