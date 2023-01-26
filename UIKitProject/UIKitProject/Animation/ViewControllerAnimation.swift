//
//  ViewControllerAnimation.swift
//  UIKitProject
//
//  Created by YeltsinMacPro13 on 26/01/23.
//

import Foundation
import UIKit

class ViewControllerAnimation:UIViewController{
    
    let vView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .green
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(vView)
        vView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        vView.center = self.view.center //centramos la vista 'vView' con la vista del controller
//        vView.alpha = 0.0 //hacemos que la vista no se vea al inicio
        
//        Agregamos animación a la vView
        /*
        UIView.animate(withDuration: 2) {
//            Animamos las propiedades de la vista
            self.vView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)  //reducimos el tamaño de la view
            self.vView.center = self.view.center // la animación se hace en el centro del controller
            self.vView.alpha = 1.0 //hacemos que la vista aparezca
            self.vView.layer.cornerRadius = 50
        }
        */
        
        // Delay: tiempo que debe pasar para que empiece la animación.
        // UsingSpringWithDamping: amortiguamiento para la animación (rebote), mientras mas cercano al cero hará que oscile mas rápido.
        // InitialSpringVelocity: velocidad inicial de la animación.
        // Options: mascaras de opciones, si queremos que la animación sea mas rápida al inicio o final, etc.
        // Completion: se ejecuta cuando la animación ha finalizado
        UIView.animate(withDuration: 2, delay: 2, usingSpringWithDamping: 0.1, initialSpringVelocity: 1, options: .curveEaseInOut) {
            self.vView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
            self.vView.center = self.view.center
            self.vView.layer.cornerRadius = 50
        } completion: { isFinished in
            print("Ha finalizado la animación? \(isFinished)")
        }
    }
}
