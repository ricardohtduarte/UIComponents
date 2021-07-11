//
//  ImageCell.swift
//  ParallaxEffect
//
//  Created by Ricardo Duarte on 25/06/2021.
//

import UIKit

class ImageCell: UITableViewCell {

    @IBOutlet weak var landscapeImage: UIImageView!
    @IBOutlet weak var landscapeHeight: NSLayoutConstraint!
    @IBOutlet weak var landscapeImageTopConstraint: NSLayoutConstraint!

    override func awakeFromNib() {
        super.awakeFromNib()
        landscapeImage.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(with name: String) {
        landscapeImage.image = UIImage(named: name)
        landscapeImage.contentMode = .scaleToFill
    }
}
