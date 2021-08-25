//
//  LoginInViewController.swift
//  LoginIn
//
//  Created by Игорь Сысоев on 24.08.2021.
//

import UIKit

class LoginInViewController: UIViewController {

    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVS = segue.destination as? WelcomeViewController else { return }
        welcomeVS.welcome = "Welcome, \(userNameTF.text ?? "") !"
    }
    
    
    @IBAction func logInButton() {
        if userNameTF?.text != "User" , passwordTF?.text != "Password" {
            let alert = UIAlertController(title: "Oops!",
                                          message:"Error User name or password" ,
                                          preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Oops!", style: .cancel) {_ in
                self.passwordTF.text = ""}
            alert.addAction(alertAction)
            self.present(alert, animated: true, completion: nil)
        }
        }
    

    @IBAction func helpButton(_ sender: UIButton) {
        if sender.titleLabel?.text != "Forgot  User Name" {
            let alert = UIAlertController(title: "Oops!",
                                          message:"You password: Password" ,
                                          preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Oops!", style: .cancel)
            alert.addAction(alertAction)
            self.present(alert, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Oops!",
                                          message:"You user name: User" ,
                                          preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Oops!", style: .cancel)
            alert.addAction(alertAction)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTF.text = ""
        passwordTF.text = ""
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
