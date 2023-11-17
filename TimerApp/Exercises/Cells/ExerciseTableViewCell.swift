//
//  ExerciseTableViewCell.swift
//  TimerApp
//
//  Created by Makar Grushka on 09.11.2023.
//

import UIKit

class ExerciseTableViewCell: UITableViewCell {

    @IBOutlet weak var restTime: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var exerciseTime: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
