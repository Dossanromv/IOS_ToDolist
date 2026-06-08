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
                        HStack {
                            
                            
                            Button {
                                withAnimation {
                                    if let index = tasks.firstIndex(where: { $0.id == task.id }) {
                                        tasks[index].isCompleted.toggle()
                                    }
                                }
                            } label: {
                                Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                                    .foregroundColor(task.isCompleted ? .green : .gray)
                            }
                            
                            
                            Text(task.title)
                                .strikethrough(task.isCompleted)
                                .foregroundColor(task.isCompleted ? .gray : .primary)
                            
                            Spacer()
                            
                            //
                            //                            Button {
                            //                                withAnimation {
                            //                                        tasks.removeAll { $0.id == task.id }
                            //                                    }
                            //                            } label: {
                            //                                Image(systemName: "trash")
                            //                                    .foregroundColor(.red)
                            //                            }
                        }
                    }
                }
                
                
                
                
                HStack {
                    TextField("Новая задача", text: $newTask)
                    
                    Button("Добавить") {
                        
                        withAnimation {
                            if !newTask.isEmpty {
                                tasks.append(TaskItem(title: newTask))
                                newTask = ""
                                isEditing = false
                            }
                        }
                    }
                    // Вариант 2 - с иконкой
                    Button() {
                        newTask = ""
                        tasks.removeAll()
                    } label: {
                        
                        Image(systemName: "trash")
                            .foregroundColor(.red)
                            

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
