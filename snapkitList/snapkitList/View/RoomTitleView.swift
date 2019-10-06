//
//  RoomTitleView.swift
//  snapkitList
//
//  Created by Tori on 04/10/2019.
//  Copyright © 2019 Tori. All rights reserved.
//

import UIKit
import SnapKit
import Then

/**
 객실 타이틀
 */

class RoomTitleView: UIView {
    var isParnoramaView = Bool(){
        willSet(newVal){
            //set ui
            if newVal{
                setParnoramaLabel()
            }else{
                print("asf",newVal)
                setThumbLabel()
            }
        }
    }
    
    var title = UILabel().then{
        $0.font = UIFont.boldSystemFont(ofSize: 20.0)
    }
    var address = UILabel().then{
        $0.textColor = .darkGray
    }
    var rate = UILabel().then{
        $0.textColor = .darkGray
    }
    var star = UIView().then{
        $0.backgroundColor = .purple
    }
    var reviewCount = UILabel().then{
        $0.textColor = .lightGray
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(title)
        self.addSubview(address)
        self.addSubview(rate)
        self.addSubview(star)
        self.addSubview(reviewCount) 
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setParnoramaLabel(){
        removeAllLabelConstraints()
        
        title.snp.makeConstraints{(make) in
                   make.top.equalToSuperview()
            make.left.right.equalToSuperview()
           }
           
        address.snp.makeConstraints{(make) in
            make.top.equalTo(title.snp.bottom)
            make.bottom.equalToSuperview()
               make.left.equalToSuperview()
           }
        star.snp.makeConstraints{(make) in
            make.top.equalTo(title.snp.bottom)
            make.bottom.equalToSuperview()
               make.left.equalTo(address.snp.right)
            make.height.equalTo(address.snp.height)
            make.width.equalTo(star.snp.height)
        }
       rate.snp.makeConstraints{(make) in
                make.top.equalTo(title.snp.bottom)
                make.bottom.equalToSuperview() 
            make.left.equalTo(star.snp.right)
               }

        reviewCount.snp.makeConstraints{(make) in
            make.top.equalTo(title.snp.bottom)
            make.bottom.equalToSuperview()
            make.left.equalTo(rate.snp.right)
        }
       
    }
    
    func setThumbLabel(){
        removeAllLabelConstraints()
        
     title.snp.makeConstraints{(make) in
                make.top.equalToSuperview()
        make.left.right.equalToSuperview()
        }
        
     address.snp.makeConstraints{(make) in
         make.top.equalTo(title.snp.bottom)
            make.left.equalToSuperview()
        }
     star.snp.makeConstraints{(make) in
         make.top.equalTo(address.snp.bottom)
        make.bottom.left.equalToSuperview()
         make.height.equalTo(address.snp.height)
         make.width.equalTo(star.snp.height)
     }
    rate.snp.makeConstraints{(make) in
             make.top.equalTo(address.snp.bottom)
             make.bottom.equalToSuperview()
         make.left.equalTo(star.snp.right)
            }

     reviewCount.snp.makeConstraints{(make) in
         make.top.equalTo(address.snp.bottom)
         make.bottom.equalToSuperview()
         make.left.equalTo(rate.snp.right)
     }
    }
    
    func removeAllLabelConstraints(){
        title.snp.removeConstraints()
        address.snp.removeConstraints()
        star.snp.removeConstraints()
        rate.snp.removeConstraints()
        reviewCount.snp.removeConstraints()
    }
}
