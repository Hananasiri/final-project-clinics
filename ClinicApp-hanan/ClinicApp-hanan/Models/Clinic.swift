//
//  Clinic.swift
//  ClinicApp-hanan
//
//  Created by  HANAN ASIRI on 18/04/1443 AH.
//


import Foundation
import UIKit


struct Clinic {
    
    let name: String
    let image: String

}

let clinicList = [Clinic(name:NSLocalizedString("عيادة دنتيرا لطب الأسنان", comment: ""), image: "دنتيرا-"),
                  Clinic(name:NSLocalizedString("عيادة جويا لطب الأسنان", comment: "") , image: "جويا"),
                  Clinic(name:NSLocalizedString("عيادة المدار لطب الأسنان", comment: ""), image: "المدار-"),
                  Clinic(name:NSLocalizedString("عيادة برو كلينيك", comment: "") , image: "بروكلنك"),

]
 // Dictionary for ClinicList
var Dictonary: [String: Int] = ["مساعد طبيب أسنان": 1  , "مساعد استشاري أسنان": 2]
