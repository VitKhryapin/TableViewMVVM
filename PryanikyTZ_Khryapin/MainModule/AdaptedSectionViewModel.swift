//
//  AdaptedSectionViewModel.swift
//  PryanikyTZ_Khryapin
//
//  Created by Vitaly Khryapin on 26.05.2022.
//

import Foundation


class AdaptedSectionViewModel: AdaptedSectionViewModelProtocol {
    
    var cells: [AdaptedCellViewModelProtocol]
   
    init(cells: [AdaptedCellViewModelProtocol]) {
        self.cells = cells
    }
}
