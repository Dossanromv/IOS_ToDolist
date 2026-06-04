//
//  ContentView.swift
//  ToDo
//
//  Created by Rakhat Dossanbayev on 30.05.2026.
//

import SwiftUI




struct ContentView: View {
    
    
    @State private var tasks = ["Купить продукты", "Учить Swift", "Сделать проект"]
    
    
    var body: some View {
        
        NavigationView {
                List(tasks, id: \.self) { task in
                    Text(task)
                }
                .navigationTitle("To Do List")
            }

        .padding()
    }
}

#Preview {
    ContentView()
}
