//
//  ItemModel.swift
//  ToDoList
//
//  Created by Zijia Zhai on 8/4/22.
//

import Foundation

struct ItemModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let isCompleted: Bool
}
