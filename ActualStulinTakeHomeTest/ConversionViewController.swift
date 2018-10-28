//
//  ConversionViewController.swift
//  ActualStulinTakeHomeTest
//
//  Created by ws on 10/27/18.
//  Copyright © 2018 ws. All rights reserved.
//

import UIKit
class ConversionViewController: UIViewController {
    @IBOutlet weak var fahrenheitLabel: UILabel!
    @IBOutlet weak var celsiusLabel: UILabel!
    @IBOutlet weak var kelvinLabel: UILabel!
    @IBOutlet weak var temperatureSlider: UISlider!
    var unit:Measurement<UnitTemperature>{
        let fahrenheitValue = Measurement<UnitTemperature>(value: Double(temperatureSlider.value), unit: UnitTemperature.celsius)
        return fahrenheitValue
    }
    func updateTemperature(){
        celsiusLabel.text = unit.description
        fahrenheitLabel.text = unit.converted(to: .fahrenheit).description
        kelvinLabel.text = unit.converted(to: .kelvin).description
    }
    
    @IBAction func sliderValue(_ sender: Any){
        updateTemperature()
    }
    
    override func viewDidLoad(){
        updateTemperature()
        super.viewDidLoad()
    }
    
}
