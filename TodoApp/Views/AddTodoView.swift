import SwiftUI

struct AddTodoView: View {
    @Binding var isPresented: Bool
    @Binding var title: String
    var onAdd: (String) -> Void

    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                HStack {
                    Text("新建待办事项")
                        .font(.system(size: 18, weight: .semibold))
                    Spacer()
                    Button("取消") {
                        dismiss()
                    }
                    .foregroundColor(.blue)
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 12)

                Divider()

                VStack(spacing: 16) {
                    TextField("输入待办事项内容", text: $title)
                        .font(.system(size: 16))
                        .padding(.horizontal, 16)
                        .padding(.vertical, 12)
                        .background(Color(UIColor.secondarySystemBackground))
                        .cornerRadius(8)

                    HStack {
                        Spacer()
                        Button(action: {
                            onAdd(title)
                            dismiss()
                        }) {
                            Text("添加")
                                .font(.system(size: 16, weight: .semibold))
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 12)
                                .background(title.trimmingCharacters(in: .whitespaces).isEmpty ? Color.gray.opacity(0.3) : Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                        .disabled(title.trimmingCharacters(in: .whitespaces).isEmpty)
                        Spacer()
                    }
                }
                .padding(.horizontal, 16)
                .padding(.top, 16)

                Spacer()
            }
            .background(Color(UIColor.systemBackground))
        }
        .presentationDetents([.height(200)])
    }
}

#Preview {
    AddTodoView(isPresented: .constant(true), title: .constant("")) { _ in }
}