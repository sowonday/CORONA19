//
//  Gwangju.swift
//  Program
//
//  Created by κΉμμ on 2021/04/20.
//

import Foundation


class Gwangju {
    func person_Gwangju(){
        let gwangju : Void = APIManager.getData { (isSuccess, resultjson) in
            if isSuccess{
                 Data(resultjson["gwangju"])
               
            }
        }
        print(gwangju)
    }
}
