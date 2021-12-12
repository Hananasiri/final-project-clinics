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

     override func viewDidLoad() {
          super.viewDidLoad()
         title = NSLocalizedString("عيادة جويا", comment: "")
         view.backgroundColor = UIColor(named: "bgColor")
         navigationItem.leftBarButtonItem = UIBarButtonItem(title: NSLocalizedString("رجوع", comment: ""), style: .plain, target: self, action: #selector(handleCancel))
       
          let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
          let displayWidth: CGFloat = self.view.frame.width
          let displayHeight: CGFloat = self.view.frame.height

              myTableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
              myTableView.register(JoyaClinicCell.self, forCellReuseIdentifier: "JoyaClinicCell")
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

          
  class JoyaClinicCell: UITableViewCell {

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
         label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
         label.textColor = UIColor(red: (10/255), green: (47/255), blue: (67/255), alpha: 1)
         return label
        }()
        
      let button: UIButton = {
          let btn = UIButton()
          btn.setTitle(NSLocalizedString("حجز", comment: ""), for: .normal)
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
         labelname.translatesAutoresizingMaskIntoConstraints = false
         labelname.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
         labelname.leftAnchor.constraint(equalTo: self.button.leftAnchor , constant: 220).isActive = true
          labelname.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor , constant: 5).isActive = true
          
          
          labeldrname.translatesAutoresizingMaskIntoConstraints = false
          labeldrname.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
          labeldrname.leftAnchor.constraint(equalTo: self.button.leftAnchor , constant: 110).isActive = true
          labeldrname.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor , constant: 5).isActive = true
          
          labeltime.translatesAutoresizingMaskIntoConstraints = false
          labeltime.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
          labeltime.leftAnchor.constraint(equalTo: self.button.leftAnchor , constant: 60).isActive = true
          labeltime.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor , constant: 5).isActive = true
          

            button.frame = CGRect(x: 10,
                          y: 20,
                          width: 40,
                          height: contentView.frame.size.height-30)
            
          
           }
        
        var distraint: service?
        
        @objc func addData() {
            
            let servicetype1 = labelname.text ??  ""
            let servicedtype2 = labeldrname.text ?? ""
            let servicetype3 = labeltime.text ?? ""
            ReservitionsService.shared.addToAppointment(book: Appointment(bookaservice: servicetype1, bookadoctor: servicedtype2, bookatime: servicetype3 ))

            }
        
           }
