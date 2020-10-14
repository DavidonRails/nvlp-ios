//
//  ProgressHud.swift
//  Test
//
//  Created by Admin on 10/15/20.
////This is for Progress loading view
//

import JGProgressHUD
import UIKit

class ProgressHud {
    static let shared = ProgressHud()
    let hud = JGProgressHUD(style: .light)
    
    private init() {}
    
    func show(view: UIView, msg: String) {
        hud.textLabel.text = msg
        hud.show(in: view)
    }
    
    func dismiss() {
        //hud.dismiss(afterDelay: 3.0)
        hud.dismiss()
    }
    
}
