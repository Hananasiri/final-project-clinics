//
//  ClinicsTypes.swift
//  ClinicApp-hanan
//
//  Created by  HANAN ASIRI on 02/05/1443 AH.
//

import UIKit
import FirebaseFirestore


 class ClinicAbuHathrah: UIViewController, UITableViewDelegate, UITableViewDataSource {
     // Set of  list
     var Set = ["زراعة الأسنان", "زراعة الجذور", "خلع الأسنان", "ارشادات طبية"]

  var myTableView: UITableView!
     var list =  [ 
                   service(name: "علاج وحشو العصب "),
                   service(name: "ابتسامة هوليود "),
                   service(name: "ازالة الجير وتلميع الأسنان"),
                   service(name: "الكشف الروتيني"),
                   service(name: "تركيبات الأسنان الثابتة"),
                   service(name: "علاج أسنان الأطفال"),
                   
                   
     ]

   override func viewDidLoad() {
        super.viewDidLoad()
       navigationItem.leftBarButtonItem = UIBarButtonItem(title: NSLocalizedString("Back", comment: ""), style: .plain, target: self, action: #selector(handleCancel))
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height

            myTableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
            myTableView.register(ClinicTypesCell.self, forCellReuseIdentifier: "ClinicTypesCell")
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
            let cell = tableView.dequeueReusableCell(withIdentifier: "ClinicTypesCell", for: indexPath as! IndexPath) as! ClinicTypesCell
            let data = list[indexPath.row]
            cell.label2.text = data.name


            return cell
        }
     internal func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let data = list[indexPath.row]
            let newVC = ClinicData()
         // Use navigationController
           navigationController?.pushViewController(newVC,animated: true)
            
         }
         }

        
class ClinicTypesCell: UITableViewCell {

  static let identifire = "Cell"

  public let label2: UILabel = {
   let label = UILabel()
   label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
   label.textColor = UIColor(red: (10/255), green: (47/255), blue: (67/255), alpha: 1)
   return label
  }()
    
   override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    contentView.backgroundColor = .white
    contentView.addSubview(label2)
       
   
  }
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  override func layoutSubviews() {
    super.layoutSubviews()

    label2.frame = CGRect(x: -120,
               y: 10,
               width: 500,
               height: contentView.frame.size.height-30)
  }
  }



