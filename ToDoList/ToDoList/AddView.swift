//
//  AddView.swift
//  ToDoList
//
//  Created by Zijia Zhai on 8/1/22.
//

import SwiftUI

struct AddView: View {
    @State var textFieldText: String = ""
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("123", text: $textFieldText, prompt: Text("type here"))
                    .padding(.horizontal)
                    .frame(height: 50)
                    .background(Color.gray)
                    .cornerRadius(10)
                Button {
                    
                } label: {
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
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
    }
}
