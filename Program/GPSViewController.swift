//
//  GPSViewController.swift
//  Program
//
//  Created by 김소원 on 2021/03/30.
//

import UIKit
import MapKit
import CoreLocation

class GPSViewController: UIViewController,CLLocationManagerDelegate {
    
    @IBOutlet weak var MyMap: MKMapView! //지도
    
    @IBOutlet weak var LocationInfo1: UILabel!//label1
    
    @IBOutlet weak var LocationInfo2: UILabel!//label2
    
    @IBOutlet weak var Locationla: UILabel! //위도
    
    @IBOutlet weak var Locationlo: UILabel! //경도
    
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
        
        
//        //locationManager 인스턴스 생성 및 델리게이트 생성
//        locationManager.delegate = self
//
//        //포그라운드 상태에서 위치 추적 권한 요청
//        locationManager.requestWhenInUseAuthorization()
//
//        //배터리에 맞게 권장되는 최적의 정확도
//        locationManager.desiredAccuracy = kCLLocationAccuracyBest
//
//        //위치업데이트
//        locationManager.startUpdatingLocation()
//
//        //위도 경도 가져오기
//        let coor = locationManager.location?.coordinate
//        latitude = coor?.latitude
//        longitude = coor?.longitude
////        self.Locationlo.text = latitude
////        self.Locationla.text =
//

        // Do any additional setup after loading the view.
    }
    
    func goLocation(latitudeValue: CLLocationDegrees, longitudeValue: CLLocationDegrees, delta span: Double) // 입력파라미터: 위도 값, 경도 값, 범위
    {
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longitudeValue) // 위경도를 매개변수로 하여 2DMake 함수를 호출하고, 리턴 값을 pLocation으로 받는다
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span) //범위 값을 매개변수로 하여 spanValue로 받는다
        let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue) //Plocation과 spanvalue를 매개변수로 하여 리턴 값을 pRegion으로 받는다.
        MyMap.setRegion(pRegion, animated: true) //pRegion 값을 매개변수로 하여 mymap.setregion 함수를 호출
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let pLocation = locations.last // 위치가 업데이트되면 먼저 마지막 위치 값을 찾아냅니다.
        goLocation(latitudeValue: (pLocation?.coordinate.latitude)!, longitudeValue: (pLocation?.coordinate.longitude)!, delta: 0.01) //마지막 위치의 위도 경도 값을 가지고 앞에서 만든 golpcation 함수를 호출, 이때 delta 값은 지도의 크기를 정함. 1의 값보다 지도를 100배 확대해서 보여줌.

        CLGeocoder().reverseGeocodeLocation(pLocation!, completionHandler: { //위도 경도를 가지고 역으로 주소 찾기
            (placemarks, error)-> Void in
            let pm = placemarks!.first // 첫 부분만 pm상수 대입
            let country = pm!.country  // 나라 값을 대입
            var address:String = country! // address에 country 값 대입
            
                    if let locations = locations.first{
            
                        var num1Text: String = ""
                        var num2Text: String = ""
            
                        num1Text = "위도: \(locations.coordinate.latitude)" //변환
                        num2Text = "경도: \(locations.coordinate.longitude)"
                        
                        self.Locationla.text = num1Text
                        self.Locationlo.text = num2Text
                        
            
            
            //            print("위도: \(locations.coordinate.latitude)")
            //            print("경도: \(locations.coordinate.longitude)")
            
                                }
            
            
            if pm!.locality != nil{ //pm상수에 지엽 존재시, address문자열에 추가
                address += ""
                address += pm!.thoroughfare!
                
            }
            if pm!.thoroughfare  != nil{
                address += ""
                address += pm!.thoroughfare! // pm상수에 도로값이 존재하면 address문자열에 추가
            }
            
            
            self.LocationInfo1.text = "현재위치" //레이블에 현재위치 텍스트 표시
            self.LocationInfo2.text = address // address 문자열의 값 표시
          
            
        })
        locationManager.startUpdatingLocation() // 위치가 업데이트 되는 것을 멈춤
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
