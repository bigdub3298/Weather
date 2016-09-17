//
//  WeatherViewController.swift
//  Weather
//
//  Created by Wesley Austin on 9/10/16.
//  Copyright © 2016 Wesley Austin. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet var toolbar: UIToolbar!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        cityLabel.hidden = true
        iconImageView.hidden = true
        descriptionLabel.hidden = true
        tempLabel.hidden = true
        searchTextField.delegate = self
        searchTextField.inputAccessoryView = toolbar
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Text Field Delegate 
    
    func textFieldDidBeginEditing(textField: UITextField) {
        switchToSearchView()
    }
    // MARK: - Actions 
    
    @IBAction func doneButtonTapped(sender: UIBarButtonItem) {
        let searchTerm = searchTextField.text ?? ""
        WeatherController.fetchWeather(searchTerm) { (weather) in
            guard let weather = weather else { return }
            dispatch_async(dispatch_get_main_queue(), { 
                self.cityLabel.text = weather.name
                let temperatureF = round((((weather.main["temp"]! - 273.15) * (9.0/5.0)) + 32.0) * 10) / 10
                self.tempLabel.text = "\(temperatureF) degrees"
                self.descriptionLabel.text = weather.descrption
                self.searchTextField.resignFirstResponder()
                
                WeatherController.imageFromURL(weather.iconString) { (image) in
                    dispatch_async(dispatch_get_main_queue(), { 
                        weather.iconImage = image
                        self.iconImageView.image = image
                        self.switchToWeatherView()
                    })
                    
                }
            })
            
            
        }
    }

    
    // MARK: - Helper Functions
    
    func switchToSearchView() {
        cityLabel.hidden = true
        iconImageView.hidden = true
        descriptionLabel.hidden = true
        tempLabel.hidden = true
        searchTextField.text = ""
    }
    
    func switchToWeatherView() {
        cityLabel.hidden = false
        iconImageView.hidden = false
        descriptionLabel.hidden = false
        tempLabel.hidden = false
    }
}
