//
//  LoginInViewController.swift
//  LoginIn
//
//  Created by Игорь Сысоев on 24.08.2021.
//

import UIKit

class LoginInViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    private let user = Person.getPerson()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTF.delegate = self
        passwordTF.delegate = self
        
    }
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UITabBarController else { return }
        for viewController in tabBarController.viewControllers! {
            if let welcomeVS = viewController as? WelcomeViewController {
                welcomeVS.username = user.name + " " + user.surname
            }
           
        }
        
    }
    
    // MARK: - IBAction
    @IBAction func logInButton() {
        if userNameTF?.text != user.login || passwordTF?.text != user.password {
            alertCreate(title: "Oops!", message: "Error User name or password")
        }
        }
    
    @IBAction func helpButton(_ sender: UIButton) {
// поправить
        if sender.titleLabel?.text != "Forgot  User Name" {
            alertCreate(title: "Oops!", message: "You password: \(user.password)")
        } else {
            alertCreate(title: "Oops!", message: "You user name: \(user.login)")
        }
    }

    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTF.text = ""
        passwordTF.text = ""
    }
}


    // MARK: - Alert
extension LoginInViewController {
    private func alertCreate(title: String, message: String) {
        let alert = UIAlertController(title: title,
                                      message: message ,
                                      preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .cancel) {_ in
            self.passwordTF.text = ""}
        alert.addAction(alertAction)
        present(alert, animated: true)
    }
}

// MARK: - Keyboard
extension LoginInViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    internal func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTF {
            passwordTF.becomeFirstResponder()
        } else if textField == passwordTF {
            logInButton()
            performSegue(withIdentifier: "donekeyboard", sender: nil)
        }
        return true
    }
}
