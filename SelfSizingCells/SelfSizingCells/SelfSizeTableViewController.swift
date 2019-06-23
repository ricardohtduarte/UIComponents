import UIKit

class SelfSizeTableViewController: UIViewController {
    private let quotes: [(String, String)] =
        [("Isaac Newton",
          "I seem to have been only like a boy playing on the seashore, and diverting myself in now and then finding a smoother pebble or a prettier shell than ordinary, whilst the great ocean of truth lay all undiscovered before me."),
         ("Albert Einstein",
          "Two things are infinite: the universe and human stupidity; and I'm not sure about the universe."),
         ("Georg C. Lichtenberg",
          "It is strange that only extraordinary men make the discoveries, which later appear so easy and simple.")]
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}

extension SelfSizeTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quotes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: QuoteTableViewCell.self)) as! QuoteTableViewCell
        cell.author.text = quotes[indexPath.row].0
        cell.quote.text = quotes[indexPath.row].1
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75.0
    }
}
