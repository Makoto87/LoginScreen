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
    
    @IBOutlet weak var quponLabel: UILabel!
    
    // 各アイコンのoutlet
    @IBOutlet weak var facebookIcon: UIButton!
    @IBOutlet weak var twitterIcon: UIButton!
    @IBOutlet weak var lineIcon: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // ラベルのタッチ操作を許可する
        quponCodeLabel.isUserInteractionEnabled = true
        
        // 「あなたのクーポンコード」にボーダーつける
        self.quponLabel.layer.borderWidth = 1.0    // 枠線の幅
        self.quponLabel.layer.borderColor = UIColor.systemOrange.cgColor
        // 角を丸くする
        self.quponLabel.layer.cornerRadius = 4.0
        
        // クーポンコードの角を丸くする
        self.quponCodeLabel.layer.cornerRadius = 8
        // クーポンコードの影の設定
        self.quponCodeLabel.layer.shadowOpacity = 0.2
        self.quponCodeLabel.layer.shadowRadius = 4
        self.quponCodeLabel.layer.shadowColor = UIColor.black.cgColor
        self.quponCodeLabel.layer.shadowOffset = CGSize(width: 3, height: 3)
        
        // 各アイコンの影の設定
        // facebook
        self.facebookIcon.layer.shadowOpacity = 0.2
        self.facebookIcon.layer.shadowRadius = 4
        self.facebookIcon.layer.shadowColor = UIColor.black.cgColor
        self.facebookIcon.layer.shadowOffset = CGSize(width: 3, height: 3)
        // twitter
        self.twitterIcon.layer.shadowOpacity = 0.2
        self.twitterIcon.layer.shadowRadius = 4
        self.twitterIcon.layer.shadowColor = UIColor.black.cgColor
        self.twitterIcon.layer.shadowOffset = CGSize(width: 3, height: 3)
        // Line
        self.lineIcon.layer.shadowOpacity = 0.2
        self.lineIcon.layer.shadowRadius = 4
        self.lineIcon.layer.shadowColor = UIColor.black.cgColor
        self.lineIcon.layer.shadowOffset = CGSize(width: 3, height: 3)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // ナビゲーションバーを出す。
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
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
