//
//  Network.swift
//  PSNProfiles (app)
//
//  Created by Aaron Doe on 07/10/2024.
//

import Foundation
import Network

class Network: ObservableObject {
    let monitor = NWPathMonitor()
    let queue = DispatchQueue(label: "Monitor")
    @Published private(set) var connected: Bool = false
    
    init() {
        _ = checkConnection()
    }
    
    func checkConnection() -> Bool {
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                    self.connected = true
            } else {
                    self.connected = false
            }
        }
        monitor.start(queue: queue) 
        return self.connected
    }
}

