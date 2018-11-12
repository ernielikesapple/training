import Quick
import Nimble
@testable import doubanExample

class BookSpec: QuickSpec {
    override func spec() {
        var subject: Book!
        var title = String()
        var image = String()
        var author = [String]()
        
        beforeEach {
            title = "title"
            image = "url"
            author = ["author"]
            subject = Book(title: title, image: image, author: author)
        }
        
        describe("-book initializer") {
            it("should set the title") {
                expect(subject.title).to(equal("title"))
            }
            
            it("should set the correct images url") {
                expect(subject.image).to(equal("url"))
            }
            
            it("should set the author") {
                expect(subject.author![0]).to(equal("author"))
            }
        }
    }
}
