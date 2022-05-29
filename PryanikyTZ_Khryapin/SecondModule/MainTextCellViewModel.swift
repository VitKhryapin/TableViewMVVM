//
//  MainTextCellViewModel.swift
//  PryanikyTZ_Khryapin
//
//  Created by Vitaly Khryapin on 27.05.2022.
//


import Foundation

protocol MainTextCellViewModelInputProtocol {
    var text: String { get }
}

typealias MainTextCellViewModelType = AdaptedCellViewModelProtocol & MainTextCellViewModelInputProtocol

class MainTextCellViewModel: MainTextCellViewModelType {
    var text: String
    
    init(text: String) {
        self.text = text
    }
}
