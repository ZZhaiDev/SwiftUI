//
//  ContentView.swift
//  ToDoList
//
//  Created by Zijia Zhai on 7/29/22.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        List {
            ForEach(listViewModel.items) { item in
                ListRowView(item: item)
                    .onTapGesture {
                        withAnimation {
                            listViewModel.updateItem(item: item)
                        }
                    }
            }
            .onDelete(perform: listViewModel.deleteItem)
            .onMove(perform: listViewModel.moveItem)
        }
        .listStyle(.plain)
        .navigationTitle("Todo List 📝")
        .navigationBarItems(leading: EditButton(),
                            trailing: NavigationLink("Add", destination: AddView()))
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}


