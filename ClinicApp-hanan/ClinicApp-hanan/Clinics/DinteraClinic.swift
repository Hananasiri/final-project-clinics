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
  

   override func viewDidLoad() {
        super.viewDidLoad()
       title = NSLocalizedString("عيادة دنتيرا", comment: "")
       view.backgroundColor = UIColor(named: "bgColor")
       
       navigationItem.leftBarButtonItem = UIBarButtonItem(title: NSLocalizedString("رجوع", comment: ""), style: .plain, target: self, action: #selector(handleCancel))
     
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height

            myTableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
            myTableView.register(DinteraClinicCell.self, forCellReuseIdentifier: "DinteraClinicCell")
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

        
class DinteraClinicCell: UITableViewCell {

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
    //  Use button
    let button: UIButton = {
        let btn = UIButton()
        btn.layer.cornerRadius = 15
        btn.setImage(UIImage(systemName: "circle"), for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        btn.addTarget(self, action: #selector(addData), for: .touchUpInside)
        return btn
        }()
    
   override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
       
   contentView.backgroundColor =  UIColor(named: "bgColor")
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
      labeldrname.leftAnchor.constraint(equalTo: self.button.leftAnchor , constant: 120).isActive = true
      labeldrname.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor , constant: 5).isActive = true
      
      labeltime.translatesAutoresizingMaskIntoConstraints = false
      labeltime.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
      labeltime.leftAnchor.constraint(equalTo: self.button.leftAnchor , constant: 60).isActive = true
      labeltime.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor , constant: 5).isActive = true
      

        button.frame = CGRect(x: 10,
                      y: 10,
                      width: 40,
                      height: contentView.frame.size.height-10)
        
      
       }
    
    var distraint: service?
    
    @objc func addData() {
        //  Use conditionals if
        if isActive {
              isActive = true
            button.setImage(UIImage(named: "circle"), for: .normal)
            } else {
                isActive = false
            button.setImage(UIImage(systemName: "circle.circle.fill"), for: .normal)
            }
        
        let servicetype1 = labelname.text ??  ""
        let servicedtype2 = labeldrname.text ?? ""
        let servicetype3 = labeltime.text ?? ""
        ReservitionsService.shared.addToAppointment(book: Appointment(bookaservice: servicetype1, bookadoctor: servicedtype2, bookatime: servicetype3 ))
        
     
    }
    }

