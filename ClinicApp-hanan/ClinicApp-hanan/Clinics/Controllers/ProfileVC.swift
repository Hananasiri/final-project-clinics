//
//  ProfileVC.swift
//  ClinicApp-hanan
//
//  Created by  HANAN ASIRI on 04/05/1443 AH.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

class ProfileVC: UIViewController , UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    // Add stack view ..
    let stackView = UIStackView()
    
    func setStackView() {
        let firstView = stackView.arrangedSubviews[0]
        firstView.isHidden = true
        
    }
    func upStackView() {
        if stackView.axis == .horizontal {
        stackView.axis = .vertical
    }
    else {
        stackView.axis = .horizontal
    }
    }

  
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "BB")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        imageView.backgroundColor = .blue

        return imageView
    }()

    lazy var imagePicker : UIImagePickerController = {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        return imagePicker
    }()

    var RegistTF: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.backgroundColor = .systemGray5
        tf.layer.cornerRadius = 12
        tf.textAlignment = .right
        tf.placeholder = "تفضل بإدخال اسم العيادة"
        return tf
    }()
    var passwordTF: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.isSecureTextEntry = false
        tf.layer.cornerRadius = 12
        tf.backgroundColor = .systemGray5
        tf.textAlignment = .right
        tf.placeholder = "تفضل بإدخال رقم جوالك"
        return tf
    }()


    let Button : UIButton = {
        $0.backgroundColor = .systemTeal
        $0.setTitle(NSLocalizedString("حفظ معلوماتك", comment: ""), for: .normal)
        $0.tintColor = .blue
        $0.layer.cornerRadius = 20
        $0.titleLabel?.font = .systemFont(ofSize: 20, weight: .light)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addTarget(self, action: #selector(saveButtone), for: .touchUpInside)
        return $0
    }(UIButton())
    
    let Button1 : UIButton = {
        $0.backgroundColor = .white
        $0.setTitle(NSLocalizedString("خروج", comment: ""), for: .normal)
        $0.setTitleColor(UIColor.black, for: .normal)
        $0.layer.cornerRadius = 22.5
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addTarget(self, action: #selector(signOut), for: .touchUpInside)
        return $0
    }(UIButton())
    
    lazy var addserviceButton: UIButton = {
        let b = UIButton()
        b.addTarget(self, action: #selector(addService), for: .touchUpInside)
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle(" مواعيدي", for: .normal)
        b.layer.cornerRadius = 20
        b.backgroundColor = .blue
        return b
    }()
    
    @objc func OpenImage(_ sender: Any) {
        let pick = UIImagePickerController()
        pick.allowsEditing = true
        pick.delegate = self
        present(pick, animated: true)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = (info[.editedImage] ?? info[.originalImage]) as? UIImage;
        imageView.image = image
        dismiss(animated: false)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        imageView.addGestureRecognizer(tapRecognizer)
        
       
        view.backgroundColor = .white
        view.addSubview(imageView)
        view.addSubview(RegistTF)
        view.addSubview(passwordTF)
        //view.addSubview(SaveBtn)
        view.addSubview(Button)
        view.addSubview(Button1)
        view.addSubview(addserviceButton)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 250),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor,multiplier: 100/100)
        ])

        NSLayoutConstraint.activate([
            RegistTF.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 240),
            RegistTF.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 32),
            RegistTF.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -32),
            RegistTF.heightAnchor.constraint(equalToConstant: 40),

            passwordTF.topAnchor.constraint(equalTo: RegistTF.bottomAnchor, constant: 24),
            passwordTF.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 32),
            passwordTF.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -32),
            passwordTF.heightAnchor.constraint(equalToConstant: 40),

            
          
            addserviceButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 200),
            addserviceButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -250),
            addserviceButton.widthAnchor.constraint(equalToConstant: 150),
            addserviceButton.heightAnchor.constraint(equalToConstant: 48),


            Button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            Button.topAnchor.constraint(equalTo: addserviceButton.bottomAnchor, constant: 30),
            Button.heightAnchor.constraint(equalToConstant: 48),
            Button.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -200),
            
            
            Button1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            Button1.topAnchor.constraint(equalTo: Button.bottomAnchor, constant: 30),
            Button1.heightAnchor.constraint(equalToConstant: 48),
            Button1.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -200),
            ])
 

            }
    
    @objc func addService() {
        let newServiceVC = NewServiceVC()
        present( newServiceVC, animated: true, completion: nil)
    }
    
    @objc func imageTapped() {
        print("Image tapped")
        present(imagePicker, animated: true)
    }

    @objc func saveButtone() {
        guard let currentUserID = Auth.auth().currentUser?.uid else {return}
        Firestore.firestore().document("users/\(currentUserID)").setData([
            "name" :RegistTF.text as Any,
             "id" : currentUserID,

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
    
    // Use error handling
    @objc func signOut() {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            dismiss(animated: true, completion: nil)
        } catch let signOutError as NSError {
            print ("Error signing out: \(signOutError.localizedDescription)")
        }
        }

        }


