import UIKit




// let dateFormatter = DateFormatter()
// dateFormatter.dateFormat = "DD.HH.YYYY"
// print(dateFormatter.string(from: realDate))

var realDate = Date()
func rdate () {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "DD.HH.YYYY"
    dateFormatter.timeStyle = "hh.mm"
    return print(dateFormatter.string(from: realDate))
}


rdate()
