//
//  QuizCardViewBack.swift
//  FlashcardReview
//
//  Created by C4Q on 2/18/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import SnapKit

class QuizCardViewBack: UIView {
    
    lazy var quizCardLabel: UILabel = {
        let label = UILabel()
        label.text = "Answer"
        label.textAlignment = .center
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
        backgroundColor = .clear
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        self.addSubview(quizCardLabel)
    }
    
    
    private func setupConstraints() {
        quizCardLabel.snp.makeConstraints { (make) in
            make.edges.equalTo(self.safeAreaLayoutGuide.snp.edges)
        }
        
        
    }
}

