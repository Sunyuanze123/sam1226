import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        entity: TodoItem.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \TodoItem.createdAt, ascending: false)]
    ) private var todos: FetchedResults<TodoItem>

    @State private var showingAddSheet = false
    @State private var newTodoTitle = ""

    var body: some View {
        ZStack {
            // 背景
            Color(UIColor.systemBackground)
                .ignoresSafeArea()

            VStack(spacing: 0) {
                // 导航栏
                HStack {
                    Text("待办事项")
                        .font(.system(size: 34, weight: .bold, design: .default))
                    Spacer()
                    Button(action: { showingAddSheet = true }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 24))
                            .foregroundColor(.blue)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 12)

                if todos.isEmpty {
                    // 空状态
                    VStack(spacing: 16) {
                        Image(systemName: "checkmark.circle.fill")
                            .font(.system(size: 60))
                            .foregroundColor(.gray)
                        Text("没有待办事项")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(.secondary)
                        Text("点击上方 + 按钮添加新任务")
                            .font(.system(size: 14))
                            .foregroundColor(.secondary)
                    }
                    .frame(maxHeight: .infinity)
                    .padding(.horizontal, 20)
                } else {
                    // 列表
                    List {
                        ForEach(todos) { todo in
                            TodoRowView(todo: todo)
                                .listRowInsets(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                                .listRowSeparator(.hidden)
                                .listRowBackground(Color(UIColor.systemBackground))
                        }
                        .onDelete(perform: deleteTodos)
                    }
                    .listStyle(.plain)
                    .scrollContentBackground(.hidden)
                }

                Spacer()
            }
        }
        .sheet(isPresented: $showingAddSheet) {
            AddTodoView(isPresented: $showingAddSheet, title: $newTodoTitle) { title in
                addTodo(title: title)
            }
        }
    }

    private func addTodo(title: String) {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else { return }

        let newTodo = TodoItem(context: viewContext)
        newTodo.id = UUID()
        newTodo.title = title
        newTodo.isCompleted = false
        newTodo.createdAt = Date()

        do {
            try viewContext.save()
            newTodoTitle = ""
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }

    private func deleteTodos(offsets: IndexSet) {
        withAnimation {
            offsets.map { todos[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

#Preview {
    ContentView()
        .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}