//
//  ChartViewController.swift
//  Program
//
//  Created by 김소원 on 2021/04/12.
//

import UIKit
import Charts

class ChartViewController: UIViewController {
    
    
    @IBOutlet weak var LineChart: LineChartView! //그래프 만들기
    
    var area : [String]! //x축은 지역
    var newCase : [Int]! //y축은 확진자
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        area = []
        newCase = []
    }
    
    
//    var months: [String]!
//        var unitsSold: [Double]!
//
//        override func viewDidLoad() {
//            super.viewDidLoad()
//
//            months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
//            unitsSold = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0, 4.0, 18.0, 2.0, 4.0, 5.0, 4.0]
//
//            LineChart.noDataText = "데이터가 없습니다."
//            LineChart.noDataFont = .systemFont(ofSize: 20)
//            LineChart.noDataTextColor = .lightGray
//
//            setChart(dataPoints: months, values: unitsSold)
//        }
//
//        func setChart(dataPoints: [String], values: [Double]) {
//
//            // 데이터 생성
//            var dataEntries: [BarChartDataEntry] = []
//            for i in 0..<dataPoints.count {
//                let dataEntry = BarChartDataEntry(x: Double(i), y: values[i])
//                dataEntries.append(dataEntry)
//            }
//
//            let chartDataSet = BarChartDataSet(entries: dataEntries, label: "판매량")
//
//            // 차트 컬러
//            chartDataSet.colors = [.systemBlue]
//
//            // 데이터 삽입
//            let chartData = BarChartData(dataSet: chartDataSet)
//            LineChart.data = chartData
//
//
//            // 선택 안되게
//            chartDataSet.highlightEnabled = false
//            // 줌 안되게
//            LineChart.doubleTapToZoomEnabled = false
//
//
//            // X축 레이블 위치 조정
//            LineChart.xAxis.labelPosition = .bottom
//            // X축 레이블 포맷 지정
//            LineChart.xAxis.valueFormatter = IndexAxisValueFormatter(values: months)
//
//
//            // X축 레이블 갯수 최대로 설정 (이 코드 안쓸 시 Jan Mar May 이런식으로 띄엄띄엄 조금만 나옴)
//            LineChart.xAxis.setLabelCount(dataPoints.count, force: false)
//
//            // 오른쪽 레이블 제거
//            LineChart.rightAxis.enabled = false
//
//            // 기본 애니메이션
//            LineChart.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
//            // 옵션 애니메이션
//            //barChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .easeInBounce)
//
//
//            // 리미트라인
//            let ll = ChartLimitLine(limit: 10.0, label: "타겟")
//            LineChart.leftAxis.addLimitLine(ll)
//
//
//            // 맥시멈
//            LineChart.leftAxis.axisMaximum = 30
//            // 미니멈
//            LineChart.leftAxis.axisMinimum = -10
//
//
//            // 백그라운드컬러
//            LineChart.backgroundColor = .yellow
//
//        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


