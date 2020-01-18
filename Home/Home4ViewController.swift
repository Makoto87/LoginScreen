//
//  Home4ViewController.swift
//  LoginScreen
//
//  Created by 堀田真 on 2019/12/24.
//  Copyright © 2019 堀田真. All rights reserved.
//

import UIKit

class Home4ViewController: UIViewController {

    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var passwordLabel: UILabel!
    
    // テキストを保存する
    var savedEmail: String = ""
    var savedPassword = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(savedEmail)
        print(savedPassword)
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        emailLabel.text = savedEmail
        passwordLabel.text = savedPassword
    }
    
    // ログイン画面へ遷移する
    @IBAction func toLoginButton(_ sender: Any) {

        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
   
}
