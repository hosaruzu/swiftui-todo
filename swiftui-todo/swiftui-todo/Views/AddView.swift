//
//  AddView.swift
//  swiftui-todo
//
//  Created by Artem Tebenkov on 27.03.2024.
//

import SwiftUI

struct AddView: View {

    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: ListViewModel
    @State var textFieldText: String = ""

    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something here", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(.tertiarySystemBackground))
                    .cornerRadius(10)
                    .autocorrectionDisabled()
                    .onAppear {
                        UITextField.appearance().clearButtonMode = .whileEditing
                    }
                Button {
                    onSaveButtonPress()
                } label: {
                    Text("Save".uppercased())
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(isReadyToSave() ? Color(.label): Color(.systemGray))
                        .cornerRadius(10)
                        .font(.headline)
                        .foregroundStyle(Color(.systemBackground))
                }
                .disabled(!isReadyToSave())
            }
            .padding(.horizontal)
        }
        .navigationTitle("Add new item")
        .background(Color(.systemGroupedBackground))
        .tint(Color(.label))
    }

    func onSaveButtonPress() {
        if isReadyToSave() {
            viewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }

    func isReadyToSave() -> Bool {
        !textFieldText.isEmpty && textFieldText.count >= 3
    }
}

#Preview {
    NavigationView {
        AddView()
    }
    .environmentObject(ListViewModel())
}
