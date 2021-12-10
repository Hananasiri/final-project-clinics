//
//  ClinicsTypes.swift
//  ClinicApp-hanan
//
//  Created by  HANAN ASIRI on 02/05/1443 AH.
//

import UIKit
import FirebaseFirestore


 class ProClinic: UIViewController, UITableViewDelegate, UITableViewDataSource {
     var myTableView: UITableView!
      var list =  [
                   service(name:NSLocalizedString("علاج وحشو العصب", comment: ""), drname:NSLocalizedString( "د.ندى خالد", comment: ""),
                           time:NSLocalizedString("١-٢ م", comment: "") ),
                   
                   service(name:NSLocalizedString("ابتسامة هوليود", comment: ""), drname:NSLocalizedString("د.سارة يوسف", comment: ""),
                           time:NSLocalizedString( "٨-٩ ص", comment: "") ),
                   
                   service(name:NSLocalizedString( "ازالة الجير", comment: ""), drname:NSLocalizedString("د.محمد الحسن", comment: ""),
                           time:NSLocalizedString("٣-٤ م", comment: "") ),
                   
                   service(name:NSLocalizedString("الكشف الروتيني", comment: ""), drname:NSLocalizedString("د.عيسى صلاح", comment: ""),
                           time:NSLocalizedString("٦-٨ م", comment: "") ),
                   
                   service(name:NSLocalizedString("تركيبات الأسنان الثابتة", comment: ""), drname:NSLocalizedString("د.محمد عطا", comment: ""),
                           time:NSLocalizedString(" ٩-١٠ ص", comment: "") ),
     ]

     override func viewDidLoad() {
          super.viewDidLoad()
         navigationItem.leftBarButtonItem = UIBarButtonItem(title: NSLocalizedString("Back", comment: ""), style: .plain, target: self, action: #selector(handleCancel))
       
          let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
          let displayWidth: CGFloat = self.view.frame.width
          let displayHeight: CGFloat = self.view.frame.height

              myTableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
              myTableView.register(ProClinicCell.self, forCellReuseIdentifier: "ProClinicCell")
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
              let cell = tableView.dequeueReusableCell(withIdentifier: "ProClinicCell", for: indexPath ) as! ProClinicCell
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

          
  class ProClinicCell: UITableViewCell {

    static let identifire = "Cell"
      
      public let labelname: UILabel = {
       let label = UILabel()
       label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
       label.textColor = UIColor(red: (10/255), green: (47/255), blue: (67/255), alpha: 1)
       return label
      }()
        
        public let labeldrname: UILabel = {
         let label = UILabel()
         label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
         label.textColor = UIColor(red: (10/255), green: (47/255), blue: (67/255), alpha: 1)
         return label
        }()
        
        public let labeltime: UILabel = {
         let label = UILabel()
         label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
         label.textColor = UIColor(red: (10/255), green: (47/255), blue: (67/255), alpha: 1)
         return label
        }()
        
        let button: UIButton = {
               let btn = UIButton()
                  btn.setTitle("حجز", for: .normal)
                  btn.backgroundColor = .systemPink
                  btn.layer.cornerRadius = 7
                  btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
                  btn.addTarget(self, action: #selector(addData), for: .touchUpInside)
                    return btn
                }()
        
       override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        contentView.addSubview(labelname)
        contentView.addSubview(labeldrname)
        contentView.addSubview(labeltime)
        contentView.addSubview(button)
           
      }
        
      required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
      }
        
      override func layoutSubviews() {
          
        super.layoutSubviews()
          labelname.frame = CGRect(x: -120,
                     y: 10,
                     width: 500,
                     height: contentView.frame.size.height-30)
            
          labeldrname.frame = CGRect(x: -250,
                       y: 10,
                       width: 500,
                       height: contentView.frame.size.height-30)
            
          labeltime.frame = CGRect(x: -350,
                       y: 10,
                       width: 500,
                       height: contentView.frame.size.height-30)
            
            button.frame = CGRect(x: 10,
                          y: 20,
                          width: 90,
                          height: contentView.frame.size.height-30)
            
          
           }
        
        var distraint: service?
        
        @objc func addData() {
            
            let servicetype1 = labelname.text ??  ""
            let servicedtype2 = labeldrname.text ?? ""
            let servicetype3 = labeltime.text ?? ""
            ReservitionsService.shared.addToprofile(book: Mawaid(bookaservice: servicetype1, bookadoctor: servicedtype2, bookatime: servicetype3 ))

            }
        
           }

