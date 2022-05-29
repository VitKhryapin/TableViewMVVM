//
//  PictureTableViewCell.swift
//  PryanikyTZ_Khryapin
//
//  Created by Vitaly Khryapin on 28.05.2022.
//

import UIKit
import SDWebImage

final class PictureTableViewCell: UITableViewCell, AdaptedCellProtocol {
    
    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var viewModel: PictureCellViewModelInputProtocol? {
        didSet {
            bindViewModel()
        }
    }
 
    private func bindViewModel() {
        guard let imageUrl = viewModel?.url else { return }
        let url = URL(string: imageUrl) 
        picture.sd_setImage(with: url, completed: nil)
        self.nameLabel.text = viewModel?.name
    }
}
