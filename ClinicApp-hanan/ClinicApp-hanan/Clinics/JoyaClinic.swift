//
//  ClinicsInformation.swift
//  ClinicApp-hanan
//
//  Created by  HANAN ASIRI on 02/05/1443 AH.
//

import UIKit
import FirebaseFirestore


 class JoyaClinic: UIViewController, UITableViewDelegate, UITableViewDataSource {

  var myTableView: UITableView!
     var list =  [
                   service(name:NSLocalizedString("جويا-تقويم الأسنان", comment: ""), drname:NSLocalizedString("د.خالد الفهد", comment: ""),
                           time:NSLocalizedString("٨-٩ ص", comment: "") ),
                   
                   service(name:NSLocalizedString("جويا-تركيبات الأسنان", comment: ""), drname:NSLocalizedString("د.علاء مجد", comment: ""),
                           time:NSLocalizedString("١-٣ م", comment: "") ),
                   
                   service(name:NSLocalizedString("جويا-نزع العصب", comment: ""), drname:NSLocalizedString("د.سامية علي", comment: ""),
                           time:NSLocalizedString("٨-٩ ص", comment: "") ),
                   
                   service(name:NSLocalizedString("جويا-الحالات الطارئة", comment: ""), drname:NSLocalizedString("د.ناجي فارس", comment: ""),
                           time:NSLocalizedString("٤-٥ م", comment: "") ),
                   
                   service(name:NSLocalizedString("جويا-ابتسامة هوليود", comment: ""), drname:NSLocalizedString("د.هند سامي", comment: ""),
                           time:NSLocalizedString("٩-١٠ ص", comment: "") ),
     ]
     lazy var imageView: UIImageView = {
             let imageView = UIImageView()
             imageView.image = UIImage(named: "k-joia")
             imageView.layer.cornerRadius = 200
             imageView.contentMode = .scaleAspectFill
             imageView.translatesAutoresizingMaskIntoConstraints = false
             imageView.isUserInteractionEnabled = true
             imageView.backgroundColor = .blue

             return imageView
         }()
     lazy var myLabel: UILabel = {
         let label = UILabel()
         label.translatesAutoresizingMaskIntoConstraints = false
         label.text = NSLocalizedString("عيادة جويا", comment: "")
         label.font = UIFont.systemFont(ofSize: 30)
         return label
     }()

     override func viewDidLoad() {
          super.viewDidLoad()
         view.addSubview(imageView)
         view.addSubview(myLabel)
        // title = NSLocalizedString("عيادة جويا", comment: "")
         view.backgroundColor = UIColor(named: "bgColor")
         navigationItem.leftBarButtonItem = UIBarButtonItem(title: NSLocalizedString("رجوع", comment: ""), style: .plain, target: self, action: #selector(handleCancel))
       
          let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
          let displayWidth: CGFloat = self.view.frame.width
          let displayHeight: CGFloat = self.view.frame.height

              myTableView = UITableView(frame: CGRect(x: 0, y: 400, width: displayWidth, height: displayHeight - barHeight))
              myTableView.register(JoyaClinicCell.self, forCellReuseIdentifier: "JoyaClinicCell")
              myTableView.dataSource = self
              myTableView.delegate = self
         self.view.addSubview(myTableView)
         
         NSLayoutConstraint.activate([
         myLabel.topAnchor.constraint(equalTo: view.topAnchor,constant: 80),
         myLabel.leftAnchor.constraint(equalTo: view.leftAnchor , constant: 4),
         myLabel.heightAnchor.constraint(equalToConstant: 40),
         myLabel.widthAnchor.constraint(equalToConstant: 290),
         ])
         
         NSLayoutConstraint.activate([
                    imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
                    imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                    imageView.heightAnchor.constraint(equalToConstant: 250),
                    imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor,multiplier: 100/100)
                ])

          }
       @objc func handleCancel() {
            dismiss(animated: true, completion: nil)
         }
          func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
              return list.count
          }

          func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
              let cell = tableView.dequeueReusableCell(withIdentifier: "JoyaClinicCell", for: indexPath as! IndexPath) as! JoyaClinicCell
              let data = list[indexPath.row]
              cell.labelname.text = data.name
              cell.labeldrname.text = data.drname
              cell.labeltime.text = data.time


              return cell
          }
       internal func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
              let data = list[indexPath.row]
              let newVC = NewServiceVC()
               newVC.navigationItem.largeTitleDisplayMode = .never
              navigationController?.pushViewController(newVC,animated: true)

           }
           }
