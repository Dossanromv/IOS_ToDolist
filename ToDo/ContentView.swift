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
    
    @State private var tasks: [TaskItem] = [
            TaskItem(title: "Купить продукты"),
            TaskItem(title: "Учить Swift"),
            TaskItem(title: "Сделать проект"),
            TaskItem(title: "Сделать зарядку")
        ]
    
    
    
    @State private var newTask = ""

    var body: some View {
        
        
        VStack {
            
            NavigationView {
                
                List(tasks) { task in HStack {
                    
                    
                    Button(action: {
                        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
                            tasks[index].isCompleted.toggle()
                        }
                    }) {
                    Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(task.isCompleted ? .green : .gray)
                    .font(.title3)
                                            }
                }
                    
                }
            }
            
        }
        
        HStack {
                        TextField("Новая задача", text: $newTask)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        Button("Добавить") {
                            // Проверяем, что строка не пустая
                            if !newTask.isEmpty {
                                let item = TaskItem(title: newTask)
                                tasks.append(item)
                                newTask = ""
                            }
                        }
                    }
        .padding()
        .navigationTitle("To Do List")
    }
}

#Preview {
    ContentView()
}
