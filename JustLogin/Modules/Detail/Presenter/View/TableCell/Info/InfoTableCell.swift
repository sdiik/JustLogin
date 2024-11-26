//
//  InfoTableCell.swift
//  Games
//
//  Created by ahmad shiddiq on 15/08/23.
//

import Foundation
import UIKit

final class InfoTableCell: UITableViewCell {
    @IBOutlet weak var genreGameLabel: UILabel!
    @IBOutlet weak var titleGameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    internal func setTitle(with data: String?) {
        genreGameLabel.text = data ?? ""
    }
    
    internal func setPublisher(with data: String?) {
        titleGameLabel.text = data ?? ""
    }
    
    
    
}
