//
//  DeviceViewController.swift
//  Bluetooth-New
//
//  Created by Yi Tong on 7/31/19.
//  Copyright © 2019 Yi Tong. All rights reserved.
//

import UIKit

class DeviceViewController: UITableViewController {
    
    let vm: DeviceViewModel
    
    init(devices: [(Brand, [Device])]) {
        vm = DeviceViewModel(devices: devices)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension DeviceViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
//        return vm.getDeviceCount(in: <#T##Brand#>)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return vm.getBrandCount()
    }
}
