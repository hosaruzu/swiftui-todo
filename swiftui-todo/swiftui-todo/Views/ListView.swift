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
        ZStack {
            Color(.systemGroupedBackground).ignoresSafeArea()

            if viewModel.items.isEmpty {
                EmptyStateView()
                    .transition(AnyTransition.opacity.animation(.easeInOut))
            } else {
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
            }
        }
        .navigationTitle("Inbox")
        .navigationBarItems(
            trailing:
                NavigationLink(destination: AddView(), label: {
                    Image(systemName: "plus")
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
