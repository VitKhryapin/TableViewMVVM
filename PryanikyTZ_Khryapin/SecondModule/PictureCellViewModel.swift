//
//  PictureCellViewModel.swift
//  PryanikyTZ_Khryapin
//
//  Created by Vitaly Khryapin on 28.05.2022.
//

import Foundation

protocol PictureCellViewModelInputProtocol {
    var url: String { get }
    var name: String? { get }
}

typealias PictureCellViewModelType = AdaptedCellViewModelProtocol & PictureCellViewModelInputProtocol

class PictureCellViewModel: PictureCellViewModelType {
   
    var url: String
    var name: String?
   
    init(url: String, name: String?) {
        self.url = url
        self.name = name
    }
}
