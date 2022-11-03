//
//  DetailsVC.swift
//  Elene_Kapanadze_14
//
//  Created by Ellen_Kapii on 10.07.22.
//

import UIKit

class DetailsVC: UIViewController {
    
    // Data catchers
    var passedUsername: String!
    var passedEmail: String!
    
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var email: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        self.username.text = passedUsername
        self.email.text = passedEmail
    }
    
    @IBAction func signOut(_ sender: UIButton) {
        guard let myView = Bundle.main.loadNibNamed("CustomView", owner: nil, options: nil)![0] as? CustomView else { return }
        view.addSubview(myView)
        myView.yesAction = {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "loginVC") as? loginVC
            guard let vc = vc else { return }
            self.navigationController?.viewControllers = [vc]
        }
    }
}

