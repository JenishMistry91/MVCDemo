//
//  ViewController.swift
//  MVCDemoAPI
//
//  Created by Jenish Mistry on 30/06/20.
//  Copyright © 2020 Jenish Mistry. All rights reserved.
//

import UIKit

class ViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // MARK: - UIButton Action methods -
    @IBAction func btnGetAllEmployeeClicked(_ sender: Any) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: StoryboardIdentifier.AllEmployeeVC.rawValue) as? AllEmployeeViewController
        self.navigationController?.pushViewController(controller!, animated: true)
    }
    
}

