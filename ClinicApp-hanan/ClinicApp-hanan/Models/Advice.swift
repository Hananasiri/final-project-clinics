//
//  Advice.swift
//  ClinicApp-hanan
//
//  Created by  HANAN ASIRI on 07/05/1443 AH.
//
import UIKit

// Use structs 
  struct Advice {
  let name: String
  let image: String
      
// A computed property
  var filename: String {
  return name + ""
   }
   }



let ar = [ Advice(name:NSLocalizedString("استعمل معجون الأسنان المحتوي على الفلورايد وذلك لتوفير الحماية الأكثر ‫فعالية ضد التسوس.", comment: ""), image:"44-" ),
        
         Advice(name:NSLocalizedString("تناول الماء من أفضل المشروبات للصحة، بما فيها صحة الفم.", comment: ""), image: "44-"),
         Advice(name:NSLocalizedString("توجه إلى طبيب الأسنان مرتين بحد أدنى خلال السنة، ليتم اكتشاف المشكلات الصحية.", comment: ""), image: "44-"),
        
         Advice(name:NSLocalizedString(
        "تجنب الفرك الشديد للأسنان لأنه يؤدي إلى تهيج اللثة.", comment: ""), image: "44-"),
        
         Advice(name:NSLocalizedString("تناول الأطعمة التي تحتوي على الحديد والزنك حيث تعمل على تجديد الخلايا المبطنة للثة.", comment: ""), image: "44-"),
        
         Advice(name:NSLocalizedString("تجنب تناول المشروبات الغازية، وقلل من الشاي، والقهوة.", comment: ""), image: "44-"),
]

