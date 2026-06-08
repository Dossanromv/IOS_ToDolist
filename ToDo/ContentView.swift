//
//  ContentView.swift
//  ToDo
//
//  Created by Rakhat Dossanbayev on 30.05.2026.
//

import SwiftUI



struct TaskItem: Identifiable {
    let id = UUID()
    var isCompleted: Bool = false
    var title: String
}




struct ContentView: View {
    
    @State private var tasks = ["Купить продукты", "Учить Swift", "Сделать проект"]
    @State private var newTask = ""
    @State private var isEditing = false


    var body: some View {
        
        NavigationView {
            VStack {

                List(tasks, id: \.self) { task in
                    Text(task)
                }
                HStack {
                    TextField("Новая задача", text: $newTask)
                        .onTapGesture {
                            isEditing = true
                        }

                    Button("Добавить") {
                        tasks.append(newTask)
                        newTask = ""
                    } 
                }
                
                
            }
            .navigationTitle("To Do List")
            
        }
    }
}


#Preview {
    ContentView()
}
