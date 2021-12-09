//
//  ClinicData.swift
//  ClinicApp-hanan
//
//  Created by  HANAN ASIRI on 19/04/1443 AH.
//


//import UIKit
//
//class ClinicData: UIViewController , UISearchBarDelegate {
//    var content: Array<Date> = []
//    
//    lazy var searchBar:UISearchBar = UISearchBar()
//    
//    lazy var clinicTV: UITableView = {
//        let t = UITableView()
//        t.translatesAutoresizingMaskIntoConstraints = false
//        t.delegate = self
//        t.dataSource = self
//        t.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
//        return t
//    }()
//    
//    lazy var addserviceButton: UIButton = {
//        let b = UIButton()
//        b.addTarget(self, action: #selector(addService), for: .touchUpInside)
//        b.translatesAutoresizingMaskIntoConstraints = false
//        b.setTitle(" مواعيدي", for: .normal)
//        b.layer.cornerRadius = 12
//        b.backgroundColor = .systemTeal
//        return b
//    }()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        ClinicsService.shared.listenToData { newdatas in
//            self.content = newdatas
//            self.clinicTV.reloadData()
//        }
//    
//        view.addSubview(clinicTV)
//        NSLayoutConstraint.activate([
//            clinicTV.topAnchor.constraint(equalTo: view.topAnchor),
//            clinicTV.leftAnchor.constraint(equalTo: view.leftAnchor),
//            clinicTV.rightAnchor.constraint(equalTo: view.rightAnchor),
//            clinicTV.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//        ])
//        
//        view.addSubview(addserviceButton)
//        NSLayoutConstraint.activate([
//            addserviceButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 120),
//            addserviceButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200),
//            addserviceButton.widthAnchor.constraint(equalToConstant: 150),
//            addserviceButton.heightAnchor.constraint(equalToConstant: 50),
//        ])
//    }
//
//    @objc func addService() {
//        let newServiceVC = NewServiceVC()
//        present( newServiceVC, animated: true, completion: nil)
//    }
//    }
//
//    extension ClinicData: UITableViewDataSource, UITableViewDelegate {
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        //return content.count
//         return content.count
//
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
//        
//        let date = content[indexPath.row]
//        cell.textLabel?.text = date.name
//        
//        return cell
//    }
//    
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        
//        let cell = content[indexPath.row]
//            let alertcontroller = UIAlertController(title: " "
//                                , message: "هل أنت متأكد من حذف موعدك؟"
//                                , preferredStyle: UIAlertController.Style.alert
//            )
//            alertcontroller.addAction(
//              UIAlertAction(title: "cancel", style: UIAlertAction.Style.default, handler: { Action in print("...")
//              })
//            )
//            alertcontroller.addAction(
//              UIAlertAction(title: "Delete", style: UIAlertAction.Style.destructive, handler: { Action in
//
//        if editingStyle == .delete {
//            self.content.remove(at: indexPath.row)
//          
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        }
//                  tableView.reloadData()
//                  
//        })
//        )
//       
//              self.present(alertcontroller, animated: true, completion: nil)
//              
//        }
//     
//        }
//
//

