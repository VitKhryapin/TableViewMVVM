//
//  MainViewController.swift
//  PryanikyTZ_Khryapin
//
//  Created by Vitaly Khryapin on 26.05.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: AdaptedTableView! {
        didSet {
            tableView.viewModel = MainViewModel(mainView: self)
            tableView.cellFactory = MainCellFactory()
            tableView.setup()
            tableView.tableFooterView = UIView()
        }
    }
    
    @IBOutlet weak var backButtonOutlet: UIButton! {
        didSet {
            backButtonOutlet.layer.cornerRadius = 15
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func backButtonAction(_ sender: UIButton) {
        tableView.viewModel?.goToTheBack()
    }
}


