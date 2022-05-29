//
//  SelectorCellViewModel.swift
//  PryanikyTZ_Khryapin
//
//  Created by Vitaly Khryapin on 27.05.2022.
//

import Foundation

protocol SelectorCellViewModelInputProtocol {
    var text: String? { get }
    var switchIsOn: Bool? { get}
}

protocol SelectorCellViewModelOutputProtocol {
    func didSelect()
}

typealias SelectorCellViewModelType = AdaptedCellViewModelProtocol & SelectorCellViewModelInputProtocol & SelectorCellViewModelOutputProtocol

class SelectorCellViewModel: SelectorCellViewModelType {
   
    var text: String?
    var switchIsOn: Bool?
    private let selectionHandler: () -> Void

    init(text: String?, switchIsOn: Bool?, selectionHandler: @escaping () -> Void) {
        self.text = text
        self.switchIsOn = switchIsOn
        self.selectionHandler = selectionHandler
    }
    
    func didSelect() {
        selectionHandler()
    }
}
