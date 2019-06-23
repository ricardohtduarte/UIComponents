//
//  QuoteTableViewCell.swift
//  SelfSizingCells
//
//  Created by Ricardo Duarte on 23/06/2019.
//  Copyright © 2019 Ricardo Duarte. All rights reserved.
//

import UIKit

class QuoteTableViewCell: UITableViewCell {

    @IBOutlet weak var quote: UILabel!
    @IBOutlet weak var author: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
