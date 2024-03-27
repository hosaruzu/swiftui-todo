//
//  ListViewModel.swift
//  swiftui-todo
//
//  Created by Artem Tebenkov on 27.03.2024.
//

import Foundation

final class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = []

    init() {
//        getItems()
    }

    func getItems() {
        let newItems: [ItemModel] = [
            .init(title: "Order food"),
            .init(title: "Buy pizza")
        ]
        items.append(contentsOf: newItems)
    }

    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }

    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }

    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.insert(newItem, at: 0)
    }

    func toggleCompletionState(for item: ItemModel) {
        guard let index = items.firstIndex(where: { $0.id == item.id }) else { return }
        items[index] = item.toggleCompletion()
    }
}
