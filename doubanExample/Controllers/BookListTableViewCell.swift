import UIKit

class BookListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var bookAuthor: UILabel!
    
    var book: Book? {
        willSet {
            if let url = newValue?.image { // set value for image
                DispatchQueue.global().async {
                    if let data = try? Data( contentsOf:URL(string: url)!)
                    {
                        DispatchQueue.main.async {
                            self.bookImage.image = UIImage( data:data)
                        }
                    }
                }
            } else {
                DispatchQueue.global().async {
                    if let data = try? Data( contentsOf: URL(string: "https://img1.doubanio.com//f//shire//5522dd1f5b742d1e1394a17f44d590646b63871d//pics//book-default-lpic.gif")!)
                    {
                        DispatchQueue.main.async {
                            self.bookImage.image = UIImage( data:data)
                        }
                    }
                }
            }
            
            if let title = newValue?.title { // set value for book title
                bookTitle.text = title
            }
            
            if let author = newValue?.author { // set value for author
                if author.count > 0 {
                    bookAuthor.text = author[0]
                } else {
                    bookAuthor.text = ""
                }
            }
        }
    }
}
