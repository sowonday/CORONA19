//
//  SplashViewController.swift
//  CORONA19
//
//  Created by 김소원 on 2021/04/28.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("sw")
    }
    
    override func viewDidAppear(_ animated: Bool) {
           checkDeviceNetworkStatus()
        }
        
        func checkDeviceNetworkStatus() {
            if(DeviceManager.shared.networkStatus) {
                let firstVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MyAreaViewController")
                
               
                self.present(firstVC, animated: true, completion: nil)
            }
            else {
                let alert = UIAlertController(title: "네트워크 상태 확인", message: "네트워크가 불안정 합니다.", preferredStyle: UIAlertController.Style.alert)
                let action = UIAlertAction(title: "다시 시도", style: .default) { (action) in
                    self.checkDeviceNetworkStatus()
                }

                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
                
            }
        }
    }
