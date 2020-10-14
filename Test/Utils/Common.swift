//
//  Common.swift
//  Test
//
//  Created by Admin on 10/15/20.
//

import Foundation
class Common {
    static let shared = Common()
    private init() {
        print("NavManager Initialized")
    }
    
    //////This function is for checking Valid Email Address
    func isValidEmail(testStr:String) -> Bool {
        // print("validate calendar: \(testStr)")
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
}
