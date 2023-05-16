//
//  SeeAllViewController.swift
//  TestRtHome
//
//  Created by mac on 16/05/2023.
//

import UIKit

class SeeAllViewController: UIViewController {
    var listInput = [String]()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        initTableView()
        // Do any additional setup after loading the view.
    }
    
    
    func initTableView(){
        tableView.register(UINib(nibName: String(describing: FileNameTableViewCell.self), bundle: Bundle.main), forCellReuseIdentifier: String(describing: FileNameTableViewCell.self))
        tableView.dataSource = self
        tableView.delegate = self
    }
}
extension SeeAllViewController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listInput.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FileNameTableViewCell.self), for: indexPath) as! FileNameTableViewCell
        let name = listInput[indexPath.row]
        cell.fileNameLabel.text = name
        cell.titleLabel.text = "InstanceID " + "\(indexPath.row + 1)"
        cell.selectionStyle = .none
        return cell
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}


