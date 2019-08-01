//
//  DeviceCategory.swift
//  Bluetooth-New
//
//  Created by Yi Tong on 7/31/19.
//  Copyright © 2019 Yi Tong. All rights reserved.
//
import UIKit

struct DeviceCategory {
    let type: DeviceCategoryType
    var devices: [(Brand, [Device])] = []
    var image: UIImage? {
        return type.image
    }
    
    var name: String {
        return type.name
    }
    
    init(type: DeviceCategoryType) {
        self.type = type
        
        appendDevices()
    }
    
    mutating private func appendDevices() {
        
        switch type {
        case .bloodPressureMonitor:
            //Contec
            let bpmCM50 = Device(type: type, name: "Blood Pressure Monitor(CM50)", brand: .contec)
            let bmpCM51 = Device(type: type, name: "Blood Pressure Monitor(CM51)", brand: .contec)
            devices.append((.contec, [bpmCM50, bmpCM51]))
            
            //Other
            let other = Device(type: type, name: "Other Blood Pressure Monitor", brand: .other)
            devices.append((.other, [other]))
        case .oximeter:
            //Contec
            let bpmCM50 = Device(type: type, name: "Oximeter(CM50)", brand: .contec)
            let bmpCM51 = Device(type: type, name: "Oximeter(CM51)", brand: .contec)
            devices.append((.contec, [bpmCM50, bmpCM51]))
            
            //Other
            let other = Device(type: type, name: "Other Oximeter", brand: .other)
            devices.append((.other, [other]))
        case .thermometer:
            //Contec
            let bpmCM50 = Device(type: type, name: "Thermometer(CM50)", brand: .contec)
            let bmpCM51 = Device(type: type, name: "Thermometer(CM51)", brand: .contec)
            devices.append((.contec, [bpmCM50, bmpCM51]))
            
            //Other
            let other = Device(type: type, name: "Other Thermometer", brand: .other)
            devices.append((.other, [other]))
        }
        
        devices.sort { $0.0 < $1.0 }
    }
}

enum DeviceCategoryType {
    case bloodPressureMonitor
    case thermometer
    case oximeter
    
    var name: String {
        switch self {
        case .bloodPressureMonitor:
            return "Blood Pressure Monitor"
        case .oximeter:
            return "Oximeter"
        case .thermometer:
            return "Thermometer"
        }
    }
    
    var image: UIImage? {
        return UIImage.from(.red)
    }
}

enum Brand: Int, CaseIterable, Comparable {
    static func < (lhs: Brand, rhs: Brand) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
    
    case contec
    case other
    
}
