import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        FetchBookService.shared.fetchAllTaxonomy()
        print(11122)
    }


}


