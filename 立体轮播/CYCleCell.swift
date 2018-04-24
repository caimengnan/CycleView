//
//  CYCleCell.swift
//  立体轮播
//
//  Created by caimengnan on 2018/4/20.
//  Copyright © 2018年 frameworkdemo. All rights reserved.
//

import UIKit

class CYCleCell: UICollectionViewCell {

    
    @IBOutlet var cycleImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.shadowRadius = 6.0
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 6.0
        layer.shadowOffset = CGSize.zero
        layer.masksToBounds = false
        
    }

}
