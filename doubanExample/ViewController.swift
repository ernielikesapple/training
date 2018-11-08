import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var helloLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FetchBookService.shared.fetchAllTaxonomy()
        print(11122)
    }
    
    public func printHello() -> String? {
        let str = "hello"
        return str
    }
}


