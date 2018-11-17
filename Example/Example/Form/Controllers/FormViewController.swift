//
//  FormViewController.swift
//  Example
//
//  Created by Mei Ma on 18/11/18.
//  Copyright © 2018 meim. All rights reserved.
//

import UIKit

class FormViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    private let tableViewAdapter = FormTableViewAdapter()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.tableFooterView = UIView()
        tableView.registerAdapter(tableViewAdapter)
        tableViewAdapter.populate()
    }

}