//import UIKit
//import FirebaseFirestore
//import FirebaseAuth
//
//
//class ClinicData: UIViewController , UISearchBarDelegate {
//    var content: Array<Date> = []
//
//    lazy var searchBar:UISearchBar = UISearchBar()
//
//    lazy var clinicTV: UITableView = {
//        let t = UITableView()
//        t.translatesAutoresizingMaskIntoConstraints = false
//        t.delegate = self
//        t.dataSource = self
//        t.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
//        return t
//    }()
//
//    lazy var addserviceButton: UIButton = {
//        let b = UIButton()
//        b.addTarget(self, action: #selector(addService), for: .touchUpInside)
//        b.translatesAutoresizingMaskIntoConstraints = false
//        b.setTitle(" مواعيدي", for: .normal)
//        b.layer.cornerRadius = 16
//        b.backgroundColor = .blue
//        return b
//    }()
//
//       var RegistTF: UITextField = {
//            let tf = UITextField()
//            tf.translatesAutoresizingMaskIntoConstraints = false
//            tf.backgroundColor = .systemGray5
//            tf.layer.cornerRadius = 12
//            tf.textAlignment = .right
//            tf.placeholder = "تفضل بإدخال اسم العيادة"
//            return tf
//        }()
//    var phoneNumberTF: UITextField = {
//        let tf = UITextField()
//        tf.translatesAutoresizingMaskIntoConstraints = false
//        tf.isSecureTextEntry = false
//        tf.layer.cornerRadius = 12
//        tf.backgroundColor = .systemGray5
//        tf.textAlignment = .right
//        tf.placeholder = "تفضل بإدخال رقم جوالك"
//        return tf
//    }()
//
//    lazy var datePicker: UIDatePicker = {
//        let dp = UIDatePicker()
//        dp.translatesAutoresizingMaskIntoConstraints = false
//        dp.addTarget(self, action: #selector(dateChanged), for: .valueChanged)
//        dp.datePickerMode = .date
//        return dp
//    }()
//
//    let Button : UIButton = {
//        $0.backgroundColor = .systemTeal
//        $0.setTitle(NSLocalizedString("حفظ معلوماتك", comment: ""), for: .normal)
//        $0.tintColor = .blue
//        $0.layer.cornerRadius = 16
//        $0.titleLabel?.font = .systemFont(ofSize: 20, weight: .light)
//        $0.translatesAutoresizingMaskIntoConstraints = false
//        $0.addTarget(self, action: #selector(saveButtone), for: .touchUpInside)
//        return $0
//    }(UIButton())
//
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        ClinicsService.shared.listenToData { newdatas in
//            self.content = newdatas
//            self.clinicTV.reloadData()
//        }
//
//        view.addSubview(clinicTV)
//        NSLayoutConstraint.activate([
//            clinicTV.topAnchor.constraint(equalTo: view.topAnchor),
//            clinicTV.leftAnchor.constraint(equalTo: view.leftAnchor),
//            clinicTV.rightAnchor.constraint(equalTo: view.rightAnchor),
//            clinicTV.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//        ])
//
//        view.addSubview(addserviceButton)
//        NSLayoutConstraint.activate([
//            addserviceButton.topAnchor.constraint(equalTo: view.bottomAnchor, constant: 80),
//            addserviceButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 120),
//            addserviceButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -500),
//            addserviceButton.widthAnchor.constraint(equalToConstant: 150),
//            addserviceButton.heightAnchor.constraint(equalToConstant: 40),
//        ])
//
//        view.addSubview(RegistTF)
//        NSLayoutConstraint.activate([
//                   RegistTF.topAnchor.constraint(equalTo: addserviceButton.topAnchor, constant: 80),
//                   RegistTF.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 32),
//                   RegistTF.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -32),
//                   RegistTF.heightAnchor.constraint(equalToConstant: 40),
//                   ])
//
//        view.addSubview(phoneNumberTF)
//        NSLayoutConstraint.activate([
//            phoneNumberTF.topAnchor.constraint(equalTo: RegistTF.bottomAnchor, constant: 20),
//            phoneNumberTF.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 32),
//            phoneNumberTF.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -32),
//            phoneNumberTF.heightAnchor.constraint(equalToConstant: 40),
//        ])
//
//        view.addSubview(datePicker)
//        NSLayoutConstraint.activate([
//        datePicker.topAnchor.constraint(equalTo: phoneNumberTF.bottomAnchor, constant: 24),
//        datePicker.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 32),
//        datePicker.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -32),
//        datePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 32),
//        datePicker.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -200),
//        datePicker.heightAnchor.constraint(equalToConstant: 40),
//        ])
//
//        view.addSubview(Button)
//        NSLayoutConstraint.activate([
//        Button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//        Button.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 30),
//        Button.heightAnchor.constraint(equalToConstant: 45),
//        Button.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -200),
//        ])
//
//    }
//
//    @objc func addService() {
//        let newServiceVC = NewServicesVC()
//        present( newServiceVC, animated: true, completion: nil)
//    }
//    }
//
//    extension ClinicData: UITableViewDataSource, UITableViewDelegate {
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        //return content.count
//         return content.count
//
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
//
//        let date = content[indexPath.row]
//        cell.textLabel?.text = date.name
//
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//
//        let cell = content[indexPath.row]
//            let alertcontroller = UIAlertController(title: " "
//                                , message: "هل أنت متأكد من حذف موعدك؟"
//                                , preferredStyle: UIAlertController.Style.alert
//            )
//            alertcontroller.addAction(
//              UIAlertAction(title: "cancel", style: UIAlertAction.Style.default, handler: { Action in print("...")
//              })
//            )
//            alertcontroller.addAction(
//              UIAlertAction(title: "Delete", style: UIAlertAction.Style.destructive, handler: { Action in
//
//        if editingStyle == .delete {
//            self.content.remove(at: indexPath.row)
//
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        }
//                  tableView.reloadData()
//
//        })
//        )
//
//              self.present(alertcontroller, animated: true, completion: nil)
//
//        }
//        @objc func dateChanged() {
//
//            print("New date = \(datePicker.date)")
//        }
//
//        @objc func saveButtone() {
//            guard let currentUserID = Auth.auth().currentUser?.uid else {return}
//            Firestore.firestore().document("users/\(currentUserID)").setData([
//                "name" :RegistTF.text as Any,
//                "Phone" :phoneNumberTF.text as Any,
//                "date" :datePicker.date as Any,
//                 "id" : currentUserID,
//
//            ],merge: true)
//            let alert1 = UIAlertController(
//                title: (""),
//                message: "هل أنت متأكد من حفظ معلومات حجزك؟",
//                preferredStyle: .alert)
//            alert1.addAction(
//                UIAlertAction(
//                    title: "OK",
//                    style: .default,
//                    handler: { action in
//                        print("OK")
//                    }
//                )
//                )
//            present(alert1, animated: true, completion: nil)
//               }
//
//        }
//
//
//
//
