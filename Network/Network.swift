//
//  Network.swift
//  CORONA19
//
//  Created by 김소원 on 2021/04/27.
//

import Foundation
import Network

public enum ConnectionType {
    case wifi
    case ethernet
    case cellular
    case unknown
}

class NetworkStatus {
    static public let shared = NetworkStatus()
    private var monitor: NWPathMonitor
    private var queue = DispatchQueue.global()
    var isOn: Bool = true
    var connType: ConnectionType = .wifi

    private init() {
        self.monitor = NWPathMonitor()
        self.queue = DispatchQueue.global(qos: .background)
        self.monitor.start(queue: queue)
    }

    func start() {
        self.monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                self.connType = self.checkConnectionTypeForPath(path)
                print("connected")
            }
            else{ path.status == .unsatisfied
            self.connType = self.checkConnectionTypeForPath(path)
            print("unconnected")
            }
        }
    }

    func stop() {
        self.monitor.cancel()
    }

    func checkConnectionTypeForPath(_ path: NWPath) -> ConnectionType {
        if path.usesInterfaceType(.wifi) {
            return .wifi
        } else if path.usesInterfaceType(.wiredEthernet) {
            return .ethernet
        } else if path.usesInterfaceType(.cellular) {
            return .cellular
        }

        return .unknown
    }
}
