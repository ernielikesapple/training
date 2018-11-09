import Quick
import Nimble
@testable import doubanExample

class FetchBookServiceSpec: QuickSpec {
    override func spec() {
       describe("-fetchAllBooks") {
            it("should return correct class type") {
                expect(FetchBookService.shared.fetchAllBooks()).to(beAnInstanceOf([Book].self))
            }
        }
    }
}
