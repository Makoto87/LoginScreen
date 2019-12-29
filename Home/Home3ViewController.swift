//
//  Home3ViewController.swift
//  LoginScreen
//
//  Created by 堀田真 on 2019/12/23.
//  Copyright © 2019 堀田真. All rights reserved.
//

import UIKit

class Home3ViewController: UIViewController, UITabBarDelegate {

    var number = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    
    // リセットボタン
    @IBAction func resetButton(_ sender: Any) {
        number = 0
        
        if let nc = tabBarController?.viewControllers?[1] as? HomeNavigationViewController, let controller = nc.viewControllers[0] as? Home2ViewController {
            controller.count = number
            print(controller.count)
            // 画面を再形成させる
            controller.loadView()
            controller.viewDidLoad()
        }
        
        if let controller = tabBarController?.viewControllers?[0] as? Home1ViewController {
            controller.number = number
            // 画面を再形成させる
            controller.loadView()
            controller.viewDidLoad()
        }
    }
    

}

