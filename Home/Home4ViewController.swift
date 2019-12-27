//
//  Home4ViewController.swift
//  LoginScreen
//
//  Created by 堀田真 on 2019/12/24.
//  Copyright © 2019 堀田真. All rights reserved.
//

import UIKit

class Home4ViewController: UIViewController {

    var savedString: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        
        
    }
    
    // ログイン画面へ遷移する
    @IBAction func toLoginButton(_ sender: Any) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let nextvc = storyboard.instantiateViewController(withIdentifier: "Navi")
//        nextvc.modalPresentationStyle = .fullScreen // 全面表示
//        self.present(nextvc, animated: true, completion: nil)
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
   
}
