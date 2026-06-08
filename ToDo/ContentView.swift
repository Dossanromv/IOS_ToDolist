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
    
    @State private var tasks = [
        TaskItem(title: "Купить продукты"),
        TaskItem(title: "Учить Swift"),
        TaskItem(title: "Сделать проект")
    ]
    
    
    @State private var newTask = ""
    @State private var isEditing = false
    @FocusState private var isFocused: Bool



    var body: some View {
        
        NavigationView {
            VStack {

                List{
                    ForEach(tasks) { task in
                        Text(task.title)
                    }
                    .onDelete { indexSet in
                        tasks.remove(atOffsets: indexSet)
                    }
                }

                
                
                
                HStack {
                    TextField("Новая задача", text: $newTask)
        

                    Button("Добавить") {
                        if !newTask.isEmpty {
                            
                            
                            tasks.append(TaskItem(title: newTask))
                            newTask = ""
                            isEditing = false
                        }
                    }
                }
                .padding()
                

                }
                
                
            }
            .navigationTitle("To Do List")
            
        }
    }



#Preview {
    ContentView()
}
