
import Foundation

class DescriptionViewModel: ViewModel {
    
    var view: DescriptionViewProtocol?
    var factModel: FactModel
    
    init(view: DescriptionViewProtocol, factModel: FactModel) {
        self.view = view
        self.factModel = factModel
    }
}
