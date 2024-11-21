//
//  NewTaskView.swift
//  ToDoProgress
//
//  Created by Devis on 21/11/2024.
//

import SwiftUI

struct NewTaskView: View {
    
    @Binding var text: String
    @State var show = false
    @State var show2 = false
    @Namespace var animation
    @FocusState var isTyping
    @Binding var selectedTask: TaskType?
    
    var onSave: (Task) -> Void
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}
