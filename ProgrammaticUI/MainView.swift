//
//  MainView.swift
//  ProgrammaticUI
//
//  Created by casandra grullon on 1/28/20.
//  Copyright © 2020 casandra grullon. All rights reserved.
//

import UIKit

class MainView: UIView {

    var defaultMessage = "No default color set. Please go to settings"
    //create a label
    public lazy var messageLabel: UILabel = {
        //here we initialized label
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.text = defaultMessage
        return label
    }() //returns label wherever lazy var is called
    
    //create a button
    public lazy var resetButton: UIButton = {
        let button = UIButton()
    }
    
    //1. init(frame:) is called if the view is created proggrammatically
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
        
    }

    //2. required when init(frame:) is called.
    //if the view is initialized from storyboard, this init is called.
    //failable initializer ==> could return nil, object won't be created.
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        setupMessageLabel()
    }
    
    private func setupMessageLabel() {
        //1. add the object (message label) to the main view
        addSubview(messageLabel)
        
        //2. set constraints for the label
        //2a. need to set to false so we can set constraints by using AutoLayout
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //2b. activate takes in an array of constraints
        NSLayoutConstraint.activate([
            // set top anchor constraint 20 points from the safe area
            messageLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            // set padding at leading and trailing edge of MainView
            messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
        
        
        
    }
    
}

