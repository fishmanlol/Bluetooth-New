//
//  DeviceCategoryViewModel.swift
//  Bluetooth-New
//
//  Created by Yi Tong on 7/31/19.
//  Copyright © 2019 Yi Tong. All rights reserved.
//

import Foundation
import UIKit

class DeviceCategoryViewModel {
    
    var categories: [DeviceCategory]
    
    init() {
        let oximeter = DeviceCategory(type: .oximeter)
        let thermometer = DeviceCategory(type: .thermometer)
        let bloodPressureMonitor = DeviceCategory(type: .bloodPressureMonitor)
        
        categories = [oximeter, thermometer, bloodPressureMonitor]
    }
    
    func getCategoryCount() -> Int {
        return categories.count
    }
    
    func configure(_ cell: UITableViewCell, at index: Int) {
        cell.accessoryType = .disclosureIndicator
        
        let category = categories[index]
        cell.imageView?.image = category.image
        cell.textLabel?.text = category.name
    }
}
