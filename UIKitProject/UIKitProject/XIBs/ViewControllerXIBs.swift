//
//  ViewControllerXIBs.swift
//  UIKitProject
//
//  Created by YeltsinMacPro13 on 23/01/23.
//

import UIKit

class ViewControllerXIBs: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
//Conexión de un Xib a otro Xib
    @IBAction func navigationToViewControllerXIBsA(_ sender: Any) {
        let viewControllerXIBsA = ViewControllerXIBsA(nibName: "ViewControllerXIBsA", bundle: nil)
        self.present(viewControllerXIBsA, animated: true)
    }

}
