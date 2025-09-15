
import UIKit

protocol DescriptionViewProtocol: NSObjectProtocol {
    func showError(error: ApiError)
}

class DescriptionViewController: BaseViewController<DescriptionViewModel> {
    
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberLabel.text = "\(viewModel.factModel.number)"
        descriptionLabel.text = viewModel.factModel.fact
    }
    
    @IBAction func backAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

extension DescriptionViewController: DescriptionViewProtocol {
    func showError(error: ApiError) {
        let alert = UIAlertController(title: error.propertyName, message: error.displayMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        self.present(alert, animated: true)
    }
}
