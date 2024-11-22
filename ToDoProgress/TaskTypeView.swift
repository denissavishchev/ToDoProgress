//
//  TaskTypeView.swift
//  ToDoProgress
//
//  Created by Devis on 21/11/2024.
//

import SwiftUI

enum TaskType{
    case todo
    case inProgress
    case done
    
    var Alignment: Alignment{
        switch self {
        case .todo:
            return .leading
        case .inProgress:
            return .center
        case .done:
            return .trailing
        }
    }
    
    var capsuleWidth: CGFloat{
        switch self {
        case .todo:
            return 80
        case .inProgress:
            return 120
        case .done:
            return 80
        }
    }
}

struct TaskTypeView: View {
    
    @Binding var selectedTask: TaskType?
    
    var body: some View {
        VStack{
            HStack{
                TaskTypeButton(title: "ToDo", task: .todo, selectedTask: $selectedTask)
                Spacer()
                TaskTypeButton(title: "In Progress", task: .inProgress, selectedTask: $selectedTask)
                Spacer()
                TaskTypeButton(title: "Done", task: .done, selectedTask: $selectedTask)
            }
            .padding(.horizontal, 19)
            .frame(maxWidth: .infinity)
            .background(
            Capsule()
                .frame(width: selectedTask?.capsuleWidth, height: 55)
                .foregroundStyle(.gray.opacity(0.3))
                .alignmentGuide(.leading){_ in 0}
                .frame(maxWidth: .infinity, alignment: selectedTask?.Alignment ?? .center)
            )
            .animation(.easeInOut(duration: 0.3), value: selectedTask)
        }
    }
}

#Preview {
    TaskTypeView(selectedTask: .constant(.done))
}

struct TaskTypeButton: View {
    
    var title: String
    var task: TaskType
    @Binding var selectedTask: TaskType?
    
    var body: some View {
        Text(title).bold()
            .foregroundStyle(selectedTask == task ? Color.primary : .gray)
            .onTapGesture {
                selectedTask = task
            }
    }
}

