//
//  WeatherViewController.swift
//  Weather
//
//  Created by Wesley Austin on 9/10/16.
//  Copyright © 2016 Wesley Austin. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet var toolbar: UIToolbar!

    override func viewDidLoad() {
        super.viewDidLoad()

        cityLabel.hidden = true
        iconImageView.hidden = true
        descriptionLabel.hidden = true
        searchTextField.inputAccessoryView = toolbar
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func resetButtonTapped(sender: UIButton) {
        switchToSearchView()
    }
    
    @IBAction func doneButtonTapped(sender: UIBarButtonItem) {
        switchToWeatherView()
        searchTextField.resignFirstResponder()
    }

    func switchToSearchView() {
        cityLabel.hidden = true
        iconImageView.hidden = true
        descriptionLabel.hidden = true
    }
    
    func switchToWeatherView() {
        cityLabel.hidden = false
        iconImageView.hidden = false
        descriptionLabel.hidden = false
    }
}
