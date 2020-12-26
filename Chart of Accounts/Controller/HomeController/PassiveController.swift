import UIKit

class PassiveController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var passiveSections: [String] = []
    var passiveRows: [[String]] = []
    
    var searchResults: [String] = []
    var isSearching: Bool = false
    
    var searchController = UISearchController(searchResultsController: nil)
  
    
    //MARK: viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        
        tableView.rowHeight = view.frame.height / 12
        
        title = "passiveTitle".localized
        
        segmentedControl.setTitle("passiveSegment1".localized, forSegmentAt: 0)
        segmentedControl.setTitle("passiveSegment2".localized, forSegmentAt: 1)
        
        segmentPressed()
        
        segmentedControl.layer.borderColor = UIColor.white.cgColor
        setSearchController(searchController: searchController, delegate: self)
        
        tableView.reloadData()
        
        navigationController?.navigationBar.isHidden = false
        tabBarController?.tabBar.isHidden = false
    }    
    
    @IBAction func segments(_ sender: UISegmentedControl) {
        UserDefaults.standard.setValue(sender.selectedSegmentIndex, forKey: "segmentPassive")
        segmentPressed()
        tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: false)
    }
    
    func segmentPressed() {
        segmentedControl.selectedSegmentIndex = UserDefaults.standard.integer(forKey: "segmentPassive")
        switch UserDefaults.standard.integer(forKey: "segmentPassive") {
        
        case 0 :
            
            isSearching = false
            searchController.searchBar.text = ""
            navigationItem.searchController?.dismiss(animated: true, completion: nil)
            passiveSections = PassiveSegmentFirstModel().getPassiveSegmentFirstSections()
            passiveRows = PassiveSegmentFirstModel().getPassiveSegmentFirstRows()
            tableView.reloadData()
            
        case 1 :
            
            isSearching = false
            searchController.searchBar.text = ""
            navigationItem.searchController?.dismiss(animated: true, completion: nil)
            passiveSections = PassiveSegmentSecondModel().getPassiveSegmentSecondSections()
            passiveRows = PassiveSegmentSecondModel().getPassiveSegmentSecondRows()
            tableView.reloadData()
            
        default: break
            
        }
    }
}

//MARK: table
extension PassiveController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if isSearching {
            return 1
        }
        print(passiveRows)
        print(passiveSections)
        return passiveSections.count
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
        numLabel.text = passiveSections[section]
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
        descriptionLabel.text = passiveSections[section].localized.removeToSpecifiedIndex(specifiedString: passiveSections[section].localized)
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
        return passiveRows[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableCell
        
        if isSearching {
            cell.numLabel.text = String(searchResults[indexPath.row].localized.split(separator: " ")[0])
            cell.descriptionLabel.text = searchResults[indexPath.row].localized.removeToSpecifiedIndex(specifiedString: searchResults[indexPath.row].localized)
        } else {
            cell.numLabel.text = passiveRows[indexPath.section][indexPath.row]
            cell.descriptionLabel.text = passiveRows[indexPath.section][indexPath.row].localized.removeToSpecifiedIndex(specifiedString: passiveSections[indexPath.row].localized)
            cell.descriptionLabel.text? = (cell.descriptionLabel.text?.lowercased().capitalizingFirstLetter())!
        }
        return cell
    }
}
//MARK: search
extension PassiveController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        isSearching = true
        searchResults = []
        
        if searchBar.text == "" {
            isSearching = false
        }

        self.searchResults = passiveRows.containsStringDoubleArray(searchText: searchText, existingDoubleArray: passiveRows)

        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearching = false
        tableView.reloadData()
    }
}
