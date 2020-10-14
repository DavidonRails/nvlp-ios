//
//  ResultsViewController.swift
//  Test
//
//  Created by Admin on 10/15/20.
//

import UIKit
import Alamofire
import Charts

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var chartView: LineChartView!
    var channels: [ChannelModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getResult()
    }
    
    //GET Channel Data
    func getResult() {
        let url = Constants.GET_DATA
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "X-JWT": GlobalData.TOKEN
        ]
    
        ProgressHud.shared.show(view: view, msg: "")
        AF.streamRequest(URL(string: url)!, headers: headers).responseStream {
            stream in
            ProgressHud.shared.dismiss()
            switch stream.event {
            case let .stream(result):
                switch result {
                case let .success(data):
                    self.parseData(data: data)
                case .failure(let error):
                    self.showAlert(title: "Error", msg: error.localizedDescription)
                }
            case .complete(_):
                print("complete")
                self.showAlert(title: "Error", msg: "Complete")
            }
        }
    }
    
    //Parse Channel Data to JSON Array
    func parseData(data: Data) {
        do {
            // make sure this JSON is in the format we expect
            if let jsonArry = try JSONSerialization.jsonObject(with: data, options: []) as? [Any] {
                self.channels = []
                for json in jsonArry {
                    let channel = ChannelModel(dict: json as! [String: Any])
                    channels.append(channel)
                    showData()
                }
            }
        } catch let error as NSError {
            showAlert(title: "Error", msg: error.localizedDescription)
        }
    }
    
    //Show Graph
    func showData() {
        var lineChartEntry: [ChartDataEntry] = []
        for i in 0..<channels.count {
            let val = ChartDataEntry(x: Double(i), y: Double(channels[i].value))
            lineChartEntry.append(val)
        }
        
        let line = LineChartDataSet(entries: lineChartEntry, label: "Channel")
        let data = LineChartData()
        data.addDataSet(line)
        chartView.data = data
    }
}
