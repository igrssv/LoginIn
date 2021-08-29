//
//  UserViewController.swift
//  LoginIn
//
//  Created by Игорь Сысоев on 27.08.2021.
//

import UIKit

class UserViewController: UIViewController {


    @IBOutlet weak var userPhotoImageView: UIImageView!

    @IBOutlet weak var citiLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var socialLabel: UILabel!
    
    var user: Person?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "\(user?.name ?? "")  \(user?.surname ?? "")"
        createLabels()
        createImage()
    }
    
    //MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let moreinfoVC = segue.destination as? MoreInfoViewController else { return }
        moreinfoVC.user = user
        
    }
    
    
    //MARK: - Create Outlet
    
    func createImage() {
        userPhotoImageView.image = UIImage(named: user?.photo ?? "")
        userPhotoImageView.layer.cornerRadius = userPhotoImageView.frame.width / 2
    }
    
    func createLabels() {
        citiLabel.text = user?.citi
        ageLabel.text = user?.age
        socialLabel.text = user?.message
    }
    
}


