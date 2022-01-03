//
//  AdvicesVC.swift
//  ClinicApp-hanan
//
//  Created by  HANAN ASIRI on 24/04/1443 AH.
//

import UIKit


class AdvicesVC: UIViewController {
    lazy var myLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = NSLocalizedString("إرشادات طبية" , comment: "")
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize:28 , weight: .bold)
        return label
    }()
 override func viewDidLoad() {
        view.backgroundColor = UIColor(named: "bgColor")
        super.viewDidLoad()
        view.addSubview(myLabel)

     
 // Use table views
  let tabelView = UITableView()
  tabelView.dataSource = self
  tabelView.delegate = self
  tabelView.register(Cell.self, forCellReuseIdentifier: "cell")
  tabelView.rowHeight = 80
  tabelView.translatesAutoresizingMaskIntoConstraints = false
  
            //add table to view
 view.addSubview(tabelView)
  
            //constraint
   NSLayoutConstraint.activate([
    myLabel.topAnchor.constraint(equalTo: view.topAnchor,constant: 120),
    myLabel.leftAnchor.constraint(equalTo: view.leftAnchor , constant: 70),
    myLabel.heightAnchor.constraint(equalToConstant: 30),
    myLabel.widthAnchor.constraint(equalToConstant: 300),
    ])
    NSLayoutConstraint.activate([
     tabelView.leftAnchor.constraint(equalTo: view.leftAnchor),
     tabelView.rightAnchor.constraint(equalTo: view.rightAnchor),
     tabelView.topAnchor.constraint(equalTo: myLabel.topAnchor , constant: 30),
     tabelView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
     ])
            
 }
 }
// use extension
 extension AdvicesVC: UITableViewDataSource, UITableViewDelegate {
 func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
  return ar.count
 }
    
 func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
  let r = ar[indexPath.row]
 let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! Cell
  cell.imagecell.image = UIImage(named: r.image)
  cell.namecell.text = r.name
  cell.imagecell.layer.masksToBounds = true
  cell.imagecell.layer.cornerRadius = 20

  return cell
 }
 }
 //cell class
 class Cell: UITableViewCell {
 let imagecell = UIImageView()

     
          let namecell: UILabel = {
          let label = UILabel()
          label.font = UIFont(name: "Light", size: 2)
          label.textColor = .black
          label.textAlignment = .right
          label.numberOfLines = 0
          label.lineBreakMode = .byWordWrapping
          label.frame.size.width = 300
          label.sizeToFit()
         return label
         
     }()
     
 
     override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
     super.init(style: style , reuseIdentifier: reuseIdentifier )
     contentView.backgroundColor = UIColor(named: "bgColor")
     imagecell.translatesAutoresizingMaskIntoConstraints = false


     self.addSubview(imagecell)
  NSLayoutConstraint.activate([imagecell.rightAnchor.constraint(equalTo: rightAnchor),
  imagecell.heightAnchor.constraint(equalToConstant: 80),
  imagecell.widthAnchor.constraint(equalTo: imagecell.heightAnchor,multiplier: 100/100)])
  namecell.text = "kkk"
  namecell.translatesAutoresizingMaskIntoConstraints = false
     
  self.addSubview(namecell)
  NSLayoutConstraint.activate(
  [
   namecell.centerYAnchor.constraint(equalTo: centerYAnchor),
   namecell.rightAnchor.constraint(equalTo: imagecell.rightAnchor , constant:-90),
   namecell.heightAnchor.constraint(equalToConstant: 200),
   namecell.widthAnchor.constraint(equalToConstant: 280),
  ])
 }
 required init?(coder: NSCoder) {
 super.init(coder: coder)
 }
 
 }
