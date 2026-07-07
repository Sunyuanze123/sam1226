import SwiftUI
import CoreData

struct TodoRowView: View {
    @ObservedRealmObject var todo: TodoItem
    @Environment(\.managedObjectContext) private var viewContext

    var body: some View {
        HStack(spacing: 12) {
            // 复选框
            Button(action: toggleCompletion) {
                Image(systemName: todo.isCompleted ? "checkmark.circle.fill" : "circle")
                    .font(.system(size: 24))
                    .foregroundColor(todo.isCompleted ? .blue : .gray)
                    .contentShape(Circle())
            }
            .buttonStyle(.plain)

            // 标题
            VStack(alignment: .leading, spacing: 4) {
                Text(todo.title ?? "")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.primary)
                    .strikethrough(todo.isCompleted, color: .gray)
                    .opacity(todo.isCompleted ? 0.6 : 1)
            }

            Spacer()
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 12)
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(12)
    }

    private func toggleCompletion() {
        withAnimation {
            todo.isCompleted.toggle()
            try? viewContext.save()
        }
    }
}

struct TodoRowView_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController.preview.container.viewContext
        let sampleTodo = TodoItem(context: context)
        sampleTodo.id = UUID()
        sampleTodo.title = "示例待办事项"
        sampleTodo.isCompleted = false
        sampleTodo.createdAt = Date()

        return TodoRowView(todo: sampleTodo)
            .environment(\.managedObjectContext, context)
            .padding()
    }
}