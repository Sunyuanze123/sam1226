import Foundation
import CoreData

extension TodoItem {

    @NSManaged public var id: UUID?
    @NSManaged public var title: String?
    @NSManaged public var isCompleted: Bool
    @NSManaged public var createdAt: Date?

}

extension TodoItem : Identifiable {

}