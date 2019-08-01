//
//  DeviceCategoryViewController.swift
//  Bluetooth-New
//
//  Created by Yi Tong on 7/31/19.
//  Copyright © 2019 Yi Tong. All rights reserved.
//

import UIKit

class DeviceCategoryViewController: UITableViewController {
    
    var vm: DeviceCategoryViewModel = DeviceCategoryViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Devices"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CATEGORYCELL")
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.getCategoryCount()
    }
}

// MARK: - Table view delegate
extension DeviceCategoryViewController {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CATEGORYCELL", for: indexPath)
        vm.configure(cell, at: indexPath.row)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

