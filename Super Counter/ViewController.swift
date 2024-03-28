//
//  ViewController.swift
//  Super Counter
//
//  Created by Никита Сорокин on 26.03.2024.
//
import UIKit

final class ViewController: UIViewController {
    private var value: Int = 0
    
    private var dateFormatter: DateFormatter = DateFormatter()
    
    @IBOutlet weak private var countValueLabel: UILabel!
    @IBOutlet weak private var historyValueTextView: UITextView!
    @IBOutlet weak private var increaseValueButton: UIButton!
    @IBOutlet weak private var decreaseValueButton: UIButton!
    @IBOutlet weak private var resetValueButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countValueLabel.text = currentValue()
        
        historyValueTextView.text = "История изменений: "
    }
    
    private func currentTime() -> String {
        let getDate = Date()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        let formatteddate = dateFormatter.string(from: getDate)
        return formatteddate
    }
    
    private func currentValue() -> String {
        return "Значение счётчика: \(value)"
    }
    
    private func addToHistory(message: String) {
        historyValueTextView.text += "\n\(currentTime()): \(message)\n"
    }
    
    @IBAction private func increaseByOne(_ sender: Any) {
        value += 1
        countValueLabel.text = currentValue()
        addToHistory(message: "значение увеличено на +1")
    }
    
    @IBAction private func decreaseByOne(_ sender: Any) {
        if value == 0{
            countValueLabel.text = currentValue()
            addToHistory(message: "попытка уменьшить значение счётчика ниже 0")
        } else {
            value -= 1
            countValueLabel.text = currentValue()
            addToHistory(message: "значение уменьшено на -1")
        }
    }
    
    @IBAction private func reset(_ sender: Any) {
        value = 0
        countValueLabel.text = currentValue()
        addToHistory(message: "значение сброшено")
    }
}
