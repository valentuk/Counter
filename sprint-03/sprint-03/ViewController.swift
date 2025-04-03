//
//  ViewController.swift
//  sprint-03
//
//  Created by  Павел Валентюк on 02.04.2025.
//

import UIKit


class ViewController: UIViewController {
    

    //  Constant
    var count: Int = 0
    
    // Outlet
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var isCount: UILabel!
    @IBOutlet weak var refreshCount: UIButton!
    @IBOutlet weak var viewHistory: UITextView!
    
    
    // Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        viewHistory.isEditable = false
        isCount.text = "\(count)"
        plusButton.tintColor = .red
        viewHistory.text = "История Изменений: \n"
    }

    // Func actions
    
    @IBAction func didPlusButton(_ sender: Any) {
        count += 1
        isCount.text = "\(count)"
        viewHistory.text += "\(date()): Значение изменено на +1\n"
    }
    
    @IBAction func didMinusButton(_ sender: Any) {
        if count > 0 {
            count -= 1
            viewHistory.text += "\(date()): Значение изменено на -1\n"
        } else  {
            viewHistory.text += "\(date()): Попытка уменьшить значение счётчика ниже 0\n"
        }
        isCount.text = "\(count)"
        
    }
    
    @IBAction func isRefreshCount(_ sender: Any) {
        count = 0
        isCount.text = "\(count)"
        viewHistory.text += "\(date()): Значение сброшено\n"
    }
    
    private func date() -> String {
        var realdate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.YYYY" + "|" + "hh:mm:ss"
        var datenow = dateFormatter.string(from: realdate)
        return datenow
    }
    
}

