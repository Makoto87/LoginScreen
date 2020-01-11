//
//  DetailViewController.swift
//  LoginScreen
//
//  Created by 堀田真 on 2020/01/11.
//  Copyright © 2020 堀田真. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    // 前の画面からもらうテキスト
    var detailWeathertexts = "" // 天気概況文
    var maxText = ""    // 最高気温
    var minText = ""    // 最低気温
    
    
    // 天気概況文
    @IBOutlet weak var detailWeather: UILabel!
    // 最高気温
    @IBOutlet weak var max: UILabel!
    // 最低気温
    @IBOutlet weak var min: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailWeather.text = detailWeathertexts
        max.text = maxText
        min.text = minText
        
        print(detailWeathertexts)
        print(maxText)
        print(minText)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        detailWeather.text = detailWeathertexts
        max.text = maxText
        min.text = minText
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
