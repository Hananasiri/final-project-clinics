//
//  ProfileVC.swift
//  ClinicApp-hanan
//
//  Created by  HANAN ASIRI on 03/05/1443 AH.
//



import UIKit
import Firebase
import FirebaseFirestore

//struct Service {
//    let name: String
//    let id: String
//}

class NewServiceVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var sss : Array<Mawaid> = []
    
    
    lazy var serviceTV: UITableView = {
        let t = UITableView()
        t.translatesAutoresizingMaskIntoConstraints = false
        t.delegate = self
        t.dataSource = self
        t.register(NewService.self, forCellReuseIdentifier: "ServiceCell")
        return t
    }()
    
    lazy var datePicker: UIDatePicker = {
        let dp = UIDatePicker()
        dp.translatesAutoresizingMaskIntoConstraints = false
        dp.addTarget(self, action: #selector(dateChanged), for: .valueChanged)
        dp.datePickerMode = .date
        dp.layer.cornerRadius = 20
        dp.tintColor = .brown
        return dp
    }()
    
    @objc func dateChanged() {

        print("New date = \(datePicker.date)")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        view.addSubview(serviceTV)
        NSLayoutConstraint.activate([
            serviceTV.topAnchor.constraint(equalTo: view.topAnchor),
            serviceTV.leftAnchor.constraint(equalTo: view.leftAnchor),
            serviceTV.rightAnchor.constraint(equalTo: view.rightAnchor),
            serviceTV.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
            view.addSubview(datePicker)
            NSLayoutConstraint.activate([
                datePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                datePicker.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            ])
        
        
        FavoriteService.shared.listenToMawaid(completion: { mm in
            self.sss = mm
            self.serviceTV.reloadData()
        })
    }
    
    var selectedIndex = -1
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == selectedIndex {
         return 354
        }else {
         return 100
        }
       }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sss.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ServiceCell", for: indexPath) as! NewService
        
        let s = sss[indexPath.row]
        
        cell.nameLabel2.text = s.booked
        cell.doctorlable.text = s.booked2
        cell.timelable.text = s.booked3
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let cell = sss[indexPath.row]
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
              self.sss.remove(at: indexPath.row)
              self.serviceTV.deleteRows(at: [indexPath], with: .fade)
            }
            self.serviceTV.reloadData()
          })
        )
        self.present(alertcontroller, animated: true, completion: nil)
      }
    }


class NewService: UITableViewCell {
    
  //  var new = [service]()
    
    static let identfir = "ServiceCell"
    
    
    let nameLabel2: UILabel = {
        let namebook = UILabel()
         namebook.font = UIFont(name: "AvenirNextCondensed-Medium", size: 16.0)
         namebook.textColor = .black
         namebook.textAlignment = .right
         namebook.layer.masksToBounds = true
        return namebook
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
        nameLabel2.frame = CGRect(x: -120,
              y: 10,
              width: 500,
              height: contentView.frame.size.height-20)
          doctorlable.frame = CGRect(x: -270,
                y: 10,
                width: 500,
                height: contentView.frame.size.height-20)
          timelable.frame = CGRect(x: -370,
                y: 10,
                width: 500,
                height: contentView.frame.size.height-20)
       }
    }













