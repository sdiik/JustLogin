import Foundation
import UIKit

final class DescriptionTableCell: UITableViewCell {
    @IBOutlet weak var descriptionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    internal func setupView(with data: String?) {
        if let alreadyDescription = data?.description {
            descriptionLabel.text = alreadyDescription
        }
    }
}
