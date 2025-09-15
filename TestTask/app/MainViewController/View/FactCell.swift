
import UIKit

class FactCell: UITableViewCell {

    static let cellID = String(describing: FactCell.self)
    
    @IBOutlet weak var numberAndFactLabel: UILabel!
    
    func configureView(model: FactModel) {
        numberAndFactLabel.text = model.fact
    }
}
