//
//  ProfileVC.swift
//  ClinicApp-hanan
//
//  Created by  HANAN ASIRI on 04/05/1443 AH.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth
import TransitionButton

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

    var NameTF: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.backgroundColor = .systemGray5
        tf.layer.cornerRadius = 12
        tf.textAlignment = .right
        tf.placeholder = "تفضل بإدخال اسمك"
        return tf
    }()
    var addressTF: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.layer.cornerRadius = 12
        tf.backgroundColor = .systemGray5
        tf.textAlignment = .right
        tf.placeholder = "تفضل بإدخال عنوانك"
        return tf
    }()

    
    let Button1 : UIButton = {
        $0.backgroundColor = .white
        $0.setTitle(NSLocalizedString("خروج", comment: ""), for: .normal)
        $0.setTitleColor(UIColor.black, for: .normal)
        $0.layer.cornerRadius = 22.5
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addTarget(self, action: #selector(signOut), for: .touchUpInside)
        return $0
    }(UIButton())
    
    lazy var addserviceButton: TransitionButton = {
        let b = TransitionButton()
        b.addTarget(self, action: #selector(addService), for: .touchUpInside)
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle(NSLocalizedString("مواعيدي", comment: ""), for: .normal)
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
        view.backgroundColor = UIColor(named: "bgColor")
        
        let name = UserDefaults.standard.value(forKey: "NameTF") as? String
        NameTF.text = name
        
        let address = UserDefaults.standard.value(forKey: "addressTF") as? String
        addressTF.text = address
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        imageView.addGestureRecognizer(tapRecognizer)
        
       
        view.backgroundColor = .white
        view.addSubview(imageView)
        view.addSubview(NameTF)
        view.addSubview(addressTF)
        view.addSubview(Button1)
        view.addSubview(addserviceButton)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 250),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor,multiplier: 100/100)
        ])

        NSLayoutConstraint.activate([

            NameTF.topAnchor.constraint(equalTo: view.topAnchor,constant: 440),
            NameTF.leftAnchor.constraint(equalTo: view.leftAnchor , constant: 50),
            NameTF.heightAnchor.constraint(equalToConstant: 40),
            NameTF.widthAnchor.constraint(equalToConstant: 290),

            addressTF.topAnchor.constraint(equalTo: NameTF.bottomAnchor, constant: 24),
            addressTF.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
            addressTF.heightAnchor.constraint(equalToConstant: 40),
            addressTF.widthAnchor.constraint(equalToConstant: 290),

          
            addserviceButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 120),
            addserviceButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200),
            addserviceButton.widthAnchor.constraint(equalToConstant: 150),
            addserviceButton.heightAnchor.constraint(equalToConstant: 48),

            
            Button1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            Button1.topAnchor.constraint(equalTo: addserviceButton.bottomAnchor, constant: 30),
            Button1.heightAnchor.constraint(equalToConstant: 48),
            Button1.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -200),
            
            
            ])

      }
    
    @objc func addService() {
        
        // use animation
        addserviceButton.startAnimation()
        DispatchQueue.main.asyncAfter(deadline: .now()+2) {
            self.addserviceButton.stopAnimation(animationStyle: .expand, revertAfterDelay: 1)
        DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
            let newServiceVC = NewServiceVC()
            self.present( newServiceVC, animated: true, completion: nil)
        }
        }
        
        let name = NameTF.text
        UserDefaults.standard.set(name,forKey: "NameTF")
        
        let address = addressTF.text
        UserDefaults.standard.set(address,forKey: "addressTF")
        
    }
    
    @objc func imageTapped() {
        print("Image tapped")
        present(imagePicker, animated: true)
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


