//
//  ThumbCellTableViewCell.swift
//  snapkitList
//
//  Created by 김지영 on 06/10/2019.
//  Copyright © 2019 Tori. All rights reserved.
//

import UIKit

class ThumbCell: UITableViewCell {
    //MARK: - constraint value
    let infoInset = 20
    //MARK: - define value
    var thumbnailImg = UIImageView()
    var roomTitleViews = RoomTitleView().then{
        $0.isParnoramaView = false
    }
    var rentInfoView = RentInfoView().then{
        $0.isParnoramaView = false
    }
    var stayInfoView = StayInfoView().then{
        $0.isParnoramaView = false
    }
    var placeInfoView = PlaceInfoView()
    
    
    //MARK: - override init
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
    
    //MARK: set ui func
    func setUI(){
        //photo
        thumbnailImg =  UIImageView().then{
            self.addSubview($0)
            $0.snp.makeConstraints{(make) in
                make.top.left.equalToSuperview().inset(infoInset)
                make.height.equalTo(200).priority(250)
                make.width.equalTo(170)
            }
            $0.backgroundColor = .black
            
            //corner Radius
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 10
            if #available(iOS 11.0, *) {
                $0.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMinXMinYCorner]
            } else {
                // Fallback on earlier versions
            }
            
        }
        
        //객실정보
        self.addSubview(roomTitleViews)
        roomTitleViews.snp.makeConstraints { (make) in
        make.top.right.equalToSuperview().inset(infoInset)
            make.left.equalTo(thumbnailImg.snp.right).offset(infoInset)
        }
        
        //대실 가격 정보
        self.addSubview(rentInfoView)
        rentInfoView.snp.makeConstraints{(make) in
            
            make.right.equalToSuperview().inset(infoInset)
            make.left.equalTo(thumbnailImg.snp.right)
        }
        
        //숙박 가격 정보
        self.addSubview(stayInfoView)
        stayInfoView.snp.makeConstraints{(make) in
            make.top.equalTo(rentInfoView.snp.bottom)
            make.right.equalToSuperview().inset(infoInset)
            make.bottom.equalTo(thumbnailImg.snp.bottom)
        }
        
        //장소 정보
        self.addSubview(placeInfoView)
        placeInfoView.snp.makeConstraints{(make) in
            make.top.equalTo(thumbnailImg.snp.bottom).offset(20)
            make.right.left.equalToSuperview().inset(infoInset)
            make.bottom.equalToSuperview().inset(10)
            make.height.equalTo(40)
        }
    }
     
}
