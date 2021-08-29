//
//  MoreInfoViewController.swift
//  LoginIn
//
//  Created by Игорь Сысоев on 27.08.2021.
//

import UIKit

class MoreInfoViewController: UIViewController {

    @IBOutlet weak var hobbiesTableView: UITableView!
    
    var user: Person?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hobbiesTableView.dataSource = self
    }
    
}

//MARK: - Create TableView

extension MoreInfoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return user?.hobbies.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = hobbiesTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = user?.hobbies[indexPath.row].hobbi ?? ""
        return cell
    }
}


