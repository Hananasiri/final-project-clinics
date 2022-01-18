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
import FirebaseStorage
import AVFoundation
import UIKit

class ProfileVC: UIViewController , UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    let storage = Storage.storage().reference()
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
    lazy var myLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = NSLocalizedString("الملف الشخصي" , comment: "")
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 30 , weight: .bold)
        label.textColor = .label
        return label
    }()

  //  Use image views
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .white
        //imageView.image = UIImage(named: "BB")
        imageView.layer.cornerRadius = 100
        imageView.layer.masksToBounds = true
        imageView.isUserInteractionEnabled = true
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
        tf.backgroundColor = .init(white: 0.90, alpha: 1)
        tf.layer.cornerRadius = 12
        tf.textAlignment = .right
        tf.placeholder = NSLocalizedString("تفضل بإدخال اسمك", comment: "")
        return tf
    }()
    var addressTF: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.layer.cornerRadius = 12
        tf.backgroundColor = .init(white: 0.90, alpha: 1)
        tf.textAlignment = .right
        tf.placeholder = NSLocalizedString("تفضل بإدخال عنوانك", comment: "")
        return tf
    }()
    
       lazy var button: UIButton = {
       let bAction = UIButton()
        bAction.backgroundColor = .systemTeal
        bAction.tintColor = .black
        bAction.setTitleColor(UIColor.black, for: .normal)
        bAction.setTitle(NSLocalizedString("تغيير اللغة", comment: ""), for: .normal)
        bAction.translatesAutoresizingMaskIntoConstraints = false
        bAction.layer.cornerRadius = 5
        bAction.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
       return bAction
        }()

    
    let Button1 : UIButton = {
        //$0.backgroundColor = .white
        $0.setTitle(NSLocalizedString("خروج", comment: ""), for: .normal)
        $0.setTitleColor(UIColor.black, for: .normal)
        $0.layer.cornerRadius = 4
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addTarget(self, action: #selector(signOut), for: .touchUpInside)
        return $0
    }(UIButton())
    
    lazy var addserviceButton: TransitionButton = {
        let b = TransitionButton()
        b.addTarget(self, action: #selector(addService), for: .touchUpInside)
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle(NSLocalizedString("لصحة أسنان أفضل", comment: ""), for: .normal)
        b.setTitleColor(UIColor.black, for: .normal)
        b.layer.cornerRadius = 5
       // b.addTarget(self, action: #selector(adviceButtone), for: .touchUpInside)
        b.backgroundColor = .systemGray2
        return b
    }()
    
    @objc func OpenImage(_ sender: Any) {
        let pick = UIImagePickerController()
        pick.allowsEditing = true
        pick.delegate = self
        present(pick, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

        picker.dismiss(animated: true, completion: nil)
            guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {
              return
            }
            guard let imageData = image.pngData() else {
              return
            }
            storage.child("image/file.png").putData(imageData,
                                metadata: nil,
                                completion: {_, error in
                        guard error == nil else {
                          print("Faild to upload")
                               return
                          }
          self.storage.child("image/file.png").downloadURL(completion: { url, error in
            guard let url = url, error == nil else {
              return
            }
            let urlString = url.absoluteString
            DispatchQueue.main.async {
              self.imageView.image = image
            }
            print("Download URL: \(urlString)")
            UserDefaults.standard.set(urlString, forKey: "url")
              })
            })
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss (animated: true, completion: nil)
      }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //adviceButtone()
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "0000")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        view.backgroundColor = UIColor(named: "bgColor")
        // title = NSLocalizedString("بياناتي", comment: "")
        
        let name = UserDefaults.standard.value(forKey: "NameTF") as? String
        NameTF.text = name
        
        let address = UserDefaults.standard.value(forKey: "addressTF") as? String
        addressTF.text = address
       
        let image = UserDefaults.standard.value(forKey: "imageView") as? String
        
        //  gesture recognizer
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        imageView.addGestureRecognizer(tapRecognizer)
        
        view.addSubview(myLabel)
        view.addSubview(imageView)
        view.addSubview(NameTF)
        view.addSubview(addressTF)
        view.addSubview(button)
        view.addSubview(Button1)
        view.addSubview(addserviceButton)
        
        NSLayoutConstraint.activate([
            
            myLabel.topAnchor.constraint(equalTo: view.topAnchor,constant: 120),
            myLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myLabel.heightAnchor.constraint(equalToConstant: 30),
            myLabel.widthAnchor.constraint(equalToConstant: 300),
         
    
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 180),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            imageView.widthAnchor.constraint(equalToConstant: 200),


            NameTF.topAnchor.constraint(equalTo: view.topAnchor,constant: 420),
            NameTF.leftAnchor.constraint(equalTo: view.leftAnchor , constant: 50),
            NameTF.heightAnchor.constraint(equalToConstant: 40),
            NameTF.widthAnchor.constraint(equalToConstant: 290),

            addressTF.topAnchor.constraint(equalTo: NameTF.bottomAnchor, constant: 24),
            addressTF.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
            addressTF.heightAnchor.constraint(equalToConstant: 40),
            addressTF.widthAnchor.constraint(equalToConstant: 290),

            
            button.topAnchor.constraint(equalTo: view.topAnchor,constant: 560),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.heightAnchor.constraint(equalToConstant: 35),
            button.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -200),
            
            
            addserviceButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addserviceButton.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 20),
            addserviceButton.heightAnchor.constraint(equalToConstant: 35),
            addserviceButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -200),

            
            Button1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            Button1.topAnchor.constraint(equalTo: addserviceButton.bottomAnchor, constant: 40),
            Button1.heightAnchor.constraint(equalToConstant: 35),
            Button1.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -200),
            
            ])
     
        
        guard let urlstring = UserDefaults.standard.value(forKey: "url") as? String,
              let url = URL (string: urlstring) else {
                return
            }
           let task = URLSession.shared.dataTask(with: url, completionHandler: {
              data, _, error in
                guard let data = data, error == nil else {
                  return
                }
             DispatchQueue.main.async {
               let image = UIImage(data: data)
               self.imageView.image = image
             }
            })
            task.resume()

      }
    
    @objc func addService() {
      
        guard let currentUserID = Auth.auth().currentUser?.uid else {return}
        Firestore.firestore().document("usersdata/\(currentUserID)").setData([
            "name" : NameTF.text as Any,
            "addres" :addressTF.text as Any,
            "image" : "\(String(describing: imageView.image))" as Any,
        ],merge: true)
        
        
        // use Animation
        addserviceButton.startAnimation()
        DispatchQueue.main.asyncAfter(deadline: .now()+2) {
            self.addserviceButton.stopAnimation(animationStyle: .shake , revertAfterDelay: 1)
        DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
            self.addserviceButton.stopAnimation(animationStyle: .shake, revertAfterDelay: 1)
            let newVC = VideoVC()
            self.navigationController?.pushViewController(newVC,animated: true)
        }
        }
        let name = NameTF.text
        UserDefaults.standard.set(name,forKey: "NameTF")
        
        let address = addressTF.text
        UserDefaults.standard.set(address,forKey: "addressTF")
        
        let image = imageView.image
        UserDefaults.standard.set(address,forKey: "imageView")
        
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
    @objc func buttonAction() {
        guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
                return
               }
               if UIApplication.shared.canOpenURL(settingsUrl) {
                UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
                print("Settings opened: \(success)")
                })
               }
      print("Button tapped")
    }

    }
        


