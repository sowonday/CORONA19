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
    
    @IBOutlet weak var coronaInfo: UITextView!
    @IBOutlet weak var coronaAll: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        areaValue()
            }


    func areaValue() { //지역 값
        //어떻게 할까 고민중..
        APIManager.getData("busan") { (isSuccess, persons) in //서울 지역 값을 밥아오고, boolen값에 통신성공 isSuccess 그리고 persons값을 넣어준다.
            if isSuccess{
                self.coronaAll.text = "\(persons)"
            }
        }
        
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


