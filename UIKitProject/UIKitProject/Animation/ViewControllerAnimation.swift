//
//  ViewControllerAnimation.swift
//  UIKitProject
//
//  Created by YeltsinMacPro13 on 26/01/23.
//

import Foundation
import UIKit

class ViewControllerAnimation:UIViewController{
    
//    let vView: UIView = {
//        let view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = .green
//        return view
//    }()

/* Variables hechas desde el Storyboard */
    @IBOutlet weak var sbWidhtConst: NSLayoutConstraint!
    @IBOutlet weak var sbHeightConst: NSLayoutConstraint!
    @IBOutlet weak var sbViewCorner: UIView!
/* Variables hechas desde el Storyboard */
    
//    var heightConstrain, widthConstrain: NSLayoutConstraint? //creamos esta variable para actualizar su constrain en Y
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        view.addSubview(vView)
        
/**Animaciones hecho por código con constrains**/
//        heightConstrain = vView.heightAnchor.constraint(equalToConstant: 200)
//        widthConstrain = vView.widthAnchor.constraint(equalToConstant: 200)
//        NSLayoutConstraint.activate([
//            heightConstrain!,
//            widthConstrain!,
//            vView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            vView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
//        ])
        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
            self.animateConstrain()
        }
/**Animaciones hecho por código con constrains**/
        
/**Animaciones hecho por código sin constrains**/
//        vView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
//        vView.center = self.view.center //centramos la vista 'vView' con la vista del controller
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
//        UIView.animate(withDuration: 2, delay: 2, usingSpringWithDamping: 0.1, initialSpringVelocity: 1, options: .curveEaseInOut) {
//            self.vView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
//            self.vView.center = self.view.center
//            self.vView.layer.cornerRadius = 50
//        } completion: { isFinished in
//            print("Ha finalizado la animación? \(isFinished)")
//        }
/**Animaciones hecho por código sin constrains**/
        
        
        
        
    }

/**Función para la animaciones hecho por código y storyboard con constrains**/
    func animateConstrain(){
        UIView.animate(withDuration: 2, delay: 2, usingSpringWithDamping: 0.1, initialSpringVelocity: 1, options: .curveEaseInOut) {
//            self.heightConstrain?.constant = 300
//            self.widthConstrain?.constant = 300
//            self.vView.layer.cornerRadius = 50
            self.sbWidhtConst?.constant = 300
            self.sbHeightConst?.constant = 300
            self.sbViewCorner.layer.cornerRadius = 50
            self.view.layoutIfNeeded() //formazos a la vista para que se actualice y muestre la animación
        }
    }
/**Función para la animaciones hecho por código y storyboard con constrains**/
    
}
