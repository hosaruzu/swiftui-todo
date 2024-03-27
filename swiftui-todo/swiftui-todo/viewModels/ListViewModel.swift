//
//  ListViewModel.swift
//  swiftui-todo
//
//  Created by Artem Tebenkov on 27.03.2024.
//

import Foundation

final class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }

    private var itemsKey: String {
        String(describing: self)
    }

    init() {
        getItems()
    }

    func getItems() {
        guard 
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let decoded = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        items = decoded
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

    func saveItems() {
        guard let encoded = try? JSONEncoder().encode(items) else { return }
        UserDefaults.standard.set(encoded, forKey: itemsKey)
    }
}
