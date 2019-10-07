//
//  ThumbTableView.swift
//  snapkitList
//
//  Created by 김지영 on 05/10/2019.
//  Copyright © 2019 Tori. All rights reserved.
//

import UIKit

class ThumbTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    let cellIdentifiler = "ThumbCell"
    var roomData = RoomData()
    // MARK: TableView Register
    func setTableRegister() {
        
        self.delegate = self
        self.dataSource = self
        
        self.register(ThumbCell.self, forCellReuseIdentifier: cellIdentifiler)
    }

    // MARK: TableView delegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 5
        return roomData.roomDatas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ThumbCell", for: indexPath) as! ThumbCell
        cell.roomTitleViews.title.text = roomData.roomDatas[indexPath.row].title ?? ""
        cell.roomTitleViews.address.text = roomData.roomDatas[indexPath.row].listAddress ?? ""
        cell.roomTitleViews.rate.text = roomData.roomDatas[indexPath.row].rate ?? ""
        cell.roomTitleViews.reviewCount.text = roomData.roomDatas[indexPath.row].reviewCount ?? ""
        //thumbnail
        let url = URL(string: roomData.roomDatas[indexPath.row].thumbnail ?? "")
        cell.thumbnailImg.kf.setImage(with: url)
        
        cell.rentInfoView.badgeTitle.text = " 예약 "
        cell.rentInfoView.listPrice.text = "1000원"
        cell.rentInfoView.strikePrice.text = "2000원"
        
        cell.stayInfoView.badgeTitle.text = " 예약 "
        cell.stayInfoView.listPrice.text = "1000원"
        cell.stayInfoView.strikePrice.text = "2000원"
        
        cell.placeInfoView.placeInfoLabel.text = "가나다라"
        
        cell.isUserInteractionEnabled = false
        
        return cell
    }
     

}
