//
//  SettingsViewController.swift
//  ProgrammaticUI
//
//  Created by casandra grullon on 1/28/20.
//  Copyright © 2020 casandra grullon. All rights reserved.
//

import UIKit

struct AppKey {
    static let appColorKey = "app color"
}

class SettingsViewController: UIViewController {

    private let settingsView = SettingsView()
    
    //data for picker view
    private let colors = ["Red", "Green", "Orange", "Yellow", "Blue", "Pink", "White", "Purple"]
    
    override func loadView() {
        view = settingsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let colorName = colors[0]
        view.backgroundColor = UIColor(named: colorName)
        
        //configure delegate and datasource of pickerView
        settingsView.pickerView.delegate = self
        settingsView.pickerView.dataSource = self
    }


}

extension SettingsViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return colors.count
    }
}

extension SettingsViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return colors[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //called every time the picker selection is changed
        let colorName = colors[row]
        view.backgroundColor = UIColor(named: colorName)
        
        //save colorName to User Defaults
        UserDefaults.standard.set(colorName, forKey: AppKey.appColorKey)
    }
}
