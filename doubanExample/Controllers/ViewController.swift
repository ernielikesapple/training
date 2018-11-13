import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var helloLabel: UILabel!
    @IBOutlet weak var bookListTableView: UITableView!
    
    var books: [Book]? {
        didSet {
            bookListTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bookListTableView.delegate = self
        self.bookListTableView.dataSource = self
        
        FetchBookService.shared.fetchAllBooks(searchKeyWords: "编曲", completion: { (result) in
            self.books =  result
        })
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

