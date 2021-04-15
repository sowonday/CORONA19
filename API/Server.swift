//
//  Server.swift
//  Program
//
//  Created by 김소원 on 2021/04/14.
//

import Foundation
import Alamofire
import SwiftyJSON

class Server {
    func getData(){
        
    AF.request("https://api.corona-19.kr/korea/country/new/?serviceKey=ohqQryHa9IUxPKRGTglfeVN1imsjZb6Fn", method: .get, parameters: [:], encoding: URLEncoding.default, headers:  ["Content-Type":"application/json;charset=utf-8"]).responseJSON { response in
            switch response.result {
            case .success(let value):
                
                    let json = JSON(value)
                    //Geting Json
                
            case .failure(let error):
                print(error)
            }
        }
    }
}
//    func buttonClicked( _ completion : @escaping (Bool, Any) -> Void ) {
//        AF.request("https://api.corona-19.kr/korea/country/new/?serviceKey=ohqQryHa9IUxPKRGTglfeVN1imsjZb6Fn", method: .get , parameters: [:], headers:["Content-Type":"application/json;charset=utf-8"]).validate()
//            .responseJSON {(response) in
//                var resultjson: JSON
//        switch response.result {
//
//        case .success(let value):
//
//            resultjson = JSON(value)
//
//        case .failure(let e):
//            print(e.localizedDescription)
//        }
//    }
//
//    }

   
    

