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
        label.text = NSLocalizedString("بياناتي" , comment: "")
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 28 , weight: .bold)
        //label.backgroundColor = .blue
        return label
    }()
  //  Use image views
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "BB")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        imageView.backgroundColor = .white

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
        tf.placeholder = NSLocalizedString("تفضل بإدخال اسمك", comment: "")
        return tf
    }()
    var addressTF: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.layer.cornerRadius = 12
        tf.backgroundColor = .systemGray5
        tf.textAlignment = .right
        tf.placeholder = NSLocalizedString("تفضل بإدخال عنوانك", comment: "")
        return tf
    }()

    
    let Button1 : UIButton = {
        $0.backgroundColor = .systemGray2
        $0.setTitle(NSLocalizedString("خروج", comment: ""), for: .normal)
        $0.setTitleColor(UIColor.black, for: .normal)
        $0.layer.cornerRadius = 16
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addTarget(self, action: #selector(signOut), for: .touchUpInside)
        return $0
    }(UIButton())
    
    lazy var addserviceButton: TransitionButton = {
        let b = TransitionButton()
        b.addTarget(self, action: #selector(addService), for: .touchUpInside)
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle(NSLocalizedString("حفظ", comment: ""), for: .normal)
        b.setTitleColor(UIColor.black, for: .normal)
        b.layer.cornerRadius = 16
        b.backgroundColor = .systemTeal
        return b
    }()
    
    @objc func OpenImage(_ sender: Any) {
        let pick = UIImagePickerController()
        pick.allowsEditing = true
        pick.delegate = self
        present(pick, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        let image = (info[.editedImage] ?? info[.originalImage]) as? UIImage;
//        imageView.image = image
//        dismiss(animated: false)
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
        view.addSubview(Button1)
        view.addSubview(addserviceButton)
        
        NSLayoutConstraint.activate([
         myLabel.topAnchor.constraint(equalTo: view.topAnchor,constant: 120),
         myLabel.leftAnchor.constraint(equalTo: view.leftAnchor , constant: 70),
         myLabel.heightAnchor.constraint(equalToConstant: 30),
         myLabel.widthAnchor.constraint(equalToConstant: 300),
         ])
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 170),
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

          
//            addserviceButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 120),
//            addserviceButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200),
//            addserviceButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -200),
//            addserviceButton.heightAnchor.constraint(equalToConstant: 48),
            
            addserviceButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addserviceButton.topAnchor.constraint(equalTo: addressTF.bottomAnchor, constant: 50),
            addserviceButton.heightAnchor.constraint(equalToConstant: 40),
            addserviceButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -200),

            
            Button1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            Button1.topAnchor.constraint(equalTo: addserviceButton.bottomAnchor, constant: 15),
            Button1.heightAnchor.constraint(equalToConstant: 40),
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
            self.addserviceButton.stopAnimation(animationStyle: .expand, revertAfterDelay: 1)
        DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
            self.addserviceButton.stopAnimation(animationStyle: .expand, revertAfterDelay: 1)
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

        }
        


