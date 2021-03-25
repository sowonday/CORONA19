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
    
    func getData() {

            AF.request("https://api.corona-19.kr/korea/country/new/?serviceKey=ohqQryHa9IUxPKRGTglfeVN1imsjZb6Fn", method: .get, parameters: [:], encoding: URLEncoding.default, headers:  ["Content-Type":"application/json;charset=utf-8"])
                        .validate()
                .responseJSON{ response in
                    
                    var resultjson: JSON
                    
                    switch response.result{
                    case .success(let value):
                        
                        resultjson = JSON(value)
//                        print(resultjson)
                        
                    let country = resultjson["seoul"]
                        print(country)
                       
                
                    case .failure(let e):
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
