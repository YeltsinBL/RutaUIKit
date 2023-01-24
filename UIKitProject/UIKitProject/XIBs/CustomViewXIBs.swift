//
//  CustomViewXIBs.swift
//  UIKitProject
//
//  Created by YeltsinMacPro13 on 23/01/23.
//

import UIKit

class CustomViewXIBs: UIView {

//    lo necesitamos porque utilizamos el interface builder, cuando este inicializador se llama necesitamos hacer unas lineas de codigo para tener la vista preparada
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    func setup(){
//      preparamos este nib para ser desarchivado e instanciado en la vista, si se escribe mal el nombre la aplicación crasheara por no encontrarla
        let nib = UINib(nibName: "CustomViewXIBs", bundle: nil)
//        desarchivamos e instanciamos el contenido del nib y lo casteamos a UIView obteniendo un array como resultado quedandonos con el primer elemento
        guard let customView = nib.instantiate(withOwner: self, options: nil).first as? UIView else {
            fatalError("Error al instanciar el CustomViewXIBs")
        }
        addSubview(customView)
    }
    
}
