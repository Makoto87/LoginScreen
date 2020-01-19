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
    
    // テキストを保存する
    var savedEmail: String = ""
    var savedPassword = ""
    
    // ポイント数を格納
    var point = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(savedEmail)
        print(savedPassword)
        
        // ナビゲーションバーの影を消す。
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // ナビゲーションバーを隠す。
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        pointButton.setTitle(String(point), for: .normal)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        emailLabel.text = savedEmail
        passwordLabel.text = savedPassword
    }
    
    // ポイント画面の遷移時
    @IBAction func toPointButton(_ sender: Any) {
//        guard segue.identifier == "showDetail", let secondVC = segue.destination as? DetailViewController  else{
//            return
//        }
//        // 情報を渡す
//        secondVC.detailWeathertexts = nvcDetail
//        secondVC.maxText = nvcMax
//        secondVC.minText = nvcMin
    }
    
    
    // ログイン画面へ遷移する
    @IBAction func toLoginButton(_ sender: Any) {

        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
   
}
