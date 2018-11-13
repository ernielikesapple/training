import Quick
import Nimble
@testable import doubanExample

class ViewControllerSpec: QuickSpec {
    override func spec() {
        var subject: ViewController!
        var cell: BookListTableViewCell!
        
        beforeEach {
            subject = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as? ViewController
            _ = subject.view
        }
        
        it("-fetchAllBooks and load the table view") {
                waitUntil(timeout: 5) { done in
                    FetchBookService.shared.fetchAllBooks(searchKeyWords: "编曲", completion: { (result) in
                        subject.books = result
                        
                        expect(subject.bookListTableView.numberOfRows(inSection: 0)).to(equal(20))
                        cell = subject.tableView(subject.bookListTableView, cellForRowAt: IndexPath(row: 0, section: 0)) as? BookListTableViewCell
                        expect(cell.bookTitle?.text).to(equal("现代音乐人编曲手册"))
                        expect(cell.bookAuthor?.text).to(equal("[美] 安德烈·皮耶若罗"))
                        done()
                    })
                }
        }
    }
}
