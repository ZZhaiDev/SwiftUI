//
//  DiscoverModels.swift
//  TravelApp
//
//  Created by Zijia Zhai on 9/18/22.
//

import Foundation

struct Category: Hashable {
    let name, imageName: String
}

struct Destination: Hashable {
    let name, country, imageName: String
}

struct Restaurant: Hashable {
    let name, imageName: String
}

struct User: Hashable {
    let name, imageName: String
}
