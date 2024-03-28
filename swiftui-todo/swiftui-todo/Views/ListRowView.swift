//
//  ListRowView.swift
//  swiftui-todo
//
//  Created by Artem Tebenkov on 27.03.2024.
//

import SwiftUI

struct ListRowView: View {

    let item: ItemModel

    var body: some View {
        HStack {
            Text(item.title)
                .font(.title3)
                .strikethrough(item.isCompleted)
            Spacer()
        }
        .contentShape(Rectangle())
        .frame(maxWidth: .infinity)
        .padding(.vertical, 8)
    }
}

#Preview {
    ListRowView(item: ItemModel(title: "Hinkali", isCompleted: true))
}
