import Quick
import Nimble
@testable import doubanExample

class ViewControllerSpec: QuickSpec {
    override func spec() {
        var vc: ViewController!
        beforeEach {
            vc = ViewController()
        }
    
        describe("-printLabelText") {
            it("should return correct label text") {
                expect(vc.printHello()).to(equal("hello"))
            }
        }
    }
}
