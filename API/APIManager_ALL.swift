//
//  APIManager_ALL.swift
//  Program
//
//  Created by 김소원 on 2021/04/12.
//

import Foundation
import Alamofire
import SwiftyJSON

class APIManager_ALL{
    
    static var allPersons: [Data_ALL] = []
   
    static func getData(_ area: String, completion: @escaping (Bool, [Data_ALL]) -> Void) { //escaping closure사용

        AF.request("https://api.corona-19.kr/korea/country/new/?serviceKey=ohqQryHa9IUxPKRGTglfeVN1imsjZb6Fn", method: .get, parameters: [:], encoding: URLEncoding.default, headers:  ["Content-Type":"application/json;charset=utf-8"])
                        .validate()    //alamofire로 서버로 request 전송 후 데이터 가져오기
                .responseJSON{ response in //responseJSON을 escaping closur이므로 {response in} 부분은 결과가 모두 들어온 후에 실행
                
                    var resultjson: JSON
                
                    switch response.result{
                    case .success(let value):
                        
                        resultjson = JSON(value)// api추출 값 json으로 변경
                       
                          let data = Data_ALL(resultjson[area]) // data배열에 저장해준 값으로 변환 후 저장
                        allPersons.append(data) //persons에 변수 data값을 넣어준다.
                        DispatchQueue.main.async {
                            completion(true,allPersons)
                        } //화면업데이트는 메인 스레드에서 이루어져야한다
                            
                    case .failure(let e): //실패 시
                        print(e.localizedDescription)
                        
                        
                    }
                    
                   }
            
                }
    
}



