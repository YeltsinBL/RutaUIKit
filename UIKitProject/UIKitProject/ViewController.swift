//
//  ViewController.swift
//  UIKitProject
//
//  Created by YeltsinMacPro13 on 13/01/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var actionButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        nameLabel.textColor = .blue
        actionButton.setTitle("😌✌🏻", for: .normal)
    }
    
    @IBAction func didTapOnBtnAceptar(_ sender: Any) {
        print("Haz presionado el boton Aceptar")
    }
    
    

    override func viewWillAppear(_ animated: Bool) {
//        <#code#>
    }

    override func viewWillLayoutSubviews() {
//        <#code#>
    }
    
    override func viewWillDisappear(_ animated: Bool) {
//        <#code#>
    }
}

