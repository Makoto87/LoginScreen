//
//  Home4ViewController.swift
//  LoginScreen
//
//  Created by 堀田真 on 2019/12/24.
//  Copyright © 2019 堀田真. All rights reserved.
//

import UIKit

class Home4ViewController: UIViewController {

    @IBOutlet weak var pointButton: UIButton!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var passwordLabel: UILabel!
    
    @IBOutlet weak var myHumanImage: UIImageView!
    
    // 招待ボタンのoutlet
    @IBOutlet weak var inviteView: UIView!
    @IBOutlet weak var Imageview: UIView!
    @IBOutlet weak var inviteTextLabel: UILabel!
    
    // ポイントボタン
    @IBOutlet weak var pointButtonView: UIView!
    @IBOutlet weak var pointLabel: UILabel!
    
    // テキストを保存する
    var savedEmail: String = ""
    var savedPassword = ""
    
    // ポイント数を格納
    var point = 100
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(savedEmail)
        print(savedPassword)
        
        // 招待ボタンの角丸とかげ
        // ポイント画面の角を丸くする
        self.inviteView.layer.cornerRadius = 8
        // 影の設定
        self.inviteView.layer.shadowOpacity = 0.3
        self.inviteView.layer.shadowRadius = 4
        self.inviteView.layer.shadowColor = UIColor.black.cgColor
        self.inviteView.layer.shadowOffset = CGSize(width: 3, height: 3)
        
        // 「友人を招待」のボーダー
        self.inviteTextLabel.layer.borderWidth = 1.0    // 枠線の幅
        self.inviteTextLabel.layer.borderColor = UIColor.systemOrange.cgColor
        // 角を丸くする
        self.inviteTextLabel.layer.cornerRadius = 15
        
        // 共有アイコンを丸くする
        self.Imageview.layer.cornerRadius = 25
        
        // ポイントボタンの角を丸くする
        self.pointButtonView.layer.cornerRadius = 17
        
        // アイコン部分を丸くする
        myHumanImage.contentMode = .scaleAspectFill
        myHumanImage.clipsToBounds = true
        myHumanImage.layer.cornerRadius = myHumanImage.frame.height / 2.0
        
        // ナビゲーションバーの影を消す。
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        // ナビゲーションバーの文字「戻る」を消す
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // ナビゲーションバーを隠す。
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        pointLabel.text = String(point)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        emailLabel.text = savedEmail
        passwordLabel.text = savedPassword
    }
    
    // 画面遷移時に値を渡す。
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPoint" {
            
            let nextView = segue.destination as! PointViewController
            
            nextView.point = point
        }
    }
    
    // ポイント画面の遷移時
    @IBAction func toPointButton(_ sender: Any) {
        
    }
    
    
    // ログイン画面へ遷移する
    @IBAction func toLoginButton(_ sender: Any) {

        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
   
}
