//
//  ViewController.swift
//  TestRtHome
//
//  Created by mac on 16/05/2023.
//

import UIKit

class ViewController: UIViewController {
    var listNameFile = [String]()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.title = "ViewController"
        readNameFileInFolder("data")
    }
    
    func initTableView(){
        tableView.register(UINib(nibName: String(describing: FileNameTableViewCell.self), bundle: Bundle.main), forCellReuseIdentifier: String(describing: FileNameTableViewCell.self))
        tableView.dataSource = self
        tableView.delegate = self
    }
    public func loadXML(filename: String) {
        var parser : XMLParser?
        if let path = Bundle.main.path(forResource: filename, ofType: "xml") {
            
            parser = XMLParser(contentsOf: URL(fileURLWithPath: path))
            //parser!.delegate = self
            if parser!.parse() {
                
            } else {
                print("Unable to parse")
            }
            
        } else {
            print("File read error")
        }
    }
    
    func readNameFileInFolder(_ nameFolder: String) {
        let fm = FileManager.default
        if  let path = Bundle.main.path(forResource: nameFolder, ofType: .none) {
            let items = try! fm.contentsOfDirectory(atPath: path)
            
            for item in items {
                listNameFile.append(item)
            }
            initTableView()
        }
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listNameFile.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FileNameTableViewCell.self), for: indexPath) as! FileNameTableViewCell
        let name = listNameFile[indexPath.row]
        cell.fileNameLabel.text = name
        cell.selectionStyle = .none
        return cell
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ImportViewController") as? ImportViewController
        let name = listNameFile[indexPath.row]
        vc?.nameFile = name
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}


