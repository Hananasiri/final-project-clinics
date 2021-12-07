//
//  ClinicDetails.swift
//  ClinicApp-hanan
//
//  Created by  HANAN ASIRI on 21/04/1443 AH.
//

import UIKit
import FirebaseFirestore

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
}


 class ClinicDentera: UIViewController, UITableViewDelegate, UITableViewDataSource {
     // Set of  list
     var Set = ["زراعة الأسنان", "زراعة الجذور", "خلع الأسنان", "ارشادات طبية"]

  var myTableView: UITableView!
     var list =  [ service(name: " زراعة الأسنان وزراعة الجذور"),
                   service(name:"طب الأسنان والإرشادات الطبية "),
                   service(name: "علاج أسنان الأطفال"),
                   service(name: " عمليات تقييم حالة الفم "),
                   service(name: " إجراءات إصلاح وتجديد الأسنان "),
                   service(name: "الحالات الطارئة"),
                   service(name: "ابتسامة هوليود "),
                   
                   
     ]

   override func viewDidLoad() {
        super.viewDidLoad()
       navigationItem.leftBarButtonItem = UIBarButtonItem(title: NSLocalizedString("Back", comment: ""), style: .plain, target: self, action: #selector(handleCancel))
     
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height

            myTableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
            myTableView.register(ClinicDetalisCell.self, forCellReuseIdentifier: "ClinicDetalisCell")
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
            let cell = tableView.dequeueReusableCell(withIdentifier: "ClinicDetalisCell", for: indexPath as! IndexPath) as! ClinicDetalisCell
            let data = list[indexPath.row]
            cell.label2.text = data.name


            return cell
        }
     internal func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let data = list[indexPath.row]
            let newVC = ClinicData()
         // Use navigationController
             newVC.navigationItem.largeTitleDisplayMode = .never
            navigationController?.pushViewController(newVC,animated: true)

         }
         }

        
class ClinicDetalisCell: UITableViewCell {

  static let identifire = "Cell"

  public let label2: UILabel = {
   let label = UILabel()
   label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
   label.textColor = UIColor(red: (10/255), green: (47/255), blue: (67/255), alpha: 1)
   return label
  }()
    let button: UIButton = {
           let btn = UIButton()
              btn.setTitle("حجز موعد", for: .normal)
              btn.backgroundColor = .systemPink
              btn.layer.cornerRadius = 7
              btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
              btn.addTarget(self, action: #selector(addData), for: .touchUpInside)
                return btn
            }()
    @objc func addData() {
           
           
          let newDataVC = ClinicData()
       //UIPresentationController.newDataVC (animated: true, completion: nil)
   }
    
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
      button.frame = CGRect(x: 320,
                    y: 20,
                    width: 70,
                    height: contentView.frame.size.height-30)
       }
  }

  
 


