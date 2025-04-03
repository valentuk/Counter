import UIKit


class ViewController: UIViewController {
    var suranw: String = ""
    private var count: Int = 0
    
    private func date() -> String {
        var realdate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.YYYY" + "|" + "hh:mm:ss"
        var datenow = dateFormatter.string(from: realdate)
        return datenow
    }
    
    @IBOutlet weak private var plusButton: UIButton!
    @IBOutlet weak private var minusButton: UIButton!
    @IBOutlet weak private var isCount: UILabel!
    @IBOutlet weak private var refreshCount: UIButton!
    @IBOutlet weak private var viewHistory: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewHistory.isEditable = false
        isCount.text = "\(count)"
        plusButton.tintColor = .red
        viewHistory.text = "История Изменений: \n"
    }
    
    @IBAction private func didPlusButton(_ sender: Any) {
        count += 1
        isCount.text = "\(count)"
        viewHistory.text += "\(date()): Значение изменено на +1\n"
    }
    
    @IBAction private func didMinusButton(_ sender: Any) {
        if count > 0 {
            count -= 1
            viewHistory.text += "\(date()): Значение изменено на -1\n"
        } else  {
            viewHistory.text += "\(date()): Попытка уменьшить значение счётчика ниже 0\n"
        }
        isCount.text = "\(count)"
        
    }
    
    @IBAction private func isRefreshCount(_ sender: Any) {
        count = 0
        isCount.text = "\(count)"
        viewHistory.text += "\(date()): Значение сброшено\n"
    }
}

