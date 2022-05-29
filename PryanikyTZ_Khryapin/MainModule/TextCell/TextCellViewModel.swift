//
//  TextCellViewModel.swift
//  PryanikyTZ_Khryapin
//
//  Created by Vitaly Khryapin on 26.05.2022.
//

import Foundation

protocol TextCellViewModelInputProtocol {
    var text: String? { get }
    var subText: String? { get }
}

typealias TextCellViewModelType = AdaptedCellViewModelProtocol & TextCellViewModelInputProtocol

class TextCellViewModel: TextCellViewModelType {
   
    var text: String?
    var subText: String?
    
    init(text: String?, subText: String?) {
        self.text = text
        self.subText = subText
    }
}

