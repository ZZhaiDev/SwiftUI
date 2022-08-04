//
//  AddView.swift
//  ToDoList
//
//  Created by Zijia Zhai on 8/1/22.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    
    @State var showAlert: Bool = false
    @State var alertText: String = ""
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("123", text: $textFieldText, prompt: Text("type here"))
                    .padding(.horizontal)
                    .frame(height: 50)
                    .background(Color.gray)
                    .cornerRadius(10)
                
                Button(action: saveButtonPressed) {
                    Text("Save")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                }

            }.padding(14)
                
        }
        .navigationTitle("Add View ✍️")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func saveButtonPressed() {
        guard textIsOk() else { return }
        listViewModel.addItem(title: textFieldText)
        presentationMode.wrappedValue.dismiss()
    }
    
    func textIsOk() -> Bool {
        if textFieldText.count < 3 {
            alertText = "at least 3"
            showAlert = true
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertText))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}
