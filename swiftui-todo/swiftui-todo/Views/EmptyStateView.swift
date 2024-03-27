//
//  EmptyStateView.swift
//  swiftui-todo
//
//  Created by Artem Tebenkov on 27.03.2024.
//

import SwiftUI

struct EmptyStateView: View {
    var body: some View {
        VStack {
            Image(systemName: "tray")
                .resizable()
                .renderingMode(.template)
                .frame(width: 80, height: 65)
                .foregroundStyle(Color(.tertiaryLabel))
            Text("Add your first task by tap at \"+\"")
                .font(.headline)
                .foregroundStyle(Color(.tertiaryLabel))
        }
    }
}

#Preview {
    EmptyStateView()
}
