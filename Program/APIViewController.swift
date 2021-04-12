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
    
    
//    var datas = [Data]()
    var Manager = APIManager()
    var Manager_ALL = APIManager_ALL()
    
    

    @IBOutlet weak var coronaInfo: UITextView!
    @IBOutlet weak var coronaAll: UITextView!
    
   
    
//    func getData() {
//
//            AF.request("https://api.corona-19.kr/korea/country/new/?serviceKey=ohqQryHa9IUxPKRGTglfeVN1imsjZb6Fn", method: .get, parameters: [:], encoding: URLEncoding.default, headers:  ["Content-Type":"application/json;charset=utf-8"])
//                        .validate()
//                .responseJSON{ response in
//
//                    var resultjson: JSON
//
//                    switch response.result{
//                    case .success(let value):
//
//                        resultjson = JSON(value)// api추출 값 json으로 변경
//                        print(resultjson)
//
//
//
//                        let data = Data(resultjson["seoul"])
//                        print(data)
//
//                        var AllInfo : String = ""
//                        AllInfo = "\(resultjson)"
//                      self.coronaAll.text = AllInfo // 전체 코로나 정보를 띄움
                        

//
//                        var countryInfo : String = ""
//                        countryInfo = "\(test)"
//                        self.coronaInfo.text = countryInfo
                    
    //                        print(country)
                
//                    case .failure(let e): //실패 시
//                        print(e.localizedDescription)
//
//
//                    }
//
//                   }
//
//                }
    
    func ALL_GPS() {
        let AllData: () = Manager_ALL.getData()
        self.coronaAll.text = "\(AllData)"
        
    }
    
    func Area_GPS() {
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        Manager.getData(area:"seoul")
        
        
        

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

//extension APIViewController:DataProtocol{
//    func reData(data:[Data]) {
////        self.datas = datas
//    }
//}
