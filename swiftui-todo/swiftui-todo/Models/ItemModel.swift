//
//  ItemModel.swift
//  swiftui-todo
//
//  Created by Artem Tebenkov on 27.03.2024.
//

import Foundation

struct ItemModel: Identifiable, Codable {
    let id: String
    let title: String
    let isCompleted: Bool

    init(
        id: String = UUID().uuidString,
        title: String,
        isCompleted: Bool = false
    ) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }

    func toggleCompletion() -> ItemModel {
        ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
