//
//  GPSViewController.swift
//  Program
//
//  Created by 김소원 on 2021/03/30.
//

import UIKit
import MapKit
import CoreLocation
import SwiftyJSON

class MyAreaViewController: UIViewController,CLLocationManagerDelegate{
    
    

    @IBOutlet weak var area_death: UITextField! //사망자
    @IBOutlet weak var area_totalCase: UITextField! // 전체 확진자
    @IBOutlet weak var area_newCase: UITextField! //오늘의 확진자
    @IBOutlet weak var area_countryName: UITextField! // 지역명
    @IBOutlet weak var area_Map: MKMapView! //지도
    //    @IBOutlet weak var LocationInfo1: UILabel!//위치정보
    
//    @IBOutlet weak var LocationInfo2: UITextView!//위치
//    @IBOutlet weak var LocationInfo3: UITextView!//상세 위치
    
//    @IBOutlet weak var Locationla: UITextView!//위도
    
//    @IBOutlet weak var Locationlo: UITextView!//경도
    
//    @IBOutlet weak var newCase: UITextView! //코로나 신규확진자
    
    
    
    let locationManager = CLLocationManager()
    
    var Manager = APIManager() // getData(지역)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            let leftSwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:))) //왼쪽으로 넘기면(<-)
            let rightSwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))//오른쪽으로 넘기면(->)
                
            leftSwipeGestureRecognizer.direction = .left //방향 왼쪽
            rightSwipeGestureRecognizer.direction = .right //방향 오른쪽

            view.addGestureRecognizer(leftSwipeGestureRecognizer) //화면인식
            view.addGestureRecognizer(rightSwipeGestureRecognizer)//화면인식

        

        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest //정확도를 최고조로 설정
        locationManager.requestWhenInUseAuthorization() //위치데이터를 추적하기 위해 사용자에게 승인을 요구
        locationManager.startUpdatingLocation()//위치 업데이트 시작
        area_Map.showsUserLocation = true // 위치 값 보기를 true로 설정
        
    }
    
   
    @objc func handleSwipes(_ sender:UISwipeGestureRecognizer) {
        if sender.direction == .left { //왼쪽으로 하면
            tabBarController?.selectedIndex = 1 //index1 보여주기
                    
          }
    } //손으로 tab bar 넘기기


    
    func goLocation(latitudeValue: CLLocationDegrees, longitudeValue: CLLocationDegrees, delta span: Double) // 입력파라미터: 위도 값, 경도 값, 범위
    {
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longitudeValue) // 위경도를 매개변수로 하여 2DMake 함수를 호출하고, 리턴 값을 pLocation으로 받는다
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span) //범위 값을 매개변수로 하여 spanValue로 받는다
        let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue) //Plocation과 spanvalue를 매개변수로 하여 리턴 값을 pRegion으로 받는다.
        area_Map.setRegion(pRegion, animated: true) //pRegion 값을 매개변수로 하여 mymap.setregion 함수를 호출
    }
    
   
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let pLocation = locations.last // 위치가 업데이트되면 먼저 마지막 위치 값을 찾아냅니다.
        goLocation(latitudeValue: (pLocation?.coordinate.latitude)!, longitudeValue: (pLocation?.coordinate.longitude)!, delta: 0.01) //마지막 위치의 위도 경도 값을 가지고 앞에서 만든 golpcation 함수를 호출, 이때 delta 값은 지도의 크기를 정함. 1의 값보다 지도를 100배 확대해서 보여줌.

        CLGeocoder().reverseGeocodeLocation(pLocation!, completionHandler: { //위도 경도를 가지고 역으로 주소 찾기
            (placemarks, error)-> Void in
            let pm = placemarks!.first // 첫 부분만 pm상수 대입
            let country = pm!.country  // 나라 값을 대입
            var address:String = country! // address에 country 값 대입
            
//                    if let locations = locations.first{
//            
//                        var num1Text: String = "" //위도 경도 값 넣을 변수 추가
//                         num1Text = "위도:\(locations.coordinate.latitude)\n경도:\(locations.coordinate.longitude)" //값 넣기
//                        self.Locationla.text = num1Text //text에 출력
//            
//                                }
            
            
            
            if pm!.administrativeArea != nil{ //pm상수에 지역 존재시, address문자열에 추가
                address += ""
                address += pm!.administrativeArea!
                let endldx:String.Index = address.index(address.startIndex,offsetBy:4) //address 맨 앞 대한민국 자름(string 자르기 사용) //https://urbangy.tistory.com/6 (출처 사이트)
                var change_address = String(address[endldx...]) // 자른 것을 저장

//                self.LocationInfo1.text = "<현재위치>" //레이블에 현재위치 텍스트 표시
//
//                self.LocationInfo2.text = "지역:\t\(change_address)"  // address 문자열의 값 표시
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
                        let countryName = Data_ALL(resultjson[change_address]).countryName
                        let newCase = Data_ALL(resultjson[change_address]).newCase
                        let totalCase = Data_ALL(resultjson[change_address]).totalCase
                        let death = Data_ALL(resultjson[change_address]).death

                        self.area_countryName.text = "\(countryName)"
                        self.area_newCase.text = "\(newCase)"
                        self.area_totalCase.text = "\(totalCase)"
                        self.area_death.text = "\(death)"
                        //값을 받아와서 text에 널어주기
                        self.area_countryName.isUserInteractionEnabled = false
                        self.area_newCase.isUserInteractionEnabled = false
                        self.area_totalCase.isUserInteractionEnabled = false
                        self.area_death.isUserInteractionEnabled = false
                        //값 수정 불가능
                    }
                }
                
                
            } //api에서 받아온 값을 label에 넣은 후 화면에 띄워줌

            if pm!.locality != nil{ //pm상수에 지엽 존재시, address문자열에 추가
                address += ""
                address += pm!.locality!
            
            }
            if pm!.thoroughfare  != nil{
                address += ""
                address += pm!.thoroughfare! // pm상수에 도로값이 존재하면 address문자열에 추가
            }
//            self.LocationInfo3.text = ("상세주소:\t\(address)")
            
            
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
    



}

