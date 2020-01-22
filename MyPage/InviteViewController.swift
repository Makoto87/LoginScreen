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
    
    // ボタンを押したらfacebbokシェアのリンクへ飛ぶ
    @IBAction func facebookButton(_ sender: Any) {
        let url = NSURL(string: "https://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Fpicks.fun")
        if UIApplication.shared.canOpenURL(url! as URL){
            UIApplication.shared.open(url! as URL, options: [:], completionHandler: nil)
        }

    }
    
    @IBAction func twitterButton(_ sender: Any) {
        
        // ツイッターがあるとき
        if UIApplication.shared.canOpenURL(URL(string: "twitter://")!) {
            // ツイッターを開くかアラート
            let alert: UIAlertController = UIAlertController(title: "Twitterを開いてもいいですか？", message: "", preferredStyle:  UIAlertController.Style.alert)
            // OKボタン
            let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:{
                // ボタンが押された時の処理を書く（クロージャ実装）
                (action: UIAlertAction!) -> Void in
                
                let url = URL(string: "https://twitter.com/intent/tweet?text=%E3%80%90%20%23PICKS%E3%81%A7%E3%83%86%E3%82%A4%E3%82%AF%E3%82%A2%E3%82%A6%E3%83%88%E3%81%97%E3%82%88%E3%81%86%20%E3%80%91%0A%E7%A7%81%E3%81%AE%E6%8B%9B%E5%BE%85%E3%82%B3%E3%83%BC%E3%83%89%3Cpicks-abcdefg%3E%E3%82%92%E4%BC%9A%E5%93%A1%E7%99%BB%E9%8C%B2%E6%99%82%E3%81%AB%E5%85%A5%E5%8A%9B%E3%81%99%E3%82%8C%E3%81%B0%E3%80%81%23PICKS%20%E3%81%AE%E5%88%9D%E5%9B%9E%E6%B3%A8%E6%96%87%E3%81%8C600%E5%86%86%E5%89%B2%E5%BC%95%E3%81%AB%E3%81%AA%E3%82%8A%E3%81%BE%E3%81%99%5E_%5E%0Ahttps://picks.fun")
                UIApplication.shared.open(url!, options:[:], completionHandler: nil)
                print("OK")
            })
            // キャンセルボタン
            let cancelAction: UIAlertAction = UIAlertAction(title: "キャンセル", style: UIAlertAction.Style.cancel, handler:{
                // ボタンが押された時の処理を書く（クロージャ実装）
                (action: UIAlertAction!) -> Void in
                print("Cancel")
            })
            // ③ UIAlertControllerにActionを追加
            alert.addAction(cancelAction)
            alert.addAction(defaultAction)

            // ④ Alertを表示
            present(alert, animated: true, completion: nil)
            
        // ツイッターがないとき
        } else {
            // xxxアプリがインストールされていない
            let url = NSURL(string: "https://twitter.com/intent/tweet?text=%E3%80%90%20%23PICKS%E3%81%A7%E3%83%86%E3%82%A4%E3%82%AF%E3%82%A2%E3%82%A6%E3%83%88%E3%81%97%E3%82%88%E3%81%86%20%E3%80%91%0A%E7%A7%81%E3%81%AE%E6%8B%9B%E5%BE%85%E3%82%B3%E3%83%BC%E3%83%89%3Cpicks-abcdefg%3E%E3%82%92%E4%BC%9A%E5%93%A1%E7%99%BB%E9%8C%B2%E6%99%82%E3%81%AB%E5%85%A5%E5%8A%9B%E3%81%99%E3%82%8C%E3%81%B0%E3%80%81%23PICKS%20%E3%81%AE%E5%88%9D%E5%9B%9E%E6%B3%A8%E6%96%87%E3%81%8C600%E5%86%86%E5%89%B2%E5%BC%95%E3%81%AB%E3%81%AA%E3%82%8A%E3%81%BE%E3%81%99%5E_%5E%0Ahttps://picks.fun")
            if UIApplication.shared.canOpenURL(url! as URL){
                UIApplication.shared.open(url! as URL, options: [:], completionHandler: nil)
            }
        }

        
        
    }
    
    @IBAction func lineButton(_ sender: Any) {
        
        // ラインがあるとき
        if UIApplication.shared.canOpenURL(URL(string: "line://msg/text")!) {
            // ラインアプリを開いていいかアラート
            let alert: UIAlertController = UIAlertController(title: "LINEを開いてもいいですか？", message: "", preferredStyle:  UIAlertController.Style.alert)
            
            // OKボタン
            let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:{
                
                // ボタンが押された時の処理を書く（クロージャ実装）
                (action: UIAlertAction!) -> Void in
                
//                let url = URL(string: "line://msg/text/?{text_message}")
//                UIApplication.shared.open(url!, options:[:], completionHandler: nil)
//                print("OK")
                
                //urlSheme + / + message (+ image or url) のフォーマット
                let urlstring = "line://msg/text/私の招待コード<picks-ahrqabxcya>を会員登録時に入力すれば、#PICKS の初回注文が600円割引になります^_^https://picks.fun/"
                //日本語などをエンコード
                let encodedURL = urlstring.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)
                let url = URL(string: encodedURL!)
                guard let openUrl = url else { return }
                UIApplication.shared.open(openUrl, options: .init(), completionHandler: nil)
            })
            // キャンセルボタン
            let cancelAction: UIAlertAction = UIAlertAction(title: "キャンセル", style: UIAlertAction.Style.cancel, handler:{
                // ボタンが押された時の処理を書く（クロージャ実装）
                (action: UIAlertAction!) -> Void in
                print("Cancel")
            })
            // ③ UIAlertControllerにActionを追加
            alert.addAction(cancelAction)
            alert.addAction(defaultAction)

            // ④ Alertを表示
            present(alert, animated: true, completion: nil)
            
        // ラインがないとき
        } else {
            // ラインがないというアラート
            let alert: UIAlertController = UIAlertController(title: "LINEアプリがありません。", message: "", preferredStyle:  UIAlertController.Style.alert)
                        
                // OKボタン
            let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:nil)
                
                // ③ UIAlertControllerにActionを追加
                alert.addAction(defaultAction)

                // ④ Alertを表示
                present(alert, animated: true, completion: nil)
            
        }
        
        
    }
    
}
