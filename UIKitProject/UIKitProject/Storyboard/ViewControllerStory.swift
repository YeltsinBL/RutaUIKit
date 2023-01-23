//
//  ViewControllerStory.swift
//  UIKitProject
//
//  Created by YeltsinMacPro13 on 23/01/23.
//

import Foundation
import UIKit

class ViewControllerStory:UIViewController{
    
    @IBOutlet weak var btnButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didTapButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "MainB", bundle: nil)
        let viewControllerStoryboard2 = storyboard.instantiateViewController(withIdentifier: "ViewControllerStory2_id")
        self.present(viewControllerStoryboard2, animated: true)
    }
}
