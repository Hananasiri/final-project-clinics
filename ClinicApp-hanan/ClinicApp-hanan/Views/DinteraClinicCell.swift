//
//  DinteraClinicCell.swift
//  ClinicApp-hanan
//
//  Created by  HANAN ASIRI on 10/05/1443 AH.
//

import UIKit

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
        btn.setImage(UIImage(systemName: "square"), for: .normal)
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
     labelname.leftAnchor.constraint(equalTo: self.button.leftAnchor , constant: 210).isActive = true
     labelname.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor , constant: 5).isActive = true
      
      
      labeldrname.translatesAutoresizingMaskIntoConstraints = false
      labeldrname.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
      labeldrname.leftAnchor.constraint(equalTo: self.button.leftAnchor , constant: 115).isActive = true
      labeldrname.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor , constant: 5).isActive = true
      
      labeltime.translatesAutoresizingMaskIntoConstraints = false
      labeltime.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
      labeltime.leftAnchor.constraint(equalTo: self.button.leftAnchor , constant: 45).isActive = true
      labeltime.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor , constant: 5).isActive = true
      

      
      button.frame = CGRect(x: 20,
                    y: 20,
                    width: 40,
                    height: contentView.frame.size.height-30)
    }
    
    var distraint: service?
    
    @objc func addData() {
        // Use conditionals if
     if isActive {
         
     isActive = true
     button.setImage(UIImage(systemName: "square"), for: .normal)
     } else {
         
         isActive = false
         button.setImage(UIImage(systemName: ""), for: .normal)
         button.setTitle(NSLocalizedString("حجز", comment: ""), for: .normal)
         button.backgroundColor = .red
         button.layer.cornerRadius = 4
         button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
         button.titleLabel?.textAlignment = .right
            }
      let servicetype1 = labelname.text ??  "No Value"
      let servicedtype2 = labeldrname.text ??  "No Value"
      let servicetype3 = labeltime.text ??  "No Value"
      ReservitionsService.shared.addToAppointment(
      book: Appointment(bookaservice: servicetype1, bookadoctor: servicedtype2, bookatime: servicetype3
      ))
      }
      }
