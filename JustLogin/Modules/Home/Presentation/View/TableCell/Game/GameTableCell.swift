import Foundation
import UIKit

final class GameTableCell: UITableViewCell {
    @IBOutlet weak var gameImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    var gameItem: GameItemDataModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    internal func setupView(with data: GameItemDataModel?) {
        gameItem = data
        setTitle()
        setReleased()
        setRating()
        loadImageGame()
    }
    
    private func setTitle() {
        titleLabel.text = gameItem?.title ?? ""
    }
    
    private func setReleased() {
        descriptionLabel.text = gameItem?.content ?? ""
    }
    
    private func setRating() {
        ratingLabel.text = gameItem?.publishedAt ?? ""
    }
    
    private func loadImageGame() {
        guard let alreadyImageURL = gameItem?.image else { return }
        gameImageView.loadImageUsingCache(withUrl: alreadyImageURL)
    }
    
}
