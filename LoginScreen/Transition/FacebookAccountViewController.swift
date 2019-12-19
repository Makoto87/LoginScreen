//
//  FacebookAccountViewController.swift
//  LoginScreen
//
//  Created by 堀田真 on 2019/12/17.
//  Copyright © 2019 堀田真. All rights reserved.
//

import UIKit

class FacebookAccountViewController: UIViewController {

    @IBOutlet weak var SMSButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // ナビゲーションバーアイテムの色
        self.navigationController?.navigationBar.tintColor = .white
        // ナビゲーションバーのテキストを変更する
        self.navigationController?.navigationBar.titleTextAttributes = [
        // 文字の色
            .foregroundColor: UIColor.white
        ]
        
        // SMSのボタン
        // ラベル枠を丸くする
        SMSButton.layer.masksToBounds = true
        // ラベル丸枠の半径
        SMSButton.layer.cornerRadius = 10
        
        // ナビゲーションバーを出す。
        navigationController?.setNavigationBarHidden(false, animated: false)
        // ナビゲーションを透明にする処理
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController!.navigationBar.shadowImage = UIImage()
        
        // グラデーション設定
        //グラデーションの開始色
        let topColor = UIColor(red:1.0, green:0.4, blue:0.0, alpha:1)
        //グラデーションの開始色
        let bottomColor = UIColor(red:1.0, green:0.74, blue:0.0, alpha:1)

        //グラデーションの色を配列で管理
        let gradientColors: [CGColor] = [topColor.cgColor, bottomColor.cgColor]

        //グラデーションレイヤーを作成
        let gradientLayer: CAGradientLayer = CAGradientLayer()

        //グラデーションの色をレイヤーに割り当てる
        gradientLayer.colors = gradientColors
        //グラデーションレイヤーをスクリーンサイズにする
        gradientLayer.frame = self.view.bounds
        
        // 始まる位置と終わる位置を指定
        gradientLayer.startPoint = CGPoint(x:0.0,y:0.5)
        gradientLayer.endPoint = CGPoint(x:1,y:0.5)

        //グラデーションレイヤーをビューの一番下に配置
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
