//
//  BaseData.swift
//  MarvelComicsAPI
//
//  Created by Renan Diniz on 24/02/20.
//  Copyright © 2020 RMD Goup. All rights reserved.
//

import Foundation

class BaseData: Decodable {
    let offset: Int?
    let limit: Int?
    let total: Int?
    let count: Int?
    let results: [Character]?
}

enum CodingKeys: String, CodingKey {
    case offset
    case limit
    case total
    case count
    case results
}
