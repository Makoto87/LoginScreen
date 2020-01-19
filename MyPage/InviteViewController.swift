//
//  InviteViewController.swift
//  LoginScreen
//
//  Created by 堀田真 on 2020/01/19.
//  Copyright © 2020 堀田真. All rights reserved.
//

import UIKit

class InviteViewController: UIViewController {

    @IBOutlet weak var quponCodeLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // ラベルのタッチ操作を許可する
        quponCodeLabel.isUserInteractionEnabled = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // ナビゲーションバーを出す。
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
//    // ラベルをタップした時の処理
//    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        <#code#>
//    }
//
//    // ラベルからメニュー表示させる
//    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
//        <#code#>
//    }
    
    // ボタンを押したらリンクへ飛ぶ
    @IBAction func facebookButton(_ sender: Any) {
        let url = NSURL(string: "https://www.facebook.com/")
        if UIApplication.shared.canOpenURL(url! as URL){
            UIApplication.shared.open(url! as URL, options: [:], completionHandler: nil)
        }

    }
    
    @IBAction func twitterButton(_ sender: Any) {
        let url = NSURL(string: "https://twitter.com")
        if UIApplication.shared.canOpenURL(url! as URL){
            UIApplication.shared.open(url! as URL, options: [:], completionHandler: nil)
        }
    }
    
    @IBAction func lineButton(_ sender: Any) {
        let url = NSURL(string: "https://line.me/ja/")
        if UIApplication.shared.canOpenURL(url! as URL){
            UIApplication.shared.open(url! as URL, options: [:], completionHandler: nil)
        }
    }
    
}
