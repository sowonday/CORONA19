//
//  Again.swift
//  CORONA19
//
//  Created by 김소원 on 2021/04/29.
//

import Foundation
import Network
 
final class NetMonitor {
    static public let shared = NetMonitor()
    private var monitor: NWPathMonitor
    private var queue = DispatchQueue.global()
    var netOn: Bool = true
    public private(set) var isConnected: Bool = false
    
    
    public private(set) var ConnectionType: ConnnectionType = .unknown
    enum ConnnectionType {
        case wifi
        case cellular
        case ethernet
        case unknown
        
    }
 
    private init() {
        self.monitor = NWPathMonitor()
        self.queue = DispatchQueue.global(qos: .background)
        self.monitor.start(queue: queue)
    }
 
    func startMonitoring() {
        monitor.start(queue: queue)
        monitor.pathUpdateHandler = { [weak self] path in
            self?.isConnected = path.status != .unsatisfied
            self?.getConnectionType(path)
            print(self?.isConnected ?? "N/A")
        }
    }
 
    func stopMonitoring() {
        monitor.cancel()
    }
    
    private func getConnectionType(_ path: NWPath){
        if path.usesInterfaceType(.wifi){
            ConnectionType = .wifi
        }
        else if path.usesInterfaceType(.cellular){
            ConnectionType = .cellular
        }
        else if path.usesInterfaceType(.wiredEthernet){
            ConnectionType = .ethernet
        }
        else{
            ConnectionType = .unknown
        }
    }

}
