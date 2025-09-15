import UIKit

class MainViewModel: ViewModel {
    
    var view: MainViewControllerProtocol?
    
    var arrayFact = [FactModel]()
    
    // MARK: - Initialization
    init(view: MainViewControllerProtocol) {
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getFactsFromCoreData()
    }
    
    func getFactsFromCoreData() {
        arrayFact = FactDataProvider.shared.getFactList()
        view?.updateTableView()
    }
    
    func getFactByNumber(number: String) {
        Toast.show()
        NetworkManager.getFact(number: number) { [weak self] model in
            Toast.dismiss()
            if let factModel = FactDataProvider.shared.insertFact(fact: model) {
                self?.arrayFact.insert(factModel, at: 0)
                self?.view?.updateTableView()
            }
        } failure: { [weak self] error in
            Toast.dismiss()
            self?.view?.showError(error: error)
        }
    }
    
    func getRandomFact() {
        Toast.show()
        NetworkManager.randomFact() { [weak self] model in
            Toast.dismiss()
            if let factModel = FactDataProvider.shared.insertFact(fact: model) {
                self?.arrayFact.insert(factModel, at: 0)
                self?.view?.updateTableView()
            }
        } failure: { [weak self] error in
            Toast.dismiss()
            self?.view?.showError(error: error)
        }
    }
}
    
