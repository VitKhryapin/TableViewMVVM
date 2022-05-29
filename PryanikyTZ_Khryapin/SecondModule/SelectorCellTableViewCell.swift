//
//  SelectorCellTableViewCell.swift
//  PryanikyTZ_Khryapin
//
//  Created by Vitaly Khryapin on 27.05.2022.
//

import UIKit

final class SelectorCellTableViewCell: UITableViewCell, AdaptedCellProtocol {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var switchOutlet: UISwitch!
    
    var viewModel: SelectorCellViewModelType? {
        didSet {
            bindViewModel()
        }
    }
 
    private func bindViewModel() {
        guard let viewModel = viewModel else { return }
        label.text = viewModel.text
        switchOutlet.isOn = viewModel.switchIsOn ?? false
    }
    
    @IBAction func actionSwitch(_ sender: UISwitch) {
        viewModel?.didSelect()
    }
}
