import Alamofire

class FetchBookService {
    public static let shared = FetchBookService()
    public init() {}
}

extension FetchBookService {
    func fetchAllBooks() -> [Book] {
        return [
            Book(title: "A", images: ["A":"A"] , author: ["A"]),
            Book(title: "B", images: ["B":"B"] , author: ["B"])
        ]
    }
}
