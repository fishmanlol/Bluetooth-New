//
//  ViewController.swift
//  Bluetooth-New
//
//  Created by Yi Tong on 7/30/19.
//  Copyright © 2019 Yi Tong. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let tab = TYTabBarController()
        let vc1 = UIViewController()
        vc1.view.backgroundColor = .red
        vc1.title = "VC1"
        
        let vc2 = UIViewController()
        vc2.view.backgroundColor = .blue
        vc2.title = "VC2"
        
        let vc3 = UIViewController()
        vc3.view.backgroundColor = .green
        vc3.title = "VC3"
        tab.viewControllers = [vc1, vc2, vc3]
        
    }
}

