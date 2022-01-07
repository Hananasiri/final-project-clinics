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



let ar = [ Advice(name:NSLocalizedString("استعمل معجون الأسنان المحتوي على الفلورايد وذلك لتوفير الحماية الأكثر ‫فعالية ضد التسوس", comment: ""), image:"44-" ),
        
         Advice(name:NSLocalizedString("تناول الماء من أفضل المشروبات للصحة، بما فيها صحة الفم", comment: ""), image: "44-"),
         Advice(name:NSLocalizedString("توجه إلى طبيب الأسنان مرتين بحد أدنى خلال السنة، ليتم اكتشاف المشكلات الصحية", comment: ""), image: "44-"),
        
         Advice(name:NSLocalizedString("يساعد غسول الفم على تقليل نسبة الحمض الموجودة بالفم، وينظف المناطق التي يصعب تنظيفها", comment: ""), image: "44-"),
        
         Advice(name:NSLocalizedString("احرص على تناول الأطعمة التي تعزز من صحة الفم والأسنان، مثل منتجات الألبان، والبيض، والبقوليات", comment: ""), image: "44-"),
        
         Advice(name:NSLocalizedString("تجنب تناول المشروبات الغازية، وقلل من الشاي، والقهوة", comment: ""), image: "44-"),
]

