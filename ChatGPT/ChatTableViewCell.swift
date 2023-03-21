//
//  ChatTableViewCell.swift
//  ChatGPT
//
//  Created by Sharonda Daniels on 3/8/23.
//

import UIKit

class ChatTableViewCell: UITableViewCell {

    @IBOutlet weak var senderName: UILabel!
    @IBOutlet weak var senderImage: UIImageView!
    @IBOutlet weak var senderMessage: UITextView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func alignToLeft() {
        senderMessage.textAlignment = .left
    }
    
    func alignToRight() {
        senderMessage.textAlignment = .right
    }
       
    
}
