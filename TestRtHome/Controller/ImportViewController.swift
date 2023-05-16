//
//  ImportViewController.swift
//  TestRtHome
//
//  Created by mac on 16/05/2023.
//

import UIKit
import Foundation
class ImportViewController: UIViewController {
    @IBOutlet weak var importNameLabel: UILabel!
    @IBOutlet weak var inputTF: UITextField!
    @IBOutlet weak var inputButton: UIButton!
    var listInput = [String]()
    var nameFile: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "ImportViewController"
        setupUI()
    }
    
    func setupUI() {
        if let nameFile = nameFile {
            importNameLabel.text = "Import vào File: " + nameFile
        }
        inputButton.layer.cornerRadius = inputButton.frame.height/2
    }
    
    @IBAction func onTapInputButton(_ sender: Any) {
        
        if let intanceId = inputTF.text {
            addFileXMLWithinstanceID(intanceId)
            listInput.append(intanceId)
        }
        
        let alert = UIAlertController(title: "Thông báo", message: "Thêm InstanceID thành công", preferredStyle: UIAlertController.Style.alert)
        let okeAct = UIAlertAction(title: "Xác nhận", style: .cancel) { oke in
                self.inputTF.text = ""
        }
        alert.addAction(okeAct)
        self.present(alert, animated: true)

    }
    @IBAction func onTapSeeAll(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "SeeAllViewController") as? SeeAllViewController
        vc?.listInput = listInput
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    func addFileXMLWithinstanceID(_ instanceID: String) {
        var xml = "<?xmlversion='1.0'encoding='UTF-8'?><official-data>"
        let node: String = "<instanceID>\(instanceID)</instanceID>"
        xml.append(node)
        xml.append("</official-data>")
    }
}
