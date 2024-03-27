//
//  ListView.swift
//  swiftui-todo
//
//  Created by Artem Tebenkov on 27.03.2024.
//

import SwiftUI

struct ListView: View {

    @State var items: [ItemModel] = [
        .init(title: "Order food", isCompleted: true),
        .init(title: "Buy pizza", isCompleted: false)
    ]

    var body: some View {
        List {
            ForEach(items) { item in
                ListRowView(item: item)
            }

        }
        .navigationTitle("Inbox")
        .navigationBarItems(
            leading: EditButton(),
            trailing:
                NavigationLink("Add", destination: {
                    AddView()
                })
        )
        .tint(Color(.label))
    }
}

#Preview {
    NavigationView {
        ListView()
    }
    .tint(.primary)
}


