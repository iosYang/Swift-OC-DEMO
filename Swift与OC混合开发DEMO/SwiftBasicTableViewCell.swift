//
//  SwiftBasicTableViewCell.swift
//  Swift与OC混合开发DEMO
//
//  Created by 杨旗 on 2017/5/30.
//  Copyright © 2017年 杨旗. All rights reserved.
//

import UIKit

typealias TouchBlock = (String) -> ()

class SwiftBasicTableViewCell: UITableViewCell {
    
    var touchBlock:TouchBlock?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func touchClick(_ sender: Any) {
        self.touchBlock!("test")
    }
    
}
