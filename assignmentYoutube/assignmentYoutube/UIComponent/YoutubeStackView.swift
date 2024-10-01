//
//  YoutubeStackView.swift
//  assignmentYoutube
//
//  Created by Roh on 4/10/24.
//

import UIKit

class YoutubeStackView: UIStackView {
    init() {
        super.init(frame: .zero)
        setDefaultStyle()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setDefaultStyle()
    }
    
    private func setDefaultStyle() {
        self.axis = .vertical
        self.distribution = .fillEqually
        self.alignment = .fill
        self.spacing = 17
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
