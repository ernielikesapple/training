import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var helloLabel: UILabel!
    @IBOutlet weak var bookListTableView: UITableView!
    
    var books: [Book]? {
        return FetchBookService.shared.fetchAllBooks()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bookListTableView.delegate = self
        self.bookListTableView.dataSource = self
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let number = books?.count {
            return number
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookListTableViewCell", for: indexPath) as! BookListTableViewCell
        cell.book = books?[indexPath.row]
        return cell
    }
}

