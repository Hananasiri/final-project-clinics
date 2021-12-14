//
//  ClinicsFormat.swift
//  ClinicApp-hanan
//
//  Created by  HANAN ASIRI on 02/05/1443 AH.
//

import UIKit
import FirebaseFirestore


 class AlmadarClinic: UIViewController, UITableViewDelegate, UITableViewDataSource {

  var myTableView: UITableView!
     
     var list =  [
                   service(name:NSLocalizedString("المدار-خلع أسنان", comment: ""), drname:NSLocalizedString("د.فهد وليد", comment: ""),
                           time:NSLocalizedString("٩-١٠ ص", comment: "") ),
                   
                   service(name:NSLocalizedString("المدار-مراجعة دورية", comment: ""), drname:NSLocalizedString("د.إىمان فلاح", comment: ""),
                           time:NSLocalizedString("٩-١٠ ص", comment: "") ),
                   
                   service(name:NSLocalizedString("المدار-ابتسامة هوليود", comment: ""), drname:NSLocalizedString("د.مجدي خالد", comment: ""),
                           time:NSLocalizedString("١١-١٢ م", comment: "") ),
                   
                   service(name:NSLocalizedString("المدار-الحالات الطارئة", comment: ""), drname:NSLocalizedString("د.نور علي", comment: ""),
                           time:NSLocalizedString("٦-٧ م", comment: "") ),
                   
                   service(name:NSLocalizedString("المدار-نزع العصب", comment: ""), drname:NSLocalizedString("د.ليلى نهار", comment: ""),
                           time:NSLocalizedString( "٤-٥ م", comment: "") ),
     ]


     override func viewDidLoad() {
          super.viewDidLoad()
         title = NSLocalizedString("عيادة المدار", comment: "")
         view.backgroundColor = UIColor(named: "bgColor")
         navigationItem.leftBarButtonItem = UIBarButtonItem(title: NSLocalizedString("رجوع", comment: ""), style: .plain, target: self, action: #selector(handleCancel))
       
          let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
          let displayWidth: CGFloat = self.view.frame.width
          let displayHeight: CGFloat = self.view.frame.height

              myTableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
              myTableView.register(AlmadarClinicCell.self, forCellReuseIdentifier: "AlmadarClinicCell")
              myTableView.dataSource = self
              myTableView.delegate = self
              self.view.addSubview(myTableView)

     }
       @objc func handleCancel() {
            dismiss(animated: true, completion: nil)
         }
          func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
              return list.count
          }

          func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
              let cell = tableView.dequeueReusableCell(withIdentifier: "AlmadarClinicCell", for: indexPath ) as! AlmadarClinicCell
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

          
  


