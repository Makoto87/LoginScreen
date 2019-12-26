//
//  Home1ViewController.swift
//  LoginScreen
//
//  Created by 堀田真 on 2019/12/23.
//  Copyright © 2019 堀田真. All rights reserved.
//

import UIKit


//// tabbar値の受け渡し
//protocol Home1Delegate: class {
//    func saveButtonTapped(text: String)
//}

class Home1ViewController: UIViewController, UITabBarDelegate {

    @IBOutlet weak var numberLabel: UILabel!
    
    
    // tabbar値の受け渡し
//    weak var delegate: Home1Delegate?
    
    var number = 1      // ラベルと2つ目の画面へ渡す数字
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        numberLabel.text = String(number - 1)       // 数字をラベルに反映させる。
        
    }
    
    // マイナスボタン
    @IBAction func lessButoon(_ sender: Any) {
        // 1~5なら数字が減る
        if number > 1 && number <= 6 {
            number = number - 1
        } else {
            return
        }
        
        numberLabel.text = String(number - 1)       // 数字をラベルに反映させる
        
        // タブバーを通じて値を２画面に渡す
        if let controller = tabBarController?.viewControllers?[1] as? Home2ViewController {
            controller.count = number
            // 画面を再形成させる
            controller.loadView()
            controller.viewDidLoad()
        }
        
    }
    
    // プラスボタン
    @IBAction func plusButton(_ sender: Any) {
        
        // 0~4なら+1カウントする
        if number >= 1 && number < 6 {
            number = number + 1
        } else {
            return
        }
        
        numberLabel.text = String(number - 1)       // ラベルに数字を反映させる
        
        // タブバーコントローラーを通じて２つ目のviewControllerに値を渡す。
        if let controller = tabBarController?.viewControllers?[1] as? Home2ViewController {
            controller.count = number
            // 画面を再形成させる
            controller.loadView()
            controller.viewDidLoad()
        }
    }
   
}


