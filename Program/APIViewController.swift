//
//  APUViewController.swift
//  Program
//
//  Created by 김소원 on 2021/03/25.
//

import UIKit
import Alamofire
import SwiftyJSON

class APIViewController: UIViewController {
    
    struct Data {
        var countryName : String
        var newCase : Int
        
        init(_ json: JSON) {
            countryName = json["countryName"].stringValue
            newCase = json["newCase"].intValue
        }

    }

    @IBOutlet weak var coronaInfo: UITextView!
    @IBOutlet weak var coronaAll: UITextView!
    
    func getData() {

            AF.request("https://api.corona-19.kr/korea/country/new/?serviceKey=ohqQryHa9IUxPKRGTglfeVN1imsjZb6Fn", method: .get, parameters: [:], encoding: URLEncoding.default, headers:  ["Content-Type":"application/json;charset=utf-8"])
                        .validate()
                .responseJSON{ response in
                    
                    var resultjson: JSON
                    
                    switch response.result{
                    case .success(let value):
                        
                        resultjson = JSON(value)// api추출 값 json으로 변경
                        
                    
                        
                        let data = Data(resultjson[""])
                        print(data)
                        
                        var AllInfo : String = ""
                        AllInfo = "\(resultjson)"
//                        self.coronaAll.text = AllInfo // 전체 코로나 정보를 띄움
                        
//
//                        let chungnam = resultjson["chungnam","newCase"] //충남
//                        let chungbuk = resultjson["chungbuk","newCase"] //충북
//                        let daejeon = resultjson["daejeon","newCase"]//대전
//                        let gyeongbuk = resultjson["gyeongbuk","newCase"] //경북
//                        let incheon = resultjson["incheon","newCase"] //인천
//                        let busan = resultjson["busan","newCase"]//부산
//                        let ulsan = resultjson["ulsan","newCase"]//울산
//                        let gwangju = resultjson["gwangju","newCase"]//광주
//                        let sejong = resultjson["sejong","newCase"]//세종
//                        let daegu = resultjson["daegu","newCase"]//대구
//                        let seoul = resultjson["seoul","newCase"] //서울
//                        let gangwon = resultjson["gangwon","newCase"]//강원
//                        let gyeonggi = resultjson["gyeonggi","newCase"]//경기
//                        let jeonbuk = resultjson["jeonbuk","newCase"]//전북
//                        let jeju = resultjson["jeju","newCase"]//제주
//                        let gyeongnam = resultjson["gyeongnam","newCase"]//경남
//                        let jeonnam = resultjson["jeonnam","newCase"]//전남 -> 지역별로 코로나 추출
                    
//                        let area : Data = Data(JSON(busan))
//
//                        print(area)
//
                       
                        
                        
    
//
//                        var countryInfo : String = ""
//                        countryInfo = "\(test)"
//                        self.coronaInfo.text = countryInfo
                    
    //                        print(country)
                
                    case .failure(let e): //실패 시
                        print(e.localizedDescription)
                        
                        
                    }
                    
                   }
            
                }
        


    override func viewDidLoad() {
        super.viewDidLoad()
        
        getData()

        // Do any additional setup after loading the view.
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
