//
//  ViewData.swift
//  PryanikyTZ_Khryapin
//
//  Created by Vitaly Khryapin on 26.05.2022.
//

import Foundation

struct Object: Codable {
    var data: [DataObjects]
    let view: [String]
}

struct DataObjects: Codable {
    let name: String?
    var data: InternalData?
}

struct InternalData: Codable {
    let text: String?
    let url: String?
    var selectedID: Int?
    let variants: [Variant]?
}

struct Variant: Codable {
    let id: Int
    let text: String
}







