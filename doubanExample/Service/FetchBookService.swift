import Alamofire

// api:

class FetchBookService {
    public static let shared = FetchBookService()
    public init() {}
}

extension FetchBookService {
    func fetchAllBooks() -> [Book] {
        return [
            Book(title: "BNB 4-5 Science", image: "https://img3.doubanio.com//view//subject//m//public//s12862971.jpg", author: ["Frank, Marge; Forte, Imogene;"]),
            Book(title: "那小子真帅", image: "https://img1.doubanio.com//view//subject//m//public//s1068907.jpg" , author: ["[韩] 可爱淘"])
        ]
    }
}
