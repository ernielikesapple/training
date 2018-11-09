import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var helloLabel: UILabel!
    
    var books: [Book] {
        return FetchBookService.shared.fetchAllBooks()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(11122)
    }
    
    public func printHello() -> String? {
        let str = "hello"
        return str
    }
}


