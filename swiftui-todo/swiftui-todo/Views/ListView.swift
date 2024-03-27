//
//  ListView.swift
//  swiftui-todo
//
//  Created by Artem Tebenkov on 27.03.2024.
//

import SwiftUI

struct ListView: View {

    @State var items: [String] = [
        "Firts item",
        "Second item",
        "Third item"
    ]

    var body: some View {
        List {
            ForEach(items, id: \.self) { title in
                ListRowView(title: title)
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


