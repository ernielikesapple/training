import Alamofire

// api:https://api.douban.com/v2/book/search

class FetchBookService {
    public static let shared = FetchBookService()
    public init() {}
}

extension FetchBookService {
    func fetchAllBooks(searchKeyWords: String, completion: @escaping ([Book]?) -> Void) {
        guard let url = URL(string: "https://api.douban.com/v2/book/search") else {
            completion(nil)
            return
        }
        let parameters: Parameters = ["q": searchKeyWords]
        Alamofire.request(url,
                          method: .get,
                          parameters: parameters)
            .validate()
            .responseJSON { response in
                
                guard response.result.isSuccess else {
                    print("Error while fetching remote rooms: \(String(describing: response.result.error))")
                        completion(nil)
                    return
                }
                
                guard let value = response.result.value as? [String: Any],
                    let library = value["books"] as? [[String: Any]] else {
                        print("Malformed data received from fetchAllRooms service")
                        completion(nil)
                        return
                }
                
                let books = library.compactMap { book in return Book(title: book["title"] as? String, image: book["image"] as? String, author: book["author"] as? [String]) }
                completion(books)
        }
    }
}
