//
//  ParnoramaTableView.swift
//  snapkitList
//
//  Created by Tori on 04/10/2019.
//  Copyright © 2019 Tori. All rights reserved.
//

import UIKit
import Kingfisher

class ParnoramaTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    let cellIdentifiler = "ParnoramaCell"
    var roomData = RoomData()
    // MARK: TableView Register
    func setTableRegister() {
        
        self.delegate = self
        self.dataSource = self
        
        self.register(ParnoramaCell.self, forCellReuseIdentifier: cellIdentifiler)
    }

    // MARK: TableView delegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
//        return roomData.roomDatas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ParnoramaCell", for: indexPath) as! ParnoramaCell
        
        cell.roomTitleViews.title.text = "엠블런스"
        cell.roomTitleViews.address.text = "용인시"
        cell.roomTitleViews.rate.text = "3.4"
        cell.roomTitleViews.reviewCount.text = "(321)"
         
        cell.rentInfoView.badgeTitle.text = " 예약 "
        cell.rentInfoView.listPrice.text = "1000원"
        cell.rentInfoView.strikePrice.text = "2000원"
        
        cell.stayInfoView.badgeTitle.text = " 예약 "
        cell.stayInfoView.listPrice.text = "1000원"
        cell.stayInfoView.strikePrice.text = "2000원"
        /*cell.roomTitleViews.title.text = roomData.roomDatas[indexPath.row].title ?? ""
        cell.addressText = roomData.roomDatas[indexPath.row].listAddress ?? ""
        cell.rateText = roomData.roomDatas[indexPath.row].rate ?? ""
        //thumbnail 
        let url = URL(string: roomData.roomDatas[indexPath.row].thumbnail ?? "")
        cell.thumbnailImg.kf.setImage(with: url)*/
        return cell
    }
     

}
