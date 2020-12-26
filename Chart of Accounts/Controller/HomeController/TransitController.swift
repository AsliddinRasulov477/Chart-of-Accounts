import UIKit

class TransitController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var transitSections: [String] = []
    var transitRows: [[String]] = []

    var searchResults: [String] = []
    var isSearching: Bool = false
    
    var searchController = UISearchController(searchResultsController: nil)
  
    
    //MARK: viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        
        title = "transitTitle".localized
        
        tableView.rowHeight = view.frame.height / 12
        
        transitSections = TransitModel().getTransitSections()
        transitRows = TransitModel().getTransitRows()
        
        navigationItem.hidesSearchBarWhenScrolling = false
        setSearchController(searchController: searchController, delegate: self)
        
        tableView.reloadData()
        
        navigationController?.navigationBar.isHidden = false
        tabBarController?.tabBar.isHidden = false
    }    
}

//MARK: table
extension TransitController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if isSearching {
            return 1
        }
        return transitSections.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView()
        
        header.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3).cgColor
        header.layer.shadowOpacity = 1
        header.layer.shadowOpacity = 1
        header.layer.shadowRadius = 4
        header.layer.shadowOffset = CGSize(width: 4, height: 4)
        header.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        header.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height / 10)
        
        let numLabel = UILabel()
        numLabel.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        numLabel.textAlignment = .center
        numLabel.frame = CGRect(x: 5, y: 5, width: 0.14 * header.frame.width, height: header.frame.height - 10)
        numLabel.text = transitSections[section]
        numLabel.clipsToBounds = true
        numLabel.layer.cornerRadius = 10
        numLabel.font = UIFont.systemFont(ofSize: view.frame.width / 24, weight: .medium)
        numLabel.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
        header.addSubview(numLabel)
        
        let descriptionLabel = UILabel()
        descriptionLabel.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        descriptionLabel.textAlignment = .center
        descriptionLabel.numberOfLines = 0
        descriptionLabel.frame = CGRect(x: 0.14 * header.frame.width + 10, y: 5, width: 0.86 * header.frame.width - 15, height: header.frame.height - 10)
        descriptionLabel.text = transitSections[section].localized.removeToSpecifiedIndex(specifiedString: transitSections[section].localized)
        descriptionLabel.text = descriptionLabel.text!.lowercased().capitalizingFirstLetter()
        descriptionLabel.clipsToBounds = true
        descriptionLabel.layer.cornerRadius = 10
        descriptionLabel.font = UIFont.systemFont(ofSize: view.frame.width / 24, weight: .medium)
        descriptionLabel.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        header.addSubview(descriptionLabel)
    
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if isSearching {
            return 0
        }
        return view.frame.height / 10
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching {
            return searchResults.count
        }
        return transitRows[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableCell
        
        if isSearching {
            cell.numLabel.text = String(searchResults[indexPath.row].localized.split(separator: " ")[0])
            cell.descriptionLabel.text = searchResults[indexPath.row].localized.removeToSpecifiedIndex(specifiedString: searchResults[indexPath.row].localized)
        } else {
            cell.numLabel.text = transitRows[indexPath.section][indexPath.row]
            cell.descriptionLabel.text = transitRows[indexPath.section][indexPath.row].localized.removeToSpecifiedIndex(specifiedString: transitSections[indexPath.row].localized)
            cell.descriptionLabel.text? = (cell.descriptionLabel.text?.lowercased().capitalizingFirstLetter())!
        }
        return cell
    }
}

//MARK: search
extension TransitController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        isSearching = true
        searchResults = []
        
        if searchBar.text == "" {
            isSearching = false
        }

        self.searchResults = transitRows.containsStringDoubleArray(searchText: searchText, existingDoubleArray: transitRows)

        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearching = false
        tableView.reloadData()
    }
}
