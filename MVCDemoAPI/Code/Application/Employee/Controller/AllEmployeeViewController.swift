//
//  AllEmployeeViewController.swift
//  MVCDemoAPI
//
//  Created by Jenish Mistry on 01/07/20.
//  Copyright © 2020 Jenish Mistry. All rights reserved.
//

import UIKit

class AllEmployeeViewController: BaseViewController {

    // MARK: - Attributes -
    @IBOutlet weak var tblView: UITableView!
    var responseData = [EmployeeResponseData]()
    var empRepoObject = EmployeeRepository()
    
    // MARK: - Life Cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.employeeList()
    }
    
    // MARK: - Helper Methods -
    func setUpView() {
        self.title = "All Employee List"
        navigationItem.hidesBackButton = true
        self.tblView.dataSource = self
        self.tblView.delegate = self
        self.tblView.register(UINib.init(nibName: EmplpyeeTableCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: EmplpyeeTableCell.reuseIdentifier)
    }
    func reloadTableData() {
        DispatchQueue.main.async {
            self.tblView.reloadData()
        }
    }
    // MARK: - UIButton Action Methods -
    
    // MARK: - API Calling -
    func employeeList() {
        self.showHUDProcessView()
        self.empRepoObject.getAllEmployee { (status, response, message) in
            self.hideHUDProcessView()
            if !status {
                self.showToast(message: message, status: .error)
            } else {
                if (response?.data?.count)! > 0 {
                    self.responseData = (response?.data)!
                    self.reloadTableData()
                }
            }
        }
    }

}

// MARK: - UITableView Datat Source -
extension AllEmployeeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.responseData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EmplpyeeTableCell.reuseIdentifier) as? EmplpyeeTableCell
        if (self.responseData.count) > 0 {
            cell?.setData(data: self.responseData[indexPath.row])
        }
        return cell!
    }
}
// MARK: - UITableView Delegate -
extension AllEmployeeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: StoryboardIdentifier.EmployeeDetailVC.rawValue) as? EmployeeDetailViewController
        controller?.modelData = self.responseData[indexPath.row]
        self.navigationController?.pushViewController(controller!, animated: true)
    }
}
