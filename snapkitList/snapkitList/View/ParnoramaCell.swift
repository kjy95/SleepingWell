//
//  ParnoramaCell.swift
//  snapkitList
//
//  Created by Tori on 04/10/2019.
//  Copyright © 2019 Tori. All rights reserved.
//

import UIKit

class ParnoramaCell: UITableViewCell {
    
    var thumbnailImg = UIImageView()
    var roomTitleViews = RoomTitleView()
    var rentInfoView = RentInfoView().then{
        $0.isParnoramaView = true
    }
    var stayInfoView = StayInfoView().then{
        $0.isParnoramaView = true
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

    //set cell
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) { 
        super.init(style: style, reuseIdentifier: reuseIdentifier)
         setUI()
        self.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI(){
        //photo
        thumbnailImg =  UIImageView().then{
            self.addSubview($0)
            $0.snp.makeConstraints{(make) in
                make.top.right.left.equalToSuperview()
                make.height.equalTo(240)
            }
            $0.backgroundColor = .black
            
            //corner Radius
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 10
            if #available(iOS 11.0, *) {
                $0.layer.maskedCorners = [.layerMaxXMaxYCorner]
            } else {
                // Fallback on earlier versions
            }
            
        }
        
        //객실정보
        roomTitleViews = RoomTitleView().then{
            self.addSubview($0)
            $0.snp.makeConstraints { (make) in
                make.top.equalTo(thumbnailImg.snp.bottom)
                make.right.equalToSuperview()
                make.left.equalToSuperview().inset(10) 
            }
        }
        
        //대실 가격 정보
        self.addSubview(rentInfoView)
        rentInfoView.snp.makeConstraints{(make) in
            make.top.equalTo(roomTitleViews.snp.bottom)
            make.right.left.equalToSuperview()
        }
        
        //숙박 가격 정보
        self.addSubview(stayInfoView)
        stayInfoView.snp.makeConstraints{(make) in
            make.top.equalTo(rentInfoView.snp.bottom)
            make.right.left.bottom.equalToSuperview()
        }
    }
     
}
