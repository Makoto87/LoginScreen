//
//  LoginViewController.swift
//  LoginScreen
//
//  Created by 堀田真 on 2019/12/17.
//  Copyright © 2019 堀田真. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextViewDelegate {
    
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var helpText: UITextView!
    
    @IBOutlet weak var nextViewButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        // テキストフィールドに下線をつける
        emailTextField.addBorderBottom(height: 1.0, color: UIColor.white)
        passwordTextField.addBorderBottom(height: 1.0, color: UIColor.white)

        
        // ナビゲーションバーアイテムの色
        self.navigationController?.navigationBar.tintColor = .white
        // ナビゲーションバーのテキストを変更する
        self.navigationController?.navigationBar.titleTextAttributes = [
        // 文字の色
            .foregroundColor: UIColor.white
        ]

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
        
        
        let baseString = "パスワードを忘れた方はこちら"

         // 文字列に属性をつける
         let attributedString = NSMutableAttributedString(string: baseString)
         
         attributedString.addAttribute(.link, value: "https://www.google.co.jp/", range: NSString(string: baseString).range(of: "こちら"))
         
         helpText.attributedText = attributedString

         // isSelectableをtrue、isEditableをfalseにする必要がある
         // （isSelectableはデフォルトtrueだが説明のため記述）
         helpText.isSelectable = true
         helpText.isEditable = false
         helpText.delegate = self
    }
    
    @IBAction func nextViewButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}


// テキストフィールドに下線をつける
extension UITextField {
    func addBorderBottom(height: CGFloat, color: UIColor) {
        let border = CALayer()
        border.frame = CGRect(x: 0, y: self.frame.height - (height - 10), width: self.frame.width, height: height)
        border.backgroundColor = color.cgColor
        self.layer.addSublayer(border)
    }
}
