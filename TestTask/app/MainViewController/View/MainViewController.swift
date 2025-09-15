import UIKit

protocol MainViewControllerProtocol: NSObjectProtocol {
    func showError(error: ApiError)
    func updateTableView()
}

class MainViewController: BaseViewController<MainViewModel> {
    
    @IBOutlet weak var numberTF: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    override var cancelsTouchesInView: Bool { false }
    override var hideKeyboardOnTap: Bool { true }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func getFactAction(_ sender: Any) {
        guard let number = numberTF.text, !number.isEmpty else { return }
        DispatchQueue.main.async {
            self.viewModel.getFactByNumber(number: number)
        }
    }
    
    @IBAction func getRundomFactAction(_ sender: Any) {
        DispatchQueue.main.async {
            self.viewModel.getRandomFact()
        }
    }
    
}

extension MainViewController: MainViewControllerProtocol {
    func updateTableView() {
        numberTF.text = ""
        tableView.reloadData()
    }
    
    func showError(error: ApiError) {
        let alert = UIAlertController(title: error.propertyName, message: error.displayMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        self.present(alert, animated: true)
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.arrayFact.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FactCell.cellID, for: indexPath)
        guard let cell = cell as? FactCell, viewModel.arrayFact.count > indexPath.row else { return cell }
        cell.selectionStyle = .none
        
        let fact = viewModel.arrayFact[indexPath.row]
        cell.configureView(model: fact)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard viewModel.arrayFact.count > indexPath.row else { return }
        let fact = viewModel.arrayFact[indexPath.row]
        let vc = CompositionRoot.resolveDescriptionViewController(factModel: fact)
        Coordinator.push(vc)
    }
}


