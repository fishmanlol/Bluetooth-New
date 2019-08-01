//
//  DeviceViewModel.swift
//  Bluetooth-New
//
//  Created by Yi Tong on 7/31/19.
//  Copyright © 2019 Yi Tong. All rights reserved.
//

import UIKit

class DeviceViewModel {
    
    var devices: [(Brand, [Device])]
    
    init(devices: [(Brand, [Device])]) {
        self.devices = devices
    }
    
    func getBrandCount() -> Int {
        return 0
    }
    
    func getDeviceCount(in brand: Brand) -> Int {
        return 0
    }
}
