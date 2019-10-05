//
//  StayInfoView.swift
//  snapkitList
//
//  Created by 김지영 on 05/10/2019.
//  Copyright © 2019 Tori. All rights reserved.
//

import UIKit

/**
 숙박 정보 뷰
 */
class StayInfoView:  UIView  {
    var isParnoramaView = Bool(){
        willSet(newVal){
            print(newVal)
            //set ui
            if newVal{
                setParnoramaLabel()
            }else{
                setThumbLabel()
            }
        }
    }
    //text
    var rentText = UILabel().then {
        $0.text = "숙박"
        $0.textColor = .gray
    }
    //badgeTitle
    var badgeTitle = UILabel().then{ badge in
        //color
        badge.textColor = .white
        badge.backgroundColor = .systemPink
        
        //corner Radius
        badge.clipsToBounds = true
        badge.layer.cornerRadius = badge.font.pointSize / 4
        if #available(iOS 11.0, *) {
            badge.layer.maskedCorners = [.layerMaxXMaxYCorner,.layerMaxXMinYCorner,.layerMinXMaxYCorner,.layerMinXMinYCorner]
        } else {
            // Fallback on earlier versions
        }
    }
    
    //할인가
    var listPrice = UILabel().then{
        $0.font =  UIFont.boldSystemFont(ofSize: 20.0)
    }
    var strikePriceDash = UIView().then{
        $0.backgroundColor = .lightGray
    }
    
    //원가
    var strikePrice = UILabel().then{
        $0.textColor = .lightGray
    }
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //add view
        self.addSubview(rentText)
        self.addSubview(listPrice)
        self.addSubview(strikePrice)
        self.addSubview(badgeTitle)
        strikePrice.addSubview(strikePriceDash)
        //color
//        strikePrice.backgroundColor = .green
//        listPrice.backgroundColor = .red
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func removeAllLabelConstraints(){
        rentText.snp.removeConstraints()
        badgeTitle.snp.removeConstraints()
        listPrice.snp.removeConstraints()
        strikePrice.snp.removeConstraints()
    }
    
    func setParnoramaLabel() {
        removeAllLabelConstraints()
        //대실
        rentText.snp.makeConstraints{(make) in
            make.top.bottom.equalToSuperview()
            make.centerY.equalToSuperview()
        }

        //뱃지
        badgeTitle.snp.makeConstraints{(make) in
            make.left.equalTo(rentText.snp.right)
            make.centerY.equalToSuperview()
        }
        
        //원가
        strikePrice.snp.makeConstraints{(make) in
            make.left.equalTo(badgeTitle.snp.right)
            make.centerY.equalToSuperview()
        }
        
        //할인가
        listPrice.snp.makeConstraints{(make) in
            make.right.top.bottom.equalToSuperview()
            make.left.equalTo(strikePrice.snp.right)
        }
        
        //dash
        strikePriceDash.snp.makeConstraints{(make) in
            make.center.equalToSuperview()
            make.height.equalTo(1)
            make.width.equalToSuperview()
            
        }
    }
    
    func setThumbLabel() {
        removeAllLabelConstraints()
        
        //원가
        strikePrice.snp.makeConstraints{(make) in
        make.top.right.equalToSuperview()
        }
        
        //할인가
        listPrice.snp.makeConstraints{(make) in
            
            make.top.equalTo(strikePrice.snp.bottom)
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        //dash
        strikePriceDash.snp.makeConstraints{(make) in
            make.center.equalToSuperview()
            make.height.equalTo(1)
            make.width.equalToSuperview()
            
        }
        //뱃지
        badgeTitle.snp.makeConstraints{(make) in
            make.top.equalTo(strikePrice.snp.bottom)
            make.right.equalTo(listPrice.snp.left)
            make.bottom.equalToSuperview()
        }
        
        //대실
        rentText.snp.makeConstraints{(make) in
            make.top.equalTo(strikePrice.snp.bottom)
            make.right.equalTo(badgeTitle.snp.left)
            make.bottom.equalToSuperview()
            
        }
         
    }
}
