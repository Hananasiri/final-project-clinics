//
//  ProfileVC.swift
//  ClinicApp-hanan
//
//  Created by  HANAN ASIRI on 03/05/1443 AH.
//



import UIKit
import Firebase
import FirebaseFirestore

class NewServiceVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    //setUse arrays
    var post : Array<Appointment> = []
    var time = NSDate()
    
    lazy var myLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = NSLocalizedString("مواعيدي" , comment: "")
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize:30 , weight: .bold)
        //label.backgroundColor = .blue
        return label
    }()
    
    lazy var serviceTV: UITableView = {
        let t = UITableView()
        t.translatesAutoresizingMaskIntoConstraints = false
        t.delegate = self
        t.dataSource = self
        t.register(NewService.self, forCellReuseIdentifier: "ServiceCell")
        return t
    }()
    
    var datePicker: UIDatePicker = {
        let dp = UIDatePicker()
        dp.translatesAutoresizingMaskIntoConstraints = false
        dp.addTarget(self, action: #selector(dateChanged), for: .valueChanged)
        dp.datePickerMode = .date
        dp.layer.cornerRadius = 60
        dp.backgroundColor = .systemGray5
        return dp
    }()
    var phoneTF: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.isSecureTextEntry = false
        tf.layer.cornerRadius = 5
        tf.backgroundColor = .systemGray5
        tf.textAlignment = .right
        tf.placeholder = "تفضل بإدخال رقم جوالك"
        return tf
    }()
    
    let Button : UIButton = {
        $0.backgroundColor = .red
        $0.setTitle(NSLocalizedString("حفظ معلوماتك", comment: ""), for: .normal)
        $0.tintColor = .white
        $0.layer.cornerRadius = 10
        $0.titleLabel?.font = .systemFont(ofSize: 15, weight: .black)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addTarget(self, action: #selector(saveButtone), for: .touchUpInside)
        return $0
    }(UIButton())
    
    @objc func dateChanged() {
        print("New date = \(datePicker.date)")
    }

//
//    func datePickerValueChanged(_ sender: UIDatePicker){
//
//           // Create date formatter
//           let dateFormatter: DateFormatter = DateFormatter()
//
//           // Set date format
//           dateFormatter.dateFormat = "MM/dd/yyyy hh:mm a"
//
//           // Apply date format
//           let selectedDate: String = dateFormatter.string(from: sender.date)
//
//           print("Selected value \(selectedDate)")
//       }
        override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(myLabel)
        view.addSubview(datePicker)
        view.backgroundColor = UIColor(named: "bgColor")
        //title = NSLocalizedString("مواعيدي", comment: "")
        
        let name = UserDefaults.standard.value(forKey: "phoneTF") as? String
        phoneTF.text = name
        
        _ = UserDefaults.standard.value(forKey: "datePicker") as? NSDate
       
        
        NSLayoutConstraint.activate([
         myLabel.topAnchor.constraint(equalTo: view.topAnchor,constant: 120),
         myLabel.leftAnchor.constraint(equalTo: view.leftAnchor , constant: 70),
         myLabel.heightAnchor.constraint(equalToConstant: 30),
         myLabel.widthAnchor.constraint(equalToConstant: 300),
         ])
        
        view.addSubview(serviceTV)
        NSLayoutConstraint.activate([
            serviceTV.topAnchor.constraint(equalTo: myLabel.topAnchor , constant: 50),
            serviceTV.leftAnchor.constraint(equalTo: view.leftAnchor),
            serviceTV.rightAnchor.constraint(equalTo: view.rightAnchor),
            serviceTV.heightAnchor.constraint(equalTo: view.heightAnchor , constant: 20),
            serviceTV.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
//            view.addSubview(datePicker)
//            NSLayoutConstraint.activate([
//            datePicker.topAnchor.constraint(equalTo: view.topAnchor,constant: 120),
//            datePicker.leftAnchor.constraint(equalTo: myLabel.leftAnchor),
//            datePicker.heightAnchor.constraint(equalToConstant: 30),
//            datePicker.widthAnchor.constraint(equalToConstant: 80),
////            datePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor ),
////            datePicker.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//             ])
//        view.addSubview(phoneTF)
//        NSLayoutConstraint.activate([
//
//            phoneTF.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            phoneTF.topAnchor.constraint(equalTo: serviceTV.topAnchor, constant: 500),
//            phoneTF.heightAnchor.constraint(equalToConstant: 40),
//            phoneTF.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -160),
//        ])
//        view.addSubview(Button)
//        NSLayoutConstraint.activate([
//            Button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            Button.topAnchor.constraint(equalTo: phoneTF.bottomAnchor, constant: 10),
//            Button.heightAnchor.constraint(equalToConstant: 40),
//            Button.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -200),
//        ])
            view.addSubview(datePicker)
            NSLayoutConstraint.activate([
                datePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor , constant: 110),
                datePicker.centerYAnchor.constraint(equalTo: serviceTV.centerYAnchor , constant: 20),
            ])
        
        
        view.addSubview(phoneTF)
        NSLayoutConstraint.activate([
            phoneTF.centerXAnchor.constraint(equalTo: view.centerXAnchor , constant: -70),
            phoneTF.topAnchor.constraint(equalTo: view.topAnchor, constant: 602),
            phoneTF.heightAnchor.constraint(equalToConstant: 40),
            phoneTF.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -200),
            datePicker.leftAnchor.constraint(equalTo: datePicker.leftAnchor),
            
        ])
        
        
        view.addSubview(Button)
        NSLayoutConstraint.activate([
            Button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            Button.topAnchor.constraint(equalTo: phoneTF.bottomAnchor, constant: 17),
            Button.heightAnchor.constraint(equalToConstant: 40),
            Button.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -250),
        ])
            
            
            
        ReservitionsService.shared.listenToAppointment(completion: { appointment in
            self.post = appointment
            self.serviceTV.reloadData()
        })
    }
    
    
    @objc func saveButtone() {
        let name = phoneTF.text
        _ = datePicker.date
        UserDefaults.standard.set(name,forKey: "phoneTF")
        UserDefaults.standard.set(name,forKey: "datePicker")
        
        guard let currentUserID = Auth.auth().currentUser?.uid else {return}
        Firestore.firestore().document("services/\(currentUserID)").setData([
            "phone" :phoneTF.text as Any,
            "date" :datePicker.date as Any,
             "id"  :currentUserID,
  // Use alert controller
        ],merge: true)
        
        let alert1 = UIAlertController(
            title: (""),
            message: "هل أنت متأكد من حفظ معلومات حجزك؟",
            preferredStyle: .alert)
        alert1.addAction(
            UIAlertAction(
                title: "OK",
                style: .default,
                handler: { action in
                    print("OK")
                }
               )
            )
        present(alert1, animated: true, completion: nil)
           }

    
    var selectedIndex = -1
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
//        if indexPath.row == selectedIndex {
//         return 354
//        }else {
//         return 100
//        }
       }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return post.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ServiceCell", for: indexPath) as! NewService
        let bservice = post[indexPath.row]
        cell.nameLabel2.text = bservice.bookaservice
        cell.doctorlable.text = bservice.bookadoctor
        cell.timelable.text = bservice.bookatime
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let cell = post[indexPath.row]
        // Use alert controller
        let alertcontroller = UIAlertController(title: "Delete"
                            , message: "Are you sure you want to delete?"
                            , preferredStyle: UIAlertController.Style.alert
        )
           alertcontroller.addAction(
               UIAlertAction(title: "cancel",
                      style: UIAlertAction.Style.default,
                      handler: { Action in print("...")
          })
        )
        alertcontroller.addAction(
          UIAlertAction(title: "Delete",
                 style: UIAlertAction.Style.destructive,
                 handler: { Action in
            if editingStyle == .delete {
            Firestore.firestore().collection("reservations").document(cell.bookaservice).delete()
                
//              self.appointment.remove(at: indexPath.row)
//              self.serviceTV.deleteRows(at: [indexPath], with: .fade)
            }
            self.serviceTV.reloadData()
          })
        )
        self.present(alertcontroller, animated: true, completion: nil)
      }
    
      }


