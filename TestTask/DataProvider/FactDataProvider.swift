import Foundation

final class FactDataProvider: CoreDataManagementProtocol {

    static let shared = FactDataProvider()

    private init() {}
    
    private func createNewEntity() -> FactModel? {
        guard let factModel = ECDManager.createObject(type: FactModel.self) else { return nil }
        return factModel
    }

    func insertFact(fact: ResponceModel, shouldSaveContext: Bool = true) -> FactModel? {

        var factDataModel: FactModel?
        
        if let factModel = createNewEntity() {
            factModel.id = UUID().uuidString
            factModel.fact = fact.text
            factModel.number = Double(fact.number)
            saveContext(shouldSaveContext)
            factDataModel = factModel
        }
        return factDataModel
    }

    func getFactList() -> [FactModel] {
        guard let factList = ECDManager.fetchObjects(type: FactModel.self) else { return [FactModel]() }
        return factList
    }

}
