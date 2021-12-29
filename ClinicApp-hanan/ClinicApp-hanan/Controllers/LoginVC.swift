//
//  LoginVC.swift
//  ClinicApp-hanan
//
//  Created by  HANAN ASIRI on 17/04/1443 AH.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class LoginVC: UIViewController {
    var name = UITextField()
    let segmentedControl = UISegmentedControl()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        name.placeholder = "Name"
        name.text = "Hanan"
        name.textAlignment = .center
        name.translatesAutoresizingMaskIntoConstraints = false
        name.textColor = .black
        name.font = UIFont.systemFont(ofSize: 18)
        name.backgroundColor = .systemGray5
        name.layer.cornerRadius = 16
        
    }
    
    
        lazy var imageView: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named:"BB")
            imageView.contentMode = .scaleAspectFill
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.backgroundColor = .black
            imageView.layer.cornerRadius = 10
            return imageView
        }()
    let email : UITextField = {
        $0.placeholder = "Enter your Email"
        $0.text = "Hanan@gmail.com"
        $0.textAlignment = .center
        $0.backgroundColor = .init(white: 0.90, alpha: 1)
        $0.layer.cornerRadius = 16
        return $0
    }(UITextField())
    
   //  Closure for name of Email..
    
        var getName: (String) -> (String) = { nameofEmail in
            if nameofEmail != "HananY" {
               return "welcome \(nameofEmail)"
            }
            return "Hello to \(nameofEmail)"
            }
    let password : UITextField = {
        $0.placeholder = "Enter your password"
        $0.text = "123456"
        $0.isSecureTextEntry = true
        $0.textAlignment = .center
        $0.backgroundColor = .init(white: 0.90, alpha: 1)
        $0.layer.cornerRadius = 16
        return $0
    }(UITextField())
    
    let logInButton : UIButton = {
        $0.setTitle(NSLocalizedString("دخول", comment: "") , for: .normal)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        $0.backgroundColor = .systemTeal
        $0.layer.cornerRadius = 16
        $0.tintColor = .white
        $0.addTarget(self, action: #selector(login), for: .touchUpInside)
        return $0
    }(UIButton(type: .system))
    
    let signUp : UIButton = {
        $0.setTitle(NSLocalizedString("سجل دخولك", comment: "") , for: .normal)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        $0.backgroundColor = .blue
        $0.layer.cornerRadius = 16
        $0.tintColor = .white
        $0.addTarget(self, action: #selector(SignupVC), for: .touchUpInside)
        return $0
    }(UIButton(type: .system))
    
    // use StackView
    let stackView : UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.distribution = .fillEqually
        $0.spacing = 10
        return $0
    }(UIStackView())
    
    @objc func login() {
        if let email = email.text, email.isEmpty == false,
           let password = password.text, password.isEmpty == false {
            Auth.auth().signIn(withEmail: email, password: password) { result, error in
                if error == nil {
                    // go to main vc
                    let vc = UINavigationController(rootViewController: TabVC())
                    vc.modalTransitionStyle = .crossDissolve
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true, completion: nil)
                } else {
                    print(error?.localizedDescription)
               }
               }
               }
               }
    @objc func SignupVC(_ sender: Any) {
        
        if let email = email.text, email.isEmpty == false,
           let password = password.text, password.isEmpty == false {
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                if error == nil {
                    // go to main vc
                    let vc = UINavigationController(rootViewController: TabVC())
                    vc.modalTransitionStyle = .crossDissolve
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true, completion: nil)
                } else {
                    print(error?.localizedDescription )
                }
                guard let currentUserID = Auth.auth().currentUser?.uid else {return}
                Firestore.firestore().document("users/\(currentUserID)").setData([
                    "name" : self.name.text as Any,
                    "id" : currentUserID,
                    "email" : self.email.text as Any,
                ])
              }
              }
              }
              }
  // use  extension
    extension LoginVC {
    func setupUI() {
        view.backgroundColor = .white
        view.addSubview(stackView)
        stackView.addArrangedSubview(segmentedControl)
        stackView.addArrangedSubview(name)
        stackView.addArrangedSubview(email)
        stackView.addArrangedSubview(password)
        stackView.addArrangedSubview(logInButton)
        stackView.addArrangedSubview(signUp)
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 250),
            imageView.widthAnchor.constraint(equalTo: view.widthAnchor),

            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            imageView.widthAnchor.constraint(equalToConstant: 200),
        ])
        
        segmentedControl.insertSegment(withTitle: "Rigester", at: 0, animated: true)
        segmentedControl.setTitle(NSLocalizedString("تسجيل الدخول", comment: ""), forSegmentAt: 0)
        segmentedControl.insertSegment(withTitle: "Login", at: 1, animated: true)
        segmentedControl.setTitle(NSLocalizedString("دخول", comment: ""), forSegmentAt: 1)
        segmentedControl.addTarget(self, action: #selector(Segment), for: .valueChanged)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 250),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            stackView.heightAnchor.constraint(equalToConstant: 250)
        ])
    }
    
    @objc func Segment(_ sender: Any) {
        
        // useing switch conditionals
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            name.isHidden = false
            signUp.isHidden = false
            logInButton.isHidden = true
        case 1:
            name.isHidden = true
            // conf.isHidden = true
            signUp.isHidden = true
            logInButton.isHidden = false
        default:
            break;
    }
    }
    }