class NewService: UITableViewCell {
    var note: Appointment?
    static let identfir = "ServiceCell"
    
    
    let nameLabel2: UILabel = {
        let nameservice = UILabel()
        nameservice.font = UIFont(name: "AvenirNextCondensed-Medium", size: 16.0)
        nameservice.textColor = .black
        nameservice.textAlignment = .right
        nameservice.layer.masksToBounds = true
        return nameservice
      }()
    
    let doctorlable : UILabel = {
        let drlable = UILabel()
        drlable.font = UIFont(name: "AvenirNextCondensed-Medium", size: 16.0)
        drlable.textColor = .black
        drlable.textAlignment = .right
        drlable.layer.masksToBounds = true
        return drlable
      }()
    
    let timelable : UILabel = {
        let tlable = UILabel()
        tlable.font = UIFont(name: "AvenirNextCondensed-Medium", size: 16.0)
        tlable.textColor = .black
        tlable.textAlignment = .right
        tlable.layer.masksToBounds = true
        return tlable
      }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = UIColor(named: "bgColor")

        contentView.addSubview(nameLabel2)
        contentView.addSubview(doctorlable)
        contentView.addSubview(timelable)
        contentView.clipsToBounds = true
      }
    
      required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
      }
    
      override func layoutSubviews() {
        super.layoutSubviews()
        // x: right and left
        // y: up and down
        nameLabel2.frame = CGRect(x: -130,
              y: 10,
              width: 500,
              height: contentView.frame.size.height-10)
          doctorlable.frame = CGRect(x: -300,
                y: 10,
                width: 500,
                height: contentView.frame.size.height-10)
          timelable.frame = CGRect(x: -410,
                y: 10,
                width: 500,
                height: contentView.frame.size.height-10)
       }
    
       }
