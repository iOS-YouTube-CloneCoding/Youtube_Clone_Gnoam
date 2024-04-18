//
//  UIFont+Extension.swift
//  assignmentYoutube
//
//  Created by Roh on 3/17/24.
//

import UIKit

enum FontWeight {
    case regualr, medium, semiBold, bold
}

extension UIFont {
    class func PretendardR(size: CGFloat) -> UIFont? {
        return UIFont(name: "Pretendard-Regular", size: size)
    }
    
    class func PretendardM(size: CGFloat) -> UIFont? {
        return UIFont(name: "Pretendard-Medium", size: size)
    }
    
    class func PretendardSB(size: CGFloat) -> UIFont? {
        return UIFont(name: "Pretendard-SemiBold", size: size)
    }
    
    class func PretendardB(size: CGFloat) -> UIFont? {
        return UIFont(name: "Pretendard-Bold", size: size)
    }
}
