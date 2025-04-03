import UIKit


final class ViewController: UIViewController {
    var suranw: String = ""
    private var count: Int = 0
    
    private func formattedDate() -> String {
        let currentDate = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.YYYY" + " | " + "hh:mm:ss"
        return formatter.string(from: currentDate)
        
    }
    
    @IBOutlet weak private var didTapPlus: UIButton!
    @IBOutlet weak private var didTapMinus: UIButton!
    @IBOutlet weak private var counterLabel: UILabel!
    @IBOutlet weak private var resetButton: UIButton!
    @IBOutlet weak private var historyTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        historyTextView.isEditable = false
        counterLabel.text = "\(count)"
        didTapPlus.tintColor = .red
        historyTextView.text = "История Изменений: \n"
    }
    
    private func scrollToBottomOfTextView() {
        let range = NSRange(location: historyTextView.text.count - 1, length: 1)
        historyTextView.scrollRangeToVisible(range)
    }
    
    @IBAction private func didPlusButton(_ sender: Any) {
        count += 1
        counterLabel.text = "\(count)"
        historyTextView.text += "\(formattedDate()): Значение изменено на +1\n"
        scrollToBottomOfTextView()
    }
    
    @IBAction private func didMinusButton(_ sender: Any) {
        if count > 0 {
            count -= 1
            historyTextView.text += "\(formattedDate()): Значение изменено на -1\n"
            scrollToBottomOfTextView()
        } else  {
            historyTextView.text += "\(formattedDate()): Попытка уменьшить значение счётчика ниже 0\n"
            scrollToBottomOfTextView()
        }
        counterLabel.text = "\(count)"
        
    }
    
    @IBAction private func isRefreshCount(_ sender: Any) {
        count = 0
        counterLabel.text = "\(count)"
        historyTextView.text += "\(formattedDate()): Значение сброшено\n"
        scrollToBottomOfTextView()
    }
}

