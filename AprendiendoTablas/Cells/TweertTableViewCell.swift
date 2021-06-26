//
//  TweertTableViewCell.swift
//  AprendiendoTablas
//
//  Created by Field Employee on 6/25/21.
//

import UIKit

class TweertTableViewCell: UITableViewCell {
    //REFERENCIAS XIB
    @IBOutlet weak var userImageView: UIView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Redondear caja naranja
        userImageView.clipsToBounds = true
            //ancho de frame = ancho
        userImageView.layer.cornerRadius = userImageView.frame.width / 2
        
    }

    func setupCell(username: String, message: String){
        usernameLabel.text = username
        messageLabel.text = message
    }
    

    
}
