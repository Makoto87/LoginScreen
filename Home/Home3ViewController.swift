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
            controller.detailWeatherTexts.removeAll()
            controller.maxTemperatures.removeAll()
            controller.minTemperatures.removeAll()
            controller.weatherTexts.removeAll()
//            controller.weatherImages.removeAll()
            controller.Nukeurl.removeAll()
            
            print(controller.count)
            print(controller.maxTemperatures)
            print(controller.minTemperatures)
//            print(controller.weatherImages)
            print(controller.weatherTexts)
            print(controller.detailWeatherTexts)
            print(controller.Nukeurl)
                        
            // 画面を再形成させる
            controller.loadView()
            controller.viewWillAppear(true)
        }
        
        if let controller = tabBarController?.viewControllers?[0] as? Home1ViewController {
            controller.number = number
            // マイナスボタンを使えなくする
            controller.minus.isEnabled = false
            // 画面を再形成させる
            controller.loadView()
            controller.viewDidLoad()
        }
    }
    

}

