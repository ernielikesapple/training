import Quick
import Nimble
@testable import doubanExample

class ViewControllerSpec: QuickSpec {
    override func spec() {
        var subject: ViewController!
        
        beforeEach {
            subject = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as? ViewController
            
            _ = subject.view
        }
        
        context("when view is loaded") {
            it("should have 2 books loaded") {
                expect(subject.bookListTableView.numberOfRows(inSection: 0)).to(equal(2))
            }
        }
        
        context("Table View") {
            var cell: BookListTableViewCell!
            
            beforeEach {
                cell = subject.tableView(subject.bookListTableView, cellForRowAt: IndexPath(row: 0, section: 0)) as? BookListTableViewCell
            }
            
            it("should show book title and author") {
                expect(cell.bookTitle?.text).to(equal("BNB 4-5 Science"))
                expect(cell.bookAuthor?.text).to(equal("Frank, Marge; Forte, Imogene;"))
            }
        }
    }
}
