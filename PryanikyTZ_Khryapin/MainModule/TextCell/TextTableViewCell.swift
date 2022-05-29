//
//  MainTableViewCell.swift
//  PryanikyTZ_Khryapin
//
//  Created by Vitaly Khryapin on 26.05.2022.
//

import UIKit

final class TextTableViewCell: UITableViewCell, AdaptedCellProtocol {
    
    @IBOutlet private weak var label: UILabel!
    @IBOutlet private weak var subText: UILabel!
    
    var viewModel: TextCellViewModelInputProtocol? {
        didSet {
            bindViewModel()
        }
    }
 
    private func bindViewModel() {
        label.text = viewModel?.text
        subText.text = viewModel?.subText
    }
    
}
