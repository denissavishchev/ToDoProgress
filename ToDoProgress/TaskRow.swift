//
//  TaskRow.swift
//  ToDoProgress
//
//  Created by Devis on 21/11/2024.
//

import SwiftUI

struct TaskRow: View {
    
    @Binding var task: Task
    @State private var tapCount = 0
    @State private var tapTimer: Timer?
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

