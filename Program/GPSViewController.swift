//
//  GPSViewController.swift
//  Program
//
//  Created by 김소원 on 2021/03/30.
//

import UIKit
import MapKit

class GPSViewController: UIViewController,CLLocationManagerDelegate {
    
    @IBOutlet weak var MyMap: MKMapView! //지도
    
    @IBOutlet weak var LocationInfo1: UILabel!//label1
    
    @IBOutlet weak var LocationInfo2: UILabel!//label2
    
    let locationManager = CLLocationManager()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LocationInfo1.text = ""
        LocationInfo2.text = ""
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest //정확도를 최고조로 설정
        locationManager.requestWhenInUseAuthorization() //위치데이터를 추적하기 위해 사용자에게 승인을 요구
        locationManager.startUpdatingLocation()//위치 업데이트 시작
        MyMap.showsUserLocation = true // 위치 값 보기를 true로 설정
        

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
    
    
    @IBAction func ChangeLocation(_ sender: UISegmentedControl) {
    }
    

}
