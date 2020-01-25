//
//  PointViewController.swift
//  LoginScreen
//
//  Created by 堀田真 on 2020/01/19.
//  Copyright © 2020 堀田真. All rights reserved.
//

import UIKit

class PointViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var marginVIew: UIView!
    
    
    @IBOutlet weak var pointLabel: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var orangeImageView: UIImageView!
    
    
    // 遷移前の数字を受け取る
    var point = 0
    
    // コレクションビュー用の配列
    let titles = ["友人を招待しよう", "Twitterをフォロー", "Facebookをフォロー"]
    let images: [UIImage] = [UIImage(named: "cake")!, UIImage(named: "shop")!, UIImage(named: "take")!]
    let detailtexts = ["ご友人を招待して、PICKSを利用するとあなたもお得に。", "お得なキャンペーンなどの情報を発信しています。", "PICKSについての最新情報などを発信しています。"]
    let urls = ["nextvc", "https://twitter.com/picks_fun", "https://www.facebook.com/picks.fun/"]
    let colors: [UIColor] = [.red, #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1), .black]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        
        // ポイント画面の角を丸くする
        self.orangeImageView.layer.cornerRadius = 8
        // 影を作る
        // 影の設定
        self.orangeImageView.layer.shadowOpacity = 0.3
        self.orangeImageView.layer.shadowRadius = 4
        self.orangeImageView.layer.shadowColor = UIColor.black.cgColor
        self.orangeImageView.layer.shadowOffset = CGSize(width: 3, height: 3)
        
        // ポイント画面の高さを全体の30%にする
        orangeImageView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.32).isActive = true
        // 余白を空けるためのビュー
        marginVIew.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.04).isActive = true
        // コレクションビューの高さ
        collectionView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.40).isActive = true
        
        // コレクションビューのサイズ設定
        let layout = UICollectionViewFlowLayout()
        let height = collectionView.frame.height * 0.75
        let width = collectionView.frame.width / 2
        layout.itemSize = CGSize(width: width, height: height)
        collectionView.collectionViewLayout = layout
        // コレクションビューのスクロール設定
        layout.scrollDirection = .horizontal // 横スクロール
        
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // ナビゲーションバーを出す。
        navigationController?.setNavigationBarHidden(false, animated: false)
        
        // ポイントラベルにポイントを表示
        pointLabel.text = String(point)
    }

    // セルの数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    
    
    // セルの表示
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: CollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CollectionCell
        
        cell.collectionCellImage.image = images[indexPath.row]
        cell.collectionCellTitleLabel.text = titles[indexPath.row]
        cell.collectionCellDetailLabel.text = detailtexts[indexPath.row]
        
        // セルの角を丸くする
        cell.layer.cornerRadius = 8
        
        // セルのレイアウト
        cell.collectionCellView.heightAnchor.constraint(equalTo: cell.heightAnchor, multiplier: 0.17).isActive = true
        
        // 詳細分の背景色
        cell.collectionCellView.backgroundColor = colors[indexPath.row]
        cell.backgroundColor = .black
        
        cell.collectionCellImage.alpha = 0.75

        
        return cell
    }
    
    // セルのタップ
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if urls[indexPath.row] == "nextvc" {
            // 別の画面に遷移
            performSegue(withIdentifier: "toInvite", sender: nil)
            // backボタンの文字を消す
            navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        } else {
            let URL = urls[indexPath.row]
            // urlに飛ぶ
            let url = NSURL(string: URL)
            if UIApplication.shared.canOpenURL(url! as URL){
                UIApplication.shared.open(url! as URL, options: [:], completionHandler: nil)
            }
        }
        
    }

}

class CollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var collectionCellImage: UIImageView!
    @IBOutlet weak var collectionCellTitleLabel: UILabel!
    @IBOutlet weak var collectionCellDetailLabel: UILabel!
    @IBOutlet weak var collectionCellView: UIView!
    
    
}
