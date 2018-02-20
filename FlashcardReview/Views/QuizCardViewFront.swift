//
//  QuizCardView.swift
//  FlashcardReview
//
//  Created by C4Q on 2/18/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import SnapKit

class QuizCardViewFront: UIView {

    lazy var questionLabel: UILabel = {
       let label = UILabel()
        label.text = "QUESTION"
        label.font = UIFont(name: "Marker Felt", size: 22.0)
//        label.font = UIFont.systemFont(ofSize: 20.0, weight: .regular)
        label.textColor = UIColor(red:1.00, green:0.53, blue:0.58, alpha:1.0)
        label.textAlignment = .center
        label.numberOfLines = 0
//        label.layer.borderWidth = 2
        return label
    }()
    
    
    // setup custom view
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
//        backgroundColor = UIColor.white
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        self.addSubview(questionLabel)
    }

    
    private func setupConstraints() {
        questionLabel.snp.makeConstraints { (make) in
//            make.edges.equalTo(self.safeAreaLayoutGuide.snp.edges)
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(10)
            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom).offset(-10)
            make.leading.equalTo(self.safeAreaLayoutGuide.snp.leading).offset(10)
            make.trailing.equalTo(self.safeAreaLayoutGuide.snp.trailing).offset(-10)
        }
        
        
    }
}
