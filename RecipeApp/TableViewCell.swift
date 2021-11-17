//
//  TableViewCell.swift
//  RecipeApp
//
//  Created by Lau on 16/11/2021.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet var foodLabel:UILabel!
    @IBOutlet weak var foodImg: UIImageView!
    
    static let cellIndentifier = "TableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code 
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "TableViewCell", bundle: nil)
    }
    
    public func configure(with viewModel: CellViewModel){
        foodLabel.text = "\(viewModel.recipeName)"
    }
    
}
