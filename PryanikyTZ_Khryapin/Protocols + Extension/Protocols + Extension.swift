//
//  Extension.swift
//  PryanikyTZ_Khryapin
//
//  Created by Vitaly Khryapin on 26.05.2022.
//

import UIKit

//MARK: - MainView

protocol MainViewProtocol: AnyObject {
    func success(isHidden: Bool, isActive: Bool)
    func failer(error: Error)
}

extension MainViewController: MainViewProtocol {
    
    func success(isHidden: Bool, isActive: Bool ) {
        backButtonOutlet.isHidden = isHidden
        tableView.allowsSelection = isActive
        tableView.reloadData()
    }
    
    func failer(error: Error) {
        print(error)
    }
}

//MARK: - AdaptedTable

protocol AdaptedCellViewModelProtocol {
}
protocol AdaptedSectionHeaderViewModelProtocol { }

protocol AdaptedSectionViewModelProtocol {
    var cells: [AdaptedCellViewModelProtocol] { get }
}

protocol AdaptedViewModelInputProtocol {
    var sections: [AdaptedSectionViewModelProtocol] { get }
    var data: [DataObjects] { get }
    var viewList: [String] { get }
    func updateMainSection (indexPath: IndexPath)
    func goToTheBack()
}

protocol AdaptedViewModelOutputProtocol {
    func didSelectRowAt(tableView: UITableView, indexPath: IndexPath)
}

extension AdaptedViewModelOutputProtocol {
    func didSelectRowAt(tableView: UITableView, indexPath: IndexPath) {
        
    }
}

typealias AdaptedSectionViewModelType = AdaptedViewModelInputProtocol & AdaptedViewModelOutputProtocol

protocol AdaptedCellProtocol {
    static var identifier: String { get }
    static var nib: UINib { get }
    static func register(_ tableView: UITableView)
    static func reuse(_ tableView: UITableView, for indexPath: IndexPath) -> Self
}

extension AdaptedCellProtocol {
    
    static var identifier: String {
        String(describing: self)
    }
    
    static var nib: UINib {
        UINib(nibName: identifier, bundle: nil)
    }
    
    static func register(_ tableView: UITableView) {
        tableView.register(nib, forCellReuseIdentifier: identifier)
    }
    
    static func reuse(_ tableView: UITableView, for indexPath: IndexPath) -> Self {
        tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! Self
    }
    
}

protocol AdaptedCellFactoryProtocol {
    var cellTypes: [AdaptedCellProtocol.Type] { get }
    func generateCell(viewModel: AdaptedCellViewModelProtocol, tableView: UITableView, for indexPath: IndexPath) -> UITableViewCell
}