//import UIKit
//import FirebaseFirestore
//import FirebaseAuth
//
//class ProfileVC: UIViewController , UIImagePickerControllerDelegate, UINavigationControllerDelegate{
//
//    // Add stack view ..
//    let stackView = UIStackView()
//
//    func setStackView() {
//        let firstView = stackView.arrangedSubviews[0]
//        firstView.isHidden = true
//
//    }
//    func upStackView() {
//        if stackView.axis == .horizontal {
//        stackView.axis = .vertical
//    }
//    else {
//        stackView.axis = .horizontal
//    }
//    }
//
//
//    lazy var imageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.image = UIImage(named: "BB")
//        imageView.contentMode = .scaleAspectFill
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.isUserInteractionEnabled = true
//        imageView.backgroundColor = .blue
//
//        return imageView
//    }()
//
//    lazy var imagePicker : UIImagePickerController = {
//        let imagePicker = UIImagePickerController()
//        imagePicker.delegate = self
//        imagePicker.sourceType = .photoLibrary
//        imagePicker.allowsEditing = true
//        return imagePicker
//    }()
//
//    var RegistTF: UITextField = {
//        let tf = UITextField()
//        tf.translatesAutoresizingMaskIntoConstraints = false
//        tf.backgroundColor = .systemGray5
//        tf.layer.cornerRadius = 12
//        tf.textAlignment = .right
//        tf.placeholder = "تفضل بإدخال اسم العيادة"
//        return tf
//    }()
//    var passwordTF: UITextField = {
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
//        $0.tintColor = .systemTeal
//        $0.layer.cornerRadius = 20
//        $0.titleLabel?.font = .systemFont(ofSize: 20, weight: .light)
//        $0.translatesAutoresizingMaskIntoConstraints = false
//        $0.addTarget(self, action: #selector(saveButtone), for: .touchUpInside)
//        return $0
//    }(UIButton())
//
//    let Button1 : UIButton = {
//        $0.backgroundColor = .white
//        $0.setTitle(NSLocalizedString("خروج", comment: ""), for: .normal)
//        $0.setTitleColor(UIColor.black, for: .normal)
//        $0.layer.cornerRadius = 22.5
//        $0.translatesAutoresizingMaskIntoConstraints = false
//        $0.addTarget(self, action: #selector(signOut), for: .touchUpInside)
//        return $0
//    }(UIButton())
//
//    @objc func OpenImage(_ sender: Any) {
//        let pick = UIImagePickerController()
//        pick.allowsEditing = true
//        pick.delegate = self
//        present(pick, animated: true)
//    }
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        let image = (info[.editedImage] ?? info[.originalImage]) as? UIImage;
//        imageView.image = image
//        dismiss(animated: false)
//    }
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
//        imageView.addGestureRecognizer(tapRecognizer)
//
//
//        view.backgroundColor = .white
//        view.addSubview(imageView)
//        view.addSubview(RegistTF)
//        view.addSubview(passwordTF)
//        //view.addSubview(SaveBtn)
//        view.addSubview(datePicker)
//        view.addSubview(Button)
//        view.addSubview(Button1)
//
//        NSLayoutConstraint.activate([
//            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
//            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            imageView.heightAnchor.constraint(equalToConstant: 250),
//            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor,multiplier: 100/100)
//        ])
//
//        NSLayoutConstraint.activate([
//            RegistTF.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 240),
//            RegistTF.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 32),
//            RegistTF.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -32),
//            RegistTF.heightAnchor.constraint(equalToConstant: 40),
//
//            passwordTF.topAnchor.constraint(equalTo: RegistTF.bottomAnchor, constant: 24),
//            passwordTF.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 32),
//            passwordTF.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -32),
//            passwordTF.heightAnchor.constraint(equalToConstant: 40),
//
//
//            datePicker.topAnchor.constraint(equalTo: passwordTF.bottomAnchor, constant: 50),
//            datePicker.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 32),
//            datePicker.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -32),
//           datePicker.heightAnchor.constraint(equalToConstant: 40),
//
//
//            Button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            Button.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 30),
//            Button.heightAnchor.constraint(equalToConstant: 48),
//            Button.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -200),
//
//
//            Button1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            Button1.topAnchor.constraint(equalTo: Button.bottomAnchor, constant: 30),
//            Button1.heightAnchor.constraint(equalToConstant: 48),
//            Button1.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -200),
//
//
//            ])
//
//    }
//
//    @objc func imageTapped() {
//        print("Image tapped")
//        present(imagePicker, animated: true)
//    }
//
//    @objc func dateChanged() {
//
//        print("New date = \(datePicker.date)")
//    }
//
//    @objc func saveButtone() {
//        guard let currentUserID = Auth.auth().currentUser?.uid else {return}
//        Firestore.firestore().document("users/\(currentUserID)").setData([
//            "name" :RegistTF.text as Any,
//            "date" :datePicker.date as Any,
//             "id" : currentUserID,
//
//        ],merge: true)
//        let alert1 = UIAlertController(
//            title: (""),
//            message: "هل أنت متأكد من حفظ معلومات حجزك؟",
//            preferredStyle: .alert)
//        alert1.addAction(
//            UIAlertAction(
//                title: "OK",
//                style: .default,
//                handler: { action in
//                    print("OK")
//                }
//            )
//            )
//        present(alert1, animated: true, completion: nil)
//           }
//
//    // Use error handling
//    @objc func signOut() {
//        let firebaseAuth = Auth.auth()
//        do {
//            try firebaseAuth.signOut()
//            dismiss(animated: true, completion: nil)
//        } catch let signOutError as NSError {
//            print ("Error signing out: \(signOutError.localizedDescription)")
//        }
//        }
//
//        }
//
//
//
//
//
////import UIKit
////import FirebaseFirestore
////import Firebase
////
////
////class ProfileVC : UIViewController, UIImagePickerControllerDelegate,UITextFieldDelegate, UINavigationControllerDelegate{
////
////
////
////    lazy var profileImage: UIImageView = {
////        let view = UIImageView()
////        view.translatesAutoresizingMaskIntoConstraints = false
////        view.backgroundColor = .white
////        view.layer.cornerRadius = 25
////        view.isUserInteractionEnabled = true
////        return view
////    }()
////    lazy var imagePicker : UIImagePickerController = {
////        let imagePicker = UIImagePickerController()
////        imagePicker.delegate = self
////        imagePicker.sourceType = .photoLibrary
////        imagePicker.allowsEditing = true
////        return imagePicker
////    }()
////    let name : UITextField = {
////        $0.translatesAutoresizingMaskIntoConstraints = false
////        $0.placeholder = "Write your name"
////        $0.backgroundColor = .init(white: 0.85, alpha: 1)
////        $0.layer.cornerRadius = 22.5
////        $0.textAlignment = .center
////        return $0
////    }(UITextField())
////    let status : UITextField = {
////        $0.translatesAutoresizingMaskIntoConstraints = false
////        $0.placeholder = "Write your status"
////        $0.backgroundColor = .init(white: 0.85, alpha: 1)
////        $0.layer.cornerRadius = 22.5
////        $0.textAlignment = .center
////        return $0
////    }(UITextField())
////    let Button : UIButton = {
////        $0.backgroundColor = .black
////        $0.setTitle("Save", for: .normal)
////        $0.tintColor = .black
////        $0.layer.cornerRadius = 22.5
////        $0.translatesAutoresizingMaskIntoConstraints = false
////        $0.addTarget(self, action: #selector(haB), for: .touchUpInside)
////        return $0
////    }(UIButton())
////    let Button1 : UIButton = {
////        $0.backgroundColor = .white
////        $0.setTitle("sign out", for: .normal)
////        $0.setTitleColor(UIColor.black, for: .normal)
////        $0.layer.cornerRadius = 22.5
////        $0.translatesAutoresizingMaskIntoConstraints = false
////        $0.addTarget(self, action: #selector(signOut), for: .touchUpInside)
////        return $0
////    }(UIButton())
////
////    @objc func OpenImage(_ sender: Any) {
////        let pick = UIImagePickerController()
////        pick.allowsEditing = true
////        pick.delegate = self
////        present(pick, animated: true)
////    }
////    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
////        let image = (info[.editedImage] ?? info[.originalImage]) as? UIImage;
////        profileImage.image = image
////        dismiss(animated: false)
////    }
////
////    override func viewDidLoad() {
////        super.viewDidLoad()
////
////        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
////        profileImage.addGestureRecognizer(tapRecognizer)
////
////        view.backgroundColor = .white
////        profileImage.image = .init(systemName: "455")
////        profileImage.tintColor = UIColor(ciColor: .black)
////        profileImage.layer.masksToBounds = true
////        profileImage.layer.cornerRadius = 100
////        profileImage.contentMode = .scaleAspectFit
////        profileImage.translatesAutoresizingMaskIntoConstraints = false
////        view.addSubview(profileImage)
////        NSLayoutConstraint.activate([
////            profileImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
////            profileImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
////            profileImage.heightAnchor.constraint(equalToConstant: 200),
////            profileImage.widthAnchor.constraint(equalToConstant: 200)
////        ])
////        name.font = .boldSystemFont(ofSize: 23)
////        name.translatesAutoresizingMaskIntoConstraints = false
////        view.addSubview(name)
////        NSLayoutConstraint.activate([
////            name.topAnchor.constraint(equalTo: view.topAnchor,constant: 440),
////            name.leftAnchor.constraint(equalTo: view.leftAnchor , constant: 50),
////            name.heightAnchor.constraint(equalToConstant: 40),
////            name.widthAnchor.constraint(equalToConstant: 290),
////            //name.trailingAnchor.constraint(equalTo: view.trailingAnchor , constant: 100)
////        ])
////        status.textColor = .green
////        status.translatesAutoresizingMaskIntoConstraints = false
////        view.addSubview(status)
////        NSLayoutConstraint.activate([
////            status.topAnchor.constraint(equalTo: view.topAnchor,constant: 485),
////            status.leftAnchor.constraint(equalTo: view.leftAnchor , constant: 50),
////            status.heightAnchor.constraint(equalToConstant: 40),
////            status.widthAnchor.constraint(equalToConstant: 290),
////        ])
////        view.addSubview(Button)
////        NSLayoutConstraint.activate([
////            Button.topAnchor.constraint(equalTo: view.topAnchor,constant: 570),
////            //      Button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 500),
////            Button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
////            Button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
////            Button.heightAnchor.constraint(equalToConstant: 55)
////        ])
////        view.addSubview(Button1)
////        NSLayoutConstraint.activate([
////            Button1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 450),
////            Button1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
////            Button1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
////            Button1.heightAnchor.constraint(equalToConstant: 70)
////        ])
////
////
////
////        guard let currentUserID = Auth.auth().currentUser?.uid else {return}
////        Firestore.firestore()
////            .document("users/\(currentUserID)")
////            .addSnapshotListener{ doucument, error in
////                if error != nil {
////                    print (error as Any)
////                    return
////                }
////                self.name.text = doucument?.data()?["name"] as? String
////                self.status.text = doucument?.data()?["status"] as? String
////                self.profileImage.image = doucument?.data()?["image"] as? UIImage
////
////            }
////    }
////
////
////    @objc func imageTapped() {
////        print("Image tapped")
////        present(imagePicker, animated: true)
////    }
////
////    @objc func haB() {
////        guard let currentUserID = Auth.auth().currentUser?.uid else {return}
////        Firestore.firestore().document("users/\(currentUserID)").setData([
////            "name" : name.text as Any,
////            "id" : currentUserID,
////            "status" :status.text as Any,
////            "image" : "\(profileImage.image)" as Any,
////        ],merge: true)
////        let alert1 = UIAlertController(
////            title: ("Saved"),
////            message: "Saved update data",
////            preferredStyle: .alert)
////        alert1.addAction(
////            UIAlertAction(
////                title: "OK",
////                style: .default,
////                handler: { action in
////                    print("OK")
////                }
////            )
////        )
////        present(alert1, animated: true, completion: nil)
////    }
////    @objc func signOut() {
////        let firebaseAuth = Auth.auth()
////        do {
////            try firebaseAuth.signOut()
////            dismiss(animated: true, completion: nil)
////        } catch let signOutError as NSError {
////            print ("Error signing out: \(signOutError.localizedDescription)")
////        }
////    }
////}
////
