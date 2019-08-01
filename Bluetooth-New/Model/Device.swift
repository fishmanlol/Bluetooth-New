//
//  Device.swift
//  Bluetooth-New
//
//  Created by Yi Tong on 7/31/19.
//  Copyright © 2019 Yi Tong. All rights reserved.
//
import UIKit

struct Device {
    let type: DeviceCategoryType
    let name: String
    var image: UIImage?
    let brand: Brand
    
    init(type: DeviceCategoryType, name: String, brand: Brand, image: UIImage? = nil) {
        self.type = type
        self.name = name
        self.image = image ?? UIImage.from(.red)
        self.brand = brand
    }
}
