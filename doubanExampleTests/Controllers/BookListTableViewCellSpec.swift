import Quick
import Nimble
@testable import doubanExample

class BookListTableViewCellSpec: QuickSpec {
    override func spec() {
        var subject: BookListTableViewCell?
        beforeEach {
            subject = BookListTableViewCell()
        }
        
        describe("-set label and images") {
            it("should set the bookAuthor") {
                expect(subject).to(beAnInstanceOf(BookListTableViewCell.self))
            }
        }
    }
}
