//
//  BannerTableCell.swift
//  Games
//
//  Created by ahmad shiddiq on 15/08/23.
//

import Foundation
import UIKit

final class BannerTableCell: UITableViewCell {
    @IBOutlet weak var bannerImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    internal func setupView(with data: String?) {
        guard let alreadyImageURL = data else { return }
        bannerImageView.loadImageUsingCache(withUrl: alreadyImageURL)
    }
}
