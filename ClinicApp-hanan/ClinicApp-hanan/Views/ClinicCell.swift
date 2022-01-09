//
//  ClinicCell.swift
//  ClinicApp-hanan
//
//  Created by  HANAN ASIRI on 18/04/1443 AH.
//
import UIKit

class ClinicCell: UICollectionViewCell {
    
  static let identifier = "cell"
    
    private let myImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named:"p")
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 6
        imageView.contentMode = .scaleAspectFill
        
        return imageView
        
    }()
    
    private let myLabel: UILabel = {
        let label = UILabel()
        label.text = "عيادات طب الأسنان"
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = .label
        label.textAlignment = .center
      
        return label
        
    }()
    
    func setCell(card: Clinic){
        myImage.image = UIImage(named: card.image)
        myLabel.text = card.name
                
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = UIColor(named: "bgColor")
        contentView.addSubview(myLabel)
        contentView.addSubview(myImage)
        //contentView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder: has not implement>>>")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = UIColor(named: "bgColor")
        myLabel.frame = CGRect(x: 5,
                               y: contentView.frame.size.height-10 ,
                               width: contentView.frame.size.width ,
                               height: 50)
        
        
        myImage.frame = CGRect(x: 5,
                               y: 10 ,
                               width: 185,
                               height: 185)

    }
    }
