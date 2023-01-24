//
//  ViewControllerD.swift
//  UIKitProject
//
//  Created by YeltsinMacPro13 on 23/01/23.
//

import Foundation
import UIKit

class ViewControllerD: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didTapOnButton() {
//        nib: utiliza la maquina para entender el código
        let viewControllerXIBs = ViewControllerXIBs(nibName: "ViewControllerXIBs", bundle: nil)
        self.present(viewControllerXIBs, animated: true)
    }
    
}
