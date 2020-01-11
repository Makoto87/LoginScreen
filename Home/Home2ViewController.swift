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

/*
・livedoor天気情報のお天気Webサービスを利用すること
・表示する個数は、今まで通りのカウント方式のままで大丈夫
・札幌、東京、名古屋、大阪、福岡、那覇の最大6都市の当日の天気を表示
・表示する内容は、天気の画像+文字(晴れ、曇りなど)
・それぞれをタップすると天気概況文と当日の最高気温と最低気温を摂氏で表示
・ライブラリを使用する場合はCocoaPodsを用いること
ライブラリ　→ alamofire 検索。　swiftyJson JSON解析
*/

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
    
    
    // カウントするたびに情報を得る。
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        getWeather()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        getWeather()
        
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
        
        cell.cellTitle.text = weatherTexts[indexPath.row]
        cell.cellImage.image = weatherImages[indexPath.row]
        cell.cellButton.layer.cornerRadius = 10

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

        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON { (response) in

            switch response.result {
            case .success:
                // 画像を取得
                let json:JSON = JSON(response.data as Any)
                guard let weatherImage = json["forecasts"][0]["image"]["url"].string else {
                    return
                }
                // 文字データを取得
                guard let weatherText = json["forecasts"][0]["telop"].string else {
                    return
                }
                // 天気概況分を取得
                guard let detailWeatherText = json["description"]["text"].string else {
                    return
                }
                self.detailWeatherTexts.append(detailWeatherText)
                // 最高気温を取得
                guard let maxTemperature = json["forecasts"][0]["temperature"]["max"]["celsius"].string else {
                    return
                }
                self.maxTemperatures.append(maxTemperature)
                // 最低気温を取得
                guard let minTemperature = json["forecasts"][0]["temperature"]["min"]["celsius"].string else {
                    return
                }
                self.minTemperatures.append(minTemperature)
                
                print(weatherImage)
                print(weatherText)
                print(self.detailWeatherTexts)
                print(self.maxTemperatures)
                print(self.minTemperatures)
                
                self.weatherTexts.append(weatherText)   // 配列に格納
                
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



