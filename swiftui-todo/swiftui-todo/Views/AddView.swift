//
//  AddView.swift
//  swiftui-todo
//
//  Created by Artem Tebenkov on 27.03.2024.
//

import SwiftUI

struct AddView: View {

    @State var textFieldText: String = ""

    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something here", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(.tertiarySystemBackground))
                    .cornerRadius(10)

                Button {

                } label: {
                    Text("Save".uppercased())
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color(.label))
                        .cornerRadius(10)
                        .font(.headline)
                        .foregroundStyle(Color(.systemBackground))
                }
            }
            .padding(.horizontal)
        }
        .navigationTitle("Add new item")
        .background(Color(.systemGroupedBackground))
        .tint(Color(.label))
    }
}

#Preview {
    NavigationView {
        AddView()
    }
}
