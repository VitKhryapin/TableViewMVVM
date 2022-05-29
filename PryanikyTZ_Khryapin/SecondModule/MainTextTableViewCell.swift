//
//  MainTextTableViewCell.swift
//  PryanikyTZ_Khryapin
//
//  Created by Vitaly Khryapin on 27.05.2022.
//

import UIKit

final class MainTextTableViewCell: UITableViewCell, AdaptedCellProtocol {
    @IBOutlet private weak var label: UILabel!
    
    var viewModel: MainTextCellViewModelInputProtocol? {
        didSet {
            bindViewModel()
        }
    }
 
    private func bindViewModel() {
        label.text = viewModel?.text
    }
    
}
