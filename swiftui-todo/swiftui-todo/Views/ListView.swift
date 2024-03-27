//
//  ListView.swift
//  swiftui-todo
//
//  Created by Artem Tebenkov on 27.03.2024.
//

import SwiftUI

struct ListView: View {

   @EnvironmentObject var viewModel: ListViewModel

    var body: some View {
        List {
            ForEach(viewModel.items) { item in
                ListRowView(item: item)
                    .onTapGesture {
                        viewModel.toggleCompletionState(for: item)
                    }
            }
            .onDelete(perform: viewModel.deleteItem)
            .onMove(perform: viewModel.moveItem)
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
    .environmentObject(ListViewModel())
    .tint(.primary)
}


