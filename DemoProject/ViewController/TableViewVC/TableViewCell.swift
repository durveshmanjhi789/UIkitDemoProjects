//
//  TableViewCell.swift
//  DemoProject
//
//  Created by clavax on 30/11/22.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    @IBOutlet weak var TitleName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
