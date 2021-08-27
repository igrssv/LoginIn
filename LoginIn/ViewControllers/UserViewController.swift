//
//  UserViewController.swift
//  LoginIn
//
//  Created by Игорь Сысоев on 27.08.2021.
//

import UIKit

class UserViewController: UIViewController {

    private let user = Person.getPerson()
    
    @IBOutlet weak var userPhotoImageView: UIImageView!

    @IBOutlet weak var citiLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var socialLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = user.name + " " + user.surname
        createLabels()
        createImage()

    }
    

    @IBAction func moreInfoButton(_ sender: Any) {
    }
    
    fileprivate func createImage() {
        userPhotoImageView.image = UIImage(named: user.photo)
        userPhotoImageView.layer.cornerRadius = userPhotoImageView.bounds.height / 2
    }
    
    fileprivate func createLabels() {
        citiLabel.text = user.citi
        ageLabel.text = user.age
        socialLabel.text = user.message
    }
    
}


