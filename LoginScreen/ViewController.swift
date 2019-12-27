//
//  ViewController.swift
//  LoginScreen
//
//  Created by 堀田真 on 2019/12/17.
//  Copyright © 2019 堀田真. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate, UITextViewDelegate {
    
    
    // 一番下にある文章
    @IBOutlet weak var bottomText: UITextView!
    // スクロールビュー
    @IBOutlet weak var scrollView: UIScrollView!
    // pageControll
    @IBOutlet weak var pageControll: UIPageControl!
    
    @IBAction func pageControll(_ sender: Any) {
    }
    
    // facebookから始めるボタン
    @IBOutlet weak var buttonFacebook: UIButton!
    // アカウントを作成ボタン
    @IBOutlet weak var makeAccount: UIButton!
    
    
    // ページビューに入れるための画像
    private let image: [UIImage] = [UIImage(named: "tacos")!, UIImage(named: "search")!, UIImage(named: "shop")!, UIImage(named: "take")!]
    // ピックスのロゴをスクロールビューに入れるためだけの配列
//    private let logoImage: UIImage = UIImage(named: "picks_logo")!
    // 見出しのラベル
    private let labelLarge: [String] = ["", "お店をSearch!", "好きな料理をOrder!", "出来立てをGet!"]
    // 説明文
    private let labelLittle: [String] = ["", "現在地・ジャンルからお店を検索", "キャッシュレスで、\n事前注文までたったの3タップ", "指定時間に出来立ての料理を受け取る"]
    // 現在表示されているページの初期値
    private var page: Int = 0
    // ScrollViewをスクロールする前の位置
    private var startPoint: CGPoint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // スクロールビューのデリゲート
        scrollView.delegate = self
        
        // facebookボタンの設定
        // ラベル枠を丸くする
        buttonFacebook.layer.masksToBounds = true
        // ラベル丸枠の半径
        buttonFacebook.layer.cornerRadius = 25
        
        // アカウント作成していただく
        // ラベル枠を丸くする
        makeAccount.layer.masksToBounds = true
        // ラベル丸枠の半径
        makeAccount.layer.cornerRadius = 25
        
        // テキストにリンクを入れるようの
        let baseString = "※当サービスに会員登録・ログインすることで、サービス利用規約・プライバシーポリシーに同意します。"
        // 文字列に属性をつける
        let attributedString = NSMutableAttributedString(string: baseString)
       // 文章にリンクをつける
        attributedString.addAttribute(.link, value: UIApplication.openSettingsURLString, range: NSString(string: baseString).range(of: "サービス利用規約"))
   
        attributedString.addAttribute(.link,
        value: "https://www.google.co.jp/",
        range: NSString(string: baseString).range(of: "プライバシーポリシー"))
        // 文章に下線をつける
        attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSString(string: baseString).range(of: "サービス利用規約"))
        attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSString(string: baseString).range(of: "プライバシーポリシー"))


        
        bottomText.attributedText = attributedString
        bottomText.textColor = .white
        
        // isSelectableをtrue、isEditableをfalseにする必要がある
        // （isSelectableはデフォルトtrueだが説明のため記述）
        bottomText.isSelectable = true
        bottomText.isEditable = false
        bottomText.delegate = self
        
    }
    
    
    // コピペ。スクロール停止時に呼び出されるメソッド
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
    
           //ページコントロールに現在のページ番号を設定する。
           pageControll.currentPage = Int(scrollView.contentOffset.x / scrollView.frame.maxX)
       }
    
    // スクロールビューのためのコピペ
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        //　scrollViewの表示サイズ（全面）を定数sizeに格納
        let size = CGSize(width: scrollView.frame.size.width, height: scrollView.frame.size.height)
        // 4ページ分のcontentSizeを作成。定数に格納。
        // 座標が0,0から幅がsizeの4つ分、高さはsizeと同じ
        let contentRect = CGRect(x: 0, y: 0, width: size.width * CGFloat(4), height: size.height)
        // contentViewはcontentRectと同じ座標と幅・高さ
        let contentView = UIView(frame: contentRect)
        
        
        
        // 画像を灰色にするための定数
        let grayImage = UIImageView(frame: CGRect(x: 0, y: 0, width: scrollView.frame.size.width * CGFloat(4), height: scrollView.frame.size.height))
        grayImage.backgroundColor = .gray
        grayImage.alpha = 0.75

        // 画像を載せつつ灰色にする
        for i in 0..<4 {
            // 画像をスクロールビューに反映させる
            // 0,1,2,3の順番でイメージビューを指定し、コンテントビューにつける
            let Imageview = UIImageView(frame: CGRect(x: size.width * CGFloat(i), y: 0, width: size.width, height: size.height))
            Imageview.image = image[i]
            Imageview.contentMode = .scaleAspectFill
            Imageview.clipsToBounds = true
            contentView.addSubview(Imageview)
        }
        
        contentView.addSubview(grayImage)
        
        // 灰色にせずにラベルをつける
        for i in 0..<4 {
            
            // 見出しラベルの設定
            let label = UILabel(frame: CGRect(x: size.width * CGFloat(i), y: size.height / 3, width: size.width, height: 42))
            label.numberOfLines = 0 // 改行できるようにする
            label.text = labelLarge[i]  // ラベルのテキストを配列からて取ってくる
            label.textColor = .white    // テキストをしろ色
            label.font = label.font.withSize(40)    // 文字の大きさ
            label.textAlignment = NSTextAlignment.center    // テキストを中央揃えにする

            
            
            // 説明文ラベルの設定
            let labelSmall = UILabel(frame: CGRect(x: size.width * CGFloat(i) , y: size.height / 3 + 50, width: size.width, height: 50))
            labelSmall.numberOfLines = 0 // 改行できるようにする
            labelSmall.text = labelLittle[i]  // ラベルのテキストを配列からて取ってくる
            
            labelSmall.textColor = .white    // テキストを白色
            labelSmall.font = labelSmall.font.withSize(20)    // 文字の大きさ
            labelSmall.textAlignment = NSTextAlignment.center    // テキストを中央揃えにする
            
            
            // コンテントビューに貼り付け
            contentView.addSubview(label)
            contentView.addSubview(labelSmall)
            
        }
        
        // ロゴをスクロールビューに貼り付ける
        let logoImage:UIImage? = UIImage(named: "picks_logo")
        let logoImageview = UIImageView(frame: CGRect(x: self.view.bounds.width / 2 - 100, y: size.height / 3, width: 200, height: 40))
        logoImageview.image = logoImage
        logoImageview.contentMode = .scaleAspectFill
        contentView.addSubview(logoImageview)
        
        
        // scrollViewに4ページ分のViewとサイズを設定する
        scrollView.addSubview(contentView)
        scrollView.contentSize = contentView.frame.size
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
       
    // ナビゲーションバーを隠す
        navigationController?.setNavigationBarHidden(true, animated: false)

    }
    
    

    
    func textView(_ textView: UITextView,
                  shouldInteractWith URL: URL,
                  in characterRange: NSRange,
                  interaction: UITextItemInteraction) -> Bool {

        UIApplication.shared.open(URL)

        return false
    }
    
    // ログインボタン
    @IBAction func loginButton(_ sender: Any) {
    }
    
    // FBアカ作成ボタン
    @IBAction func facebookAccountButton(_ sender: Any) {
    }
    
    // アカ作成ボタン
    @IBAction func makeAccountButton(_ sender: Any) {
    }
}


