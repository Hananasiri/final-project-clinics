//
//  LoginVC.swift
//  ClinicApp-hanan
//
//  Created by  HANAN ASIRI on 17/04/1443 AH.
//
//import UIKit

import UIKit
import FirebaseAuth

class LoginVC: UIViewController {
   

    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named:"ImageSet")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .black
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    var emailTF: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.backgroundColor = .systemGray5
        tf.layer.cornerRadius = 12
        tf.text = "Hanan@gmail.com"
        return tf
    }()
    
    // Closure for name of Email..
    
    var getName: (String) -> (String) = { nameofEmail in
        if nameofEmail != "HananY" {
           return "welcome \(nameofEmail)"
        }
        return "Hello to \(nameofEmail)"
        }

    var passwordTF: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.isSecureTextEntry = true
        tf.layer.cornerRadius = 12
        tf.backgroundColor = .systemGray5
        tf.text = "123456"
        return tf
    }()
    var loginBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle(NSLocalizedString("دخول", comment: ""), for: .normal)
        btn.backgroundColor = .systemTeal
        btn.layer.cornerRadius = 12
        btn.addTarget(self, action: #selector(loginBtnPressed), for: .touchUpInside)
        return btn
    }()
    var registerBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle(NSLocalizedString("تسجيل الدخول" , comment: ""), for: .normal)
        btn.backgroundColor = .blue
        btn.layer.cornerRadius = 12
        btn.addTarget(self, action: #selector(registerBtnPressed), for: .touchUpInside)
        return btn
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPurple
        
      // useing switch for light and dark mode ..
        let lable = UILabel()
        switch traitCollection.userInterfaceStyle {
        case .unspecified:
            lable.text = "Light mode"
        case .dark:
            lable.text = "Dark mode"
        @unknown default:
            lable.text = "unspecified"
        }
        
        view.backgroundColor = .white
        
        view.addSubview(emailTF)
        view.addSubview(passwordTF)
        view.addSubview(loginBtn)
        view.addSubview(registerBtn)
        view.addSubview(imageView)

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 250),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor,multiplier: 100/100)
        ])
        NSLayoutConstraint.activate([
            emailTF.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 300),
            emailTF.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 32),
            emailTF.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -32),
            emailTF.heightAnchor.constraint(equalToConstant: 40),
            
           
            passwordTF.topAnchor.constraint(equalTo: emailTF.bottomAnchor, constant: 24),
            passwordTF.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 32),
            passwordTF.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -32),
            passwordTF.heightAnchor.constraint(equalToConstant: 40),
            
            loginBtn.topAnchor.constraint(equalTo: passwordTF.bottomAnchor, constant: 48),
            loginBtn.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 32),
            loginBtn.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -32),
            loginBtn.heightAnchor.constraint(equalToConstant: 40),
            
            
            registerBtn.topAnchor.constraint(equalTo: loginBtn.bottomAnchor, constant: 24),
            registerBtn.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 32),
            registerBtn.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -32),
            registerBtn.heightAnchor.constraint(equalToConstant: 40),
        ])
        }
    
    @objc func registerBtnPressed() {
        let email = emailTF.text ?? ""
        let password = passwordTF.text ?? ""
        
        if email.isEmpty || password.isEmpty {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if error != nil {
                print(error as Any)
                return
            }
            
            self.present(TabVC(), animated: true, completion: nil)
        }
        
    }
    @objc func loginBtnPressed() {
        let email = emailTF.text ?? ""
        let password = passwordTF.text ?? ""
        
        if email.isEmpty || password.isEmpty {
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if error != nil {
                print(error as Any)
                return
            }
            
            self.present(TabVC(), animated: true, completion: nil)
    }
        
    }

    }

