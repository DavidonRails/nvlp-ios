//
//  Extensions.swift
//  Test
//
//  Created by Admin on 10/15/20.
//

import Foundation
import UIKit

extension UIViewController {
    
    //Show Alert function
    func showAlert(title: String, msg: String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .`default`, handler: { _ in
            NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
}
