//
//  PointViewController.swift
//  LoginScreen
//
//  Created by 堀田真 on 2020/01/19.
//  Copyright © 2020 堀田真. All rights reserved.
//

import UIKit

class PointViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var pointLabel: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // コレクションビュー用の配列
    let titles = ["友人を招待しよう", "Twitterをフォロー", "Facebookをフォロー"]
    let images: [UIImage] = [UIImage(named: "cake")!, UIImage(named: "shop")!, UIImage(named: "take")!]
    let detailtexts = ["ご友人を招待して、PICKSを利用するとあなたもお得に。", "お得なキャンペーンなどの情報を発信しています。", "PICKSについての最新情報などを発信しています。"]
    let urls = ["nextvc", "https://twitter.com", "https://www.facebook.com/"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // ナビゲーションバーを出す。
        navigationController?.setNavigationBarHidden(false, animated: false)
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
        
        return cell
    }
    
    // セルのタップ
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if urls[indexPath.row] == "nextvc" {
            // 別の画面に遷移
            performSegue(withIdentifier: "toInvite", sender: nil)
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
}
