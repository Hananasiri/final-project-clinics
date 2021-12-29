//
//  ClinicDetails.swift
//  ClinicApp-hanan
//
//  Created by  HANAN ASIRI on 21/04/1443 AH.
//

import UIKit
import FirebaseFirestore

var isActive:Bool = false

// use protocol with struct ..

protocol someDelegate {
    func valueLable(update : String)
}

struct service: someDelegate {
    func valueLable(update: String) {
        return
    }
  // Optional value
let name: String?
    let drname: String
    let time: String
}


 class DinteraClinic: UIViewController, UITableViewDelegate, UITableViewDataSource {
     // Set of  list
    var Set = ["زراعة الأسنان", "زراعة الجذور", "خلع الأسنان", "ارشادات طبية"]

  var myTableView: UITableView!
  
     
     var list =  [
                   service(name:NSLocalizedString("دنتيرا-إرشادات طبية", comment: ""), drname:NSLocalizedString("د.علي خالد", comment: ""),
                           time:NSLocalizedString("٨-٩ ص", comment: "") ),
                   
                   service(name:NSLocalizedString("دنتيرا-نزع العصب", comment: ""), drname:NSLocalizedString("د.رانيا شيخ", comment: ""),
                           time:NSLocalizedString("١-٣ م", comment: "") ),
                   
                   service(name:NSLocalizedString("دنتيرا-ابتسامة هوليود", comment: ""), drname:NSLocalizedString("د.مروان معتز", comment: ""),
                           time:NSLocalizedString("١١-١٢ م", comment: "") ),
                   
                   service(name:NSLocalizedString("دنتيرا-الحالات الطارئة", comment: ""), drname:NSLocalizedString("د.ماجد فهد", comment: ""),
                           time:NSLocalizedString("٤-٥ م", comment: "") ),
                   
                   service(name:NSLocalizedString( "دنتيرا-تقويم الأسنان", comment: ""), drname:NSLocalizedString("د.ولاء عز", comment: ""),
                           time:NSLocalizedString(" ٩-١٠ ص", comment: "") ),
     ]
     // Use Sets for clinics
     let names: Set = ["عيادة دنتيرا", "عيادة جويا" , "عيادة بروكلينيك", "عيادة المدار"]
     lazy var imageView: UIImageView = {
             let imageView = UIImageView()
             imageView.image = UIImage(named: "kl")
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
         label.text = NSLocalizedString("عيادة دنتيرا لطب الأسنان", comment: "")
         label.font = UIFont.systemFont(ofSize:23)
         return label
     }()
  
   override func viewDidLoad() {
        super.viewDidLoad()
       view.addSubview(imageView)
       view.addSubview(myLabel)
       //title = NSLocalizedString("عيادة دنتيرا", comment: "")
       view.backgroundColor = UIColor(named: "bgColor")
       
       navigationItem.leftBarButtonItem = UIBarButtonItem(title: NSLocalizedString("رجوع", comment: ""), style: .plain, target: self, action: #selector(handleCancel))
     
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height

            myTableView = UITableView(frame: CGRect(x: 0, y: 400, width: displayWidth, height: displayHeight - barHeight))
            myTableView.register(DinteraClinicCell.self, forCellReuseIdentifier: "DinteraClinicCell")
            myTableView.dataSource = self
            myTableView.delegate = self
            self.view.addSubview(myTableView)

       NSLayoutConstraint.activate([
       myLabel.topAnchor.constraint(equalTo: view.topAnchor,constant: 85),
       myLabel.leftAnchor.constraint(equalTo: view.leftAnchor),
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
            let cell = tableView.dequeueReusableCell(withIdentifier: "DinteraClinicCell", for: indexPath ) as! DinteraClinicCell
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

