//
//  SchoolViewController.swift
//  20220323-MiguelJimenez-NYCSchools
//
//  Created by chamuel castillo on 3/23/22.
//

import UIKit


class SchoolViewController: UIViewController {
    
    @IBOutlet weak var schoolTableView: UITableView!
    private var schoolList: [School] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        schoolTableView.delegate = self
        schoolTableView.dataSource = self
        
        SchoolRequest().fetchSchools { [weak self] school in
            self?.schoolList = school
            DispatchQueue.main.async {
                self?.schoolTableView.reloadData()
            }
        }
    }
}

extension SchoolViewController : UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schoolList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let schoolCell = tableView.dequeueReusableCell(withIdentifier: "schoolCell" , for: indexPath)
        
        schoolCell.textLabel?.text = schoolList[indexPath.item].schoolName
        schoolCell.detailTextLabel?.text = schoolList[indexPath.item].city
        return schoolCell
    }
}

extension SchoolViewController : UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let schoolDetailsVC = SchoolDetailsViewController()
        schoolDetailsVC.schoolCode = schoolList[indexPath.item].dbn ?? ""
        
        schoolDetailsVC.title = schoolList[indexPath.item].schoolName
        
        self.navigationController?.pushViewController(schoolDetailsVC, animated: true)
    }
}

