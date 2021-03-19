//
//  APIViewController.swift
//  
//
//  Created by 김소원 on 2021/03/19.
//

import UIKit
import Alamofire
import SwiftyXMLParser

class APIViewController: UIViewController {
    
    let ApI_url = "http://openapi.data.go.kr/openapi/service/rest/Covid19/getCovid19InfStateJson?serviceKey=IEExHoEH275gCFFf85hmVc8OhYT2REwloLJxlwbgoMj5J9J3ZvEkAS4q%2B6Wd7De1WitSDSCwcl8XLMW2YyzXug%3D%3D&pageNo=1&numOfRows=10&startCreateDt=20200310&endCreateDt=20200315"
    
    let API_key = "IEExHoEH275gCFFf85hmVc8OhYT2REwloLJxlwbgoMj5J9J3ZvEkAS4q%2B6Wd7De1WitSDSCwcl8XLMW2YyzXug%3D%3D"
    
    func getURL(url:String, params:[String:Any]) -> URL {
        let urlParams = params.flatMap({(ket,value)->String in return "\(key)=\(value)"}).joined(separator: "&")
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

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
