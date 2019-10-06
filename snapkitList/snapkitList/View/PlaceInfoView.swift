//
//  PlaceInfoView.swift
//  snapkitList
//
//  Created by 김지영 on 05/10/2019.
//  Copyright © 2019 Tori. All rights reserved.
//

import UIKit

/**
 이벤트 정보 뷰
 */
class PlaceInfoView: UIView {
    var placeInfoLabel = UILabel().then{
        $0.textColor = .darkGray
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        if #available(iOS 13.0, *) {
            self.backgroundColor = .systemGray3
        } else {
             self.backgroundColor = .lightGray
        }
        //corner Radius
        self.clipsToBounds = true
        self.layer.cornerRadius =  20
        if #available(iOS 11.0, *) {
            self.layer.maskedCorners = [.layerMaxXMaxYCorner,.layerMaxXMinYCorner,.layerMinXMaxYCorner,.layerMinXMinYCorner]
        } else {
            // Fallback on earlier versions
        }
        self.addSubview(placeInfoLabel)
        placeInfoLabel.snp.makeConstraints{(make) in
            make.left.equalTo(15)
            make.centerY.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
