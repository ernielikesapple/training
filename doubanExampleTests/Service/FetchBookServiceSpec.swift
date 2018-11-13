import Quick
import Nimble
@testable import doubanExample

class FetchBookServiceSpec: QuickSpec {
    override func spec() {
        var books: [Book]?
        
        describe("-fetchAllBooks") {
            it("should return correct book title") {
                waitUntil(timeout: 2) { done in
                    FetchBookService.shared.fetchAllBooks(searchKeyWords: "编曲", completion: { (result) in
                        books = result
                        expect(books?[0].title).to(equal("现代音乐人编曲手册"))
                        done()
                    })
                }
            }
        }
    }
}
