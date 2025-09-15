import Foundation
import CoreData

protocol CoreDataManagementProtocol {
    func mainContext() -> NSManagedObjectContext
    func saveContext(_ needSave: Bool)
}

extension CoreDataManagementProtocol {

    func mainContext() -> NSManagedObjectContext { ECDManager.context }

    func saveContext(_ needSave: Bool = true) {
        guard needSave else { return }
        ECDManager.saveContextAndWait()
    }
}
