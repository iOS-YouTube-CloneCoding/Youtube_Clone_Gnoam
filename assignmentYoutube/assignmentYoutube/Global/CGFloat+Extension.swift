//
//  CGFloat+Extension.swift
//  assignmentYoutube
//
//  Created by Roh on 3/17/24.
//

import UIKit

extension CGFloat {
    var adjusted: CGFloat {
        let ratio: CGFloat = UIScreen.main.bounds.width / 375
        return self * ratio
    }
    
    var adjustedH: CGFloat {
        if UIScreen.main.bounds.height < 812 {
            return self
        } else {
            let ratio: CGFloat = UIScreen.main.bounds.height / 812
            return self * ratio
        }
    }
}
