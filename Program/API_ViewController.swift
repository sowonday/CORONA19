//
//  API_ViewController.swift
//  Program
//
//  Created by 김소원 on 2021/04/12.
//

import UIKit

class API_ViewController: UIViewController {

    var datas = [Data]()
    var Manager = APIManager()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Manager.getData()
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
