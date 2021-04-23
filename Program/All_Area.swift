//
//  APUViewController.swift
//  Program
//
//  Created by 김소원 on 2021/03/25.
//

import UIKit
import Alamofire
import SwiftyJSON

class APIViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    let Area_Array = 17
    let Picker_View_Column = 1
    
    var Picker_Area = ["충청남도","충청북도","대전광역시", "경상북도", "인천광역시","부산광역시","울산광역시","광주광역시","세종특별자치시","대구광역시","서울특별시","강원도","경기도","전라북도","제주특별자치도","경상남도","전라남도"]
    

    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return Picker_View_Column
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Picker_Area.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Picker_Area[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickArea.text = Picker_Area[row]
        var change_address = Picker_Area[row]
        
        if change_address == "광주광역시" {
            change_address = "gwangju"
        }
        else if change_address == "충청남도"{
            change_address = "chungnam"
        }
        else if change_address == "충청북도"{
            change_address = "chungbuk"
        }
        else if change_address == "대전광역시"{
            change_address = "daejeon"
        }
        else if change_address == "경상북도"{
            change_address = "gyeongbuk"
        }
        else if change_address == "인천광역시"{
            change_address = "incheon"
        }
        else if change_address == "부산광역시"{
            change_address = "busan"
        }
        else if change_address == "울산광역시"{
            change_address = "ulsan"
        }
        else if change_address == "세종특별자치시"{
            change_address = "sejong"
        }
        else if change_address == "대구광역시"{
            change_address = "daegu"
        }
        else if change_address == "서울특별시"{
            change_address = "seoul"
        }
        else if change_address == "강원도"{
            change_address = "gangwon"
        }
        else if change_address == "경기도"{
            change_address = "gyeonggi"
        }
        else if change_address == "전라북도"{
            change_address = "jeonbuk"
        }
        else if change_address == "제주특별자치도"{
            change_address = "jeju"
        }
        else if change_address == "경상남도"{
            change_address = "gyeongnam"
        }
        else if change_address == "전라남도"{
            change_address = "jeonnam"
        } //현재 위치와 대조
        
       
        APIManager.getData { (isSuccess, resultjson) in
            if isSuccess{
                let pick_area = Data_ALL(resultjson[change_address]).countryName
                let pick_newcase = Data_ALL(resultjson[change_address]).newCase
                let pick_total = Data_ALL(resultjson[change_address]).totalCase
                let pick_death = Data_ALL(resultjson[change_address]).death
                
                self.pickArea.text = "\(pick_area)"
                self.pickNewCase.text = "\(pick_newcase)"
                self.pickTotalCase.text = "\(pick_total)"
                self.pickDeath.text = "\(pick_death)"
            }
        }
        
        }
        
    
    
    
//    @IBOutlet weak var coronaInfo: UITextView!

    @IBOutlet weak var pickerArea: UIPickerView!
    @IBOutlet weak var pickArea: UITextField!
    @IBOutlet weak var pickNewCase: UITextField!
    @IBOutlet weak var pickTotalCase: UITextField!
    @IBOutlet weak var pickDeath: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
