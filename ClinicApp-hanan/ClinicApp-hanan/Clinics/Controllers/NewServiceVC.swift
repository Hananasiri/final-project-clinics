//
//  NewServiceVC.swift
//  ClinicApp-hanan
//
//  Created by  HANAN ASIRI on 21/04/1443 AH.
//

import UIKit

class NewServicesVC: UIViewController, UITextFieldDelegate {
    
    lazy var NameTF: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "اكتب اسم الموعد"
        tf.backgroundColor = .white
        tf.layer.cornerRadius = 12
        tf.delegate = self
        return tf
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray2
        
        view.addSubview(NameTF)
        NSLayoutConstraint.activate([
            NameTF.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            NameTF.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 32),
            NameTF.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -32),
            NameTF.heightAnchor.constraint(equalToConstant: 40),
            ])
            }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let name = NameTF.text ?? ""
        let uuid = UUID().uuidString

        ClinicsService.shared.addData(
            data:Date(id: uuid, name: name)
        )
        
        dismiss(animated: true, completion: nil)
        return true
    }
    
    }

