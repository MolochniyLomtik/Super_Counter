//
//  ViewController.swift
//  Super Counter
//
//  Created by Никита Сорокин on 26.03.2024.
//

import UIKit

class ViewController: UIViewController {
    private var value: Int = 0
    
    func currentTime() -> String {
        var getDate = Date()
        var dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        var formatteddate = dateFormatter.string(from: getDate)
        return formatteddate
    }
    
    
    @IBOutlet weak var countValueLabel: UILabel!
    @IBOutlet weak var historyValueTextView: UITextView!
    @IBOutlet weak var increaseValueButton: UIButton!
    @IBOutlet weak var decreaseValueButton: UIButton!
    @IBOutlet weak var resetValueButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        countValueLabel.text = "Значение счётчика: \(value)"
        
        historyValueTextView.text = "История изменений: "
    }
    
    
    
    
    @IBAction func increaseByOne(_ sender: Any) {
        value += 1
        countValueLabel.text = "Значение счётчика: \(value)"
        historyValueTextView.text += "\n\(currentTime()) значение изменено на +1\n"
    }
    
    @IBAction func decreaseByOne(_ sender: Any) {
        if value == 0{
            countValueLabel.text = "Значение счётчика: \(value)"
            historyValueTextView.text += "\n\(currentTime()) попытка уменьшить значение счётчика ниже 0\n"
        } else {
            value -= 1
            countValueLabel.text = "Значение счётчика: \(value)"
            historyValueTextView.text += "\n\(currentTime()) значение изменено на -1\n"
        }
    }
    
    @IBAction func reset(_ sender: Any) {
        value = 0
        countValueLabel.text = "Значение счётчика: \(value)"
        historyValueTextView.text += "\n\(currentTime()) значение сброшено\n"
    }

}

