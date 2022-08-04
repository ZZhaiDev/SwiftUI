//
//  ContentView.swift
//  ToDoList
//
//  Created by Zijia Zhai on 7/29/22.
//

import SwiftUI

struct ListView: View {
    @State var items: [ItemModel] = [ItemModel(title: "1st title", isCompleted: true), ItemModel(title: "2ed title", isCompleted: false)]
    
    var body: some View {
        List {
            ForEach(items) { item in
                ListRowView(item: item)
            }
        }
        .listStyle(.plain)
        .navigationTitle("Todo List 📝")
        .navigationBarItems(leading: EditButton(),
                            trailing: NavigationLink("Add", destination: AddView()))
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                ListView()
            }
            .previewInterfaceOrientation(.portraitUpsideDown)
        }
    }
}


