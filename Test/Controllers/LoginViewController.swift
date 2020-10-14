//
//  LoginViewController.swift
//  Test
//
//  Created by Admin on 10/15/20.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func onLogin(_ sender: Any) {
        let email = txtEmail.text ?? ""
        if email.count == 0 {
            showAlert(title: "Warning", msg: "Please enter email.")
            return
        }
        
        ///This is for checking valid email address
        if !Common.shared.isValidEmail(testStr: email) {
            showAlert(title: "Error", msg: "Invalid Email")
            return
        }
        
        let body: [String: Any] = [
            "email": email
        ]
        
        
        //Call Login API
        ProgressHud.shared.show(view: view, msg: "")
        APIService.shared.login(body: body, completion: {
            error, res in
            ProgressHud.shared.dismiss()
            
            if error != nil {
                self.showAlert(title: "Error", msg: error!.localizedDescription)
            } else {
                let response = res as! [String: Any]
                let token = response["token"] as? String ?? ""
                if token.count > 0 {
                    GlobalData.TOKEN = token
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "ResultsViewController") as! ResultsViewController
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            }
        })
    }
}
