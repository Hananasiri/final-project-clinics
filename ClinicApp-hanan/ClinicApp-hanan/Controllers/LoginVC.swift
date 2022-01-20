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
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "0000")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        name.placeholder = "Name"
        name.text = "HananYahia"
        name.textAlignment = .center
        name.translatesAutoresizingMaskIntoConstraints = false
        name.textColor = .black
        name.font = UIFont.systemFont(ofSize: 18)
        name.backgroundColor = .init(white: 0.90, alpha: 1)
        name.layer.cornerRadius = 16
        
    }

    let email : UITextField = {
        $0.placeholder = "Enter your Email"
        $0.text = "HananYahia@gmail.com"
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
        $0.backgroundColor = .systemBlue
        $0.layer.cornerRadius = 16
        $0.tintColor = .black
        $0.addTarget(self, action: #selector(login), for: .touchUpInside)
        return $0
    }(UIButton(type: .system))
    
    let signUp : UIButton = {
        $0.setTitle(NSLocalizedString("سجل دخولك", comment: "") , for: .normal)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        $0.backgroundColor = .systemTeal
        $0.layer.cornerRadius = 16
        $0.tintColor = .black
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
        //view.addSubview(imageView)
        
        
        segmentedControl.insertSegment(withTitle: "Rigester", at: 0, animated: true)
        segmentedControl.setTitle(NSLocalizedString("تسجيل الدخول", comment: ""), forSegmentAt: 0)
        segmentedControl.insertSegment(withTitle: "Login", at: 1, animated: true)
        segmentedControl.setTitle(NSLocalizedString("دخول", comment: ""), forSegmentAt: 1)
        segmentedControl.addTarget(self, action: #selector(Segment), for: .valueChanged)
        segmentedControl.backgroundColor = .systemGray4

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 540),
            stackView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -160),
//          stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
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
            signUp.isHidden = true
            logInButton.isHidden = false
        default:
            break;
    }
    }
    }
