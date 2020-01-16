//
//  Home2ViewController.swift
//  LoginScreen
//
//  Created by 堀田真 on 2019/12/24.
//  Copyright © 2019 堀田真. All rights reserved.
//

import UIKit
// ライブラリ
import Alamofire
import SwiftyJSON


class Home2ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITabBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!
        
    // カウント数
    var count = 0
    
    var weatherImages: [UIImage] = []       // 天気の画像を入れる配列
    var weatherTexts:[String] = []  // 天気の文字を入れる配列
    var detailWeatherTexts: [String] = []   // 天気概況分を入れる配列
    var maxTemperatures: [String] = []  // 最高気温を入れる配列
    var minTemperatures: [String] = []   // 最低気温を入れる配列
    
    //次の画面へ持っていくテキスト
    var nvcDetail = ""
    var nvcMax = ""
    var nvcMin = ""
    
    var url = ""    // urlを格納するための変数
    
    // カウントするたびに画面を更新する。
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
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
    
    // セルの高さ設定
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 260
    }
    
    // セルの中身を設定
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: Cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! Cell
        
        cell.cellTitle.text = weatherTexts[indexPath.row]       // 天気の名前
        cell.cellImage.image = weatherImages[indexPath.row]     // 天気の画像
//        cell.cellButton.layer.cornerRadius = 10     // 今回は使わない

        return cell
    }
    
    // セルを選んだ時のメソッド
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        // 天気概況文・最高最低気温を取得
        nvcDetail = detailWeatherTexts[indexPath.row]
        nvcMax = maxTemperatures[indexPath.row]
        nvcMin = minTemperatures[indexPath.row]
    
        // セルの選択を解除
        tableView.deselectRow(at: indexPath, animated: true)
        
        print(nvcDetail)
        print(nvcMax)
        print(nvcMin)
        
        // 別の画面に遷移
        performSegue(withIdentifier: "showDetail", sender: nil)
       }
    
    // 画面遷移時のメソッド
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard segue.identifier == "showDetail", let secondVC = segue.destination as? DetailViewController  else{
            return
        }
        // 情報を渡す
        secondVC.detailWeathertexts = nvcDetail
        secondVC.maxText = nvcMax
        secondVC.minText = nvcMin
        
        print(secondVC.detailWeathertexts)
        print(secondVC.maxText)
        print(secondVC.minText)
        
    }
    
    // ID 札幌： 016010、東京: 130010、名古屋: 230010、大阪: 270000、福岡: 400010、那覇: 471010
    // 天気情報を取得
    func getWeather() {

        // countによって取得する情報（url）を変える
        print(count)
        switch count {
            case 1:
                url = "http://weather.livedoor.com/forecast/webservice/json/v1?city=016010"
            case 2:
                url = "http://weather.livedoor.com/forecast/webservice/json/v1?city=130010"
            case 3:
                url = "http://weather.livedoor.com/forecast/webservice/json/v1?city=230010"
            case 4:
                url = "http://weather.livedoor.com/forecast/webservice/json/v1?city=270000"
            case 5:
                url = "http://weather.livedoor.com/forecast/webservice/json/v1?city=400010"
            case 6:
                url = "http://weather.livedoor.com/forecast/webservice/json/v1?city=471010"
            default:
                break
        }

        // 情報を取得する
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON { (response) in

            switch response.result {
            case .success:
                // 画像を取得
                let json:JSON = JSON(response.data as Any)
                guard let weatherImage = json["forecasts"][0]["image"]["url"].string else {
                    return
                }

                // 文字データを取得
                if let weatherText = json["forecasts"][0]["telop"].string {
                    self.weatherTexts.append(weatherText)   // 配列に格納
                }

                // 天気概況分を取得
                if let detailWeatherText = json["description"]["text"].string {
                    self.detailWeatherTexts.append(detailWeatherText)   // 配列に格納
                }

                // 最高気温を取得
                if let maxTemperature = json["forecasts"][0]["temperature"]["max"]["celsius"].string {
                    self.maxTemperatures.append(maxTemperature)     // 配列に格納
                } else {
                    self.maxTemperatures.append("今日はありません。")    // nillの時は別の情報を入れる
                }

                // 最低気温を取得
                if let minTemperature = json["forecasts"][0]["temperature"]["min"]["celsius"].string {
                        self.minTemperatures.append(minTemperature)     // 配列に格納
                } else {
                    self.minTemperatures.append("今日はありません。")        // nillの時はじ別の情報を入れる。
                }
                
                print(weatherImage)
                print(self.weatherTexts)
                print(self.detailWeatherTexts)
                print(self.maxTemperatures)
                print(self.minTemperatures)
                
                // 画像を取得して配列に格納
                guard let testurl = URL(string: weatherImage) else {
                    return
                }
                do {
                    print(testurl)
                      let data = try Data(contentsOf: testurl)
                      let weatherImage = UIImage(data: data)

                    self.weatherImages.append(weatherImage!)  // 用意した配列に格納
                    
                    print(self.weatherImages)
                    
                 }catch let err {
                      print("Error : \(err.localizedDescription)")
                 }
           
            // 情報取得失敗時の反応
            case .failure(let error):
                print(error)
                
            }

        }
    }

}

// セルのプロパティ
class Cell: UITableViewCell {
    
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var cellButton: UIButton!
    
}



