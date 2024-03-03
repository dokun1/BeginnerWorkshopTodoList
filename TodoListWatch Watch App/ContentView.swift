//
//  ContentView.swift
//  TodoListWatch Watch App
//
//  Created by David Okun on 2/27/24.
//

import SwiftUI

struct ContentView: View {
    @State var todos: [String] = [
        "End world hunger",
        "Walk for 30 minutes",
        "Make formula for the baby",
        "Solve the gravity equation",
        "Read for 20 minutes"
    ]
    
    @State var showingAlert = false
    @State var newItem = ""
    
    func addNewItem() {
        todos.append(newItem)
        newItem = ""
        showingAlert = false
    }
    
    var body: some View {
        NavigationStack {
            List($todos, id: \.self, editActions: .all) { $todoItem in
                Text(todoItem)
            }.navigationTitle("My To Do List")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        showingAlert = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }.alert("What do you need to do?", isPresented: $showingAlert) {
            TextField("Add item here", text: $newItem)
            Button {
                addNewItem()
            } label: {
                Text("OK")
            }
        }
    }
}

#Preview {
    ContentView()
}
