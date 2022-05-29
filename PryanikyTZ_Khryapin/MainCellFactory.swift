//
//  MainCellFactory.swift
//  PryanikyTZ_Khryapin
//
//  Created by Vitaly Khryapin on 26.05.2022.
//

import UIKit

struct MainCellFactory: AdaptedCellFactoryProtocol {
    
    var cellTypes: [AdaptedCellProtocol.Type] = [
        MainTextTableViewCell.self,
        TextTableViewCell.self,
        SelectorCellTableViewCell.self,
        PictureTableViewCell.self
    ]
    
    func generateCell(viewModel: AdaptedCellViewModelProtocol, tableView: UITableView, for indexPath: IndexPath) -> UITableViewCell {
        switch viewModel {
        case let viewModel as TextCellViewModelType:
            let view = TextTableViewCell.reuse(tableView, for: indexPath)
            view.viewModel = viewModel
            return view
        case let viewModel as MainTextCellViewModelType:
            let view = MainTextTableViewCell.reuse(tableView, for: indexPath)
            view.viewModel = viewModel
            return view
        case let viewModel as SelectorCellViewModelType:
            let view = SelectorCellTableViewCell.reuse(tableView, for: indexPath)
            view.viewModel = viewModel
            return view
        case let viewModel as PictureCellViewModelType:
            let view = PictureTableViewCell.reuse(tableView, for: indexPath)
            view.viewModel = viewModel
            return view
        default:
            return UITableViewCell()
        }
    }
    
}
