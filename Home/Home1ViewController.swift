//
//  Home1ViewController.swift
//  LoginScreen
//
//  Created by 堀田真 on 2019/12/23.
//  Copyright © 2019 堀田真. All rights reserved.
//

import UIKit


class Home1ViewController: UIViewController, UITabBarDelegate {

    @IBOutlet weak var numberLabel: UILabel!
    
    @IBOutlet weak var plus: UIButton!
    
    @IBOutlet weak var minus: UIButton!
    
    
    var number = 0      // ラベルと2つ目の画面へ渡す数字
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        numberLabel.text = String(number)       // 数字をラベルに反映させる。
        minus.isEnabled = false     // マイナスボタンを使えないようにしておく
    }
    
    // マイナスボタン
    @IBAction func lessButoon(_ sender: Any) {
        // インターバルのために無効
        minus.isEnabled = false
        plus.isEnabled = false
        // 1~5なら数字が減る
        if self.number == 1 {
            self.number = self.number - 1
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.plus.isEnabled = true
            }
        } else if self.number > 1 && self.number <= 5 {
            self.number = self.number - 1
            // 1秒後にボタンを使えるようにする
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.minus.isEnabled = true
                self.plus.isEnabled = true
            }
        } else if self.number == 6 {
            self.number = self.number - 1
            // 1秒後にボタンを使えるようにする
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.minus.isEnabled = true
                self.plus.isEnabled = true
            }
        } else {
            return
        }
        
        self.numberLabel.text = String(self.number)       // 数字をラベルに反映させる
        
        // タブバーを通じて値を２画面に渡す
        if let nc = self.tabBarController?.viewControllers?[1] as? HomeNavigationViewController, let controller = nc.viewControllers[0] as? Home2ViewController {
            controller.count = self.number
            // 配列の末尾を消す
            controller.detailWeatherTexts.removeLast()
            controller.maxTemperatures.removeLast()
            controller.minTemperatures.removeLast()
            controller.weatherTexts.removeLast()
//            controller.weatherImages.removeLast()
            controller.Nukeurl.removeLast()
            
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
        
    }
    
    // プラスボタン
    @IBAction func plusButton(_ sender: Any) {
                
        // インターバルのために無効
        plus.isEnabled = false
        minus.isEnabled = false
        // 0~4なら+1カウントする
        if self.number >= 0 && self.number < 5 {
            self.number = self.number + 1   // 数を増やす
            // バグが起こらないようにインターバルを開ける（1秒）
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.plus.isEnabled = true  // インターバル
                self.minus.isEnabled = true     // マイナスボタンを使えるようにする。
            }
        } else if self.number == 5 {
            self.number = self.number + 1
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.minus.isEnabled = true     // マイナスボタンを使えるようにする。
            }
        }
        
        self.numberLabel.text = String(self.number)       // ラベルに数字を反映させる
        
        // タブバーコントローラーからナビゲーションバーを通じて２つ目のviewControllerに値を渡す。
        if let nc = self.tabBarController?.viewControllers?[1] as? HomeNavigationViewController, let controller = nc.viewControllers[0] as? Home2ViewController {
            controller.count = self.number
            print(controller)
            controller.getWeather()
            // 画面を再形成させる
            controller.loadView()
            controller.viewWillAppear(true)
        }
        
    }
    
    
   
}


