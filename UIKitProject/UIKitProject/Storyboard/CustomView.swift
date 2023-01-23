//
//  CustomView.swift
//  UIKitProject
//
//  Created by YeltsinMacPro13 on 23/01/23.
//

import UIKit

@IBDesignable //IB= interface builder
class CustomView: UIView {
    
    @IBInspectable //mostrar estas propiedades en el inspector de atributos
    var bgBackgroundColor : UIColor = .red {
        didSet {
            backgroundColor = bgBackgroundColor
        }
    }
    
    @IBInspectable //mostrar estas propiedades en el inspector de atributos
    var bwBorderWidth: CGFloat = 1.0 {
        didSet {
            layer.borderWidth = bwBorderWidth
        }
    }
    
    override func prepareForInterfaceBuilder() {
        backgroundColor = bgBackgroundColor
        layer.borderWidth = bwBorderWidth
    }
}
