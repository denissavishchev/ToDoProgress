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
    
    @State var selectedTAsk: TaskType? = .done
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    TaskTypeView()
}
