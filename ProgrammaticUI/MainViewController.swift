//
//  ViewController.swift
//  ProgrammaticUI
//
//  Created by casandra grullon on 1/28/20.
//  Copyright © 2020 casandra grullon. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    private let mainView = MainView()
    
    //if using programmatic ui:: implement and setup the view in loadView()
    
    //loadView is called before viewDidLoad
    //loadView sets up the initial view of the controller
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //system colors are dark mode ready
        view.backgroundColor = .systemBackground
        congifureNavBar()
        
        //add target action for reset button ==> similar to IBAction
        mainView.resetButton.addTarget(self, action: #selector(resetAppColor(_:)), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        updateAppColor()
    }
    
    private func updateAppColor() {
        if let colorName = UserDefaults.standard.object(forKey: AppKey.appColorKey) as? String {
            view.backgroundColor = UIColor(named: colorName)
        }
    }
    
    private func congifureNavBar() {
        // set title of nav bar
        navigationItem.title = "Programmatic UI"
        
        // add a UI bar button item to nav bar
        // #selector takes in an objective-c function (@objc)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .plain, target: self, action: #selector(showSettings(_:)))
    }
    
    @objc
    private func showSettings(_ sender: UIBarButtonItem) {
        // seguing without storyboards does not require us to type cast
        let settingsVC = SettingsViewController()
        // presenting segue
        navigationController?.pushViewController(settingsVC, animated: true)
        //other ways to present a segue!
        //settingsVC.modalPresentationStyle = .overCurrentContext
        //settingsVC.modalTransitionStyle = .flipHorizontal
    }
    
    @objc
    private func resetAppColor(_ sender: UIButton) {
        //print("reset")
    }
    
}

