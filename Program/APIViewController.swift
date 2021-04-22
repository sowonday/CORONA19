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
    
//    @IBOutlet weak var coronaInfo: UITextView!
    @IBOutlet weak var coronaAll: UITextView!
    
    let test : Gwangju = Gwangju()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        all_Info()

            }

func all_Info(){
    APIManager_ALL.getData { (isSuccess, resultjson) in
        if isSuccess{
            let seoul = resultjson
            self.coronaAll.text = "\(seoul)"
            
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
