//
//  Home2ViewController.swift
//  LoginScreen
//
//  Created by 堀田真 on 2019/12/24.
//  Copyright © 2019 堀田真. All rights reserved.
//

import UIKit

class Home2ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITabBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!
        
    // セル内のボタン
    
    var count = 0
        
    
    // ダミー画像配列
    let images: [UIImage] = [UIImage(named: "sakura")!, UIImage(named: "guzman")!, UIImage(named: "noodle")!, UIImage(named: "friholes")!, UIImage(named: "chicken")!]
    // ダミーテキストデータ
    let texts: [String] = ["サクラ食堂", "GUZMAN y GOMEZ", "aRk PRIVATE LOUNGE", "フリホーレス", "チキンワークス"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        tableView.delegate = self
        tableView.dataSource = self

        // 影を消す
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()

    }
    
    // countの数だけセルが生成される
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 260
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell: Cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! Cell
        
        cell.cellImage.image = images[indexPath.row]
        cell.cellTitle.text = texts[indexPath.row]
        cell.cellButton.layer.cornerRadius = 10
        

        return cell
    }

}

// セルのプロパティ
class Cell: UITableViewCell {
    
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var cellButton: UIButton!
    
}



