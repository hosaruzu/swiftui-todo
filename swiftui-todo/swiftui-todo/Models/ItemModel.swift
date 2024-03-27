//
//  ItemModel.swift
//  swiftui-todo
//
//  Created by Artem Tebenkov on 27.03.2024.
//

import Foundation

struct ItemModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let isCompleted: Bool
}
