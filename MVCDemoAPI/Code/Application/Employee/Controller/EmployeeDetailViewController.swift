//
//  EmployeeDetailViewController.swift
//  MVVM DemoAPI
//
//  Created by Jenish Mistry on 25/03/20.
//  Copyright © 2020 Jenish Mistry. All rights reserved.
//

import UIKit

class EmployeeDetailViewController: BaseViewController {
    
    // MARK: - Attributes -
    @IBOutlet weak var lblID: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblSalary: UILabel!
    @IBOutlet weak var lblAge: UILabel!
    
    var modelData: EmployeeResponseData?
    
    // MARK: - Life Cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpView()
    }
    
    // MARK: - Helper Methods -
    func setUpView() {
        self.title = "Employee Detail"
        lblID.text = "Employee ID is : " + (modelData?.id)!
        lblAge.text = "Employee Age is : " + (modelData?.employeeAge)!
        lblName.text = "Employee Name is : " + (modelData?.employeeName)!
        lblSalary.text = "Employee Salary is : " + (modelData?.employeeSalary)!
    }
}
