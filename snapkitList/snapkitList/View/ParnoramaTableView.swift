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
        print("asdf",roomData.roomDatas.count)
//        return 5
        return roomData.roomDatas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ParnoramaCell", for: indexPath) as! ParnoramaCell
        
        cell.roomTitleViews.title.text = roomData.roomDatas[indexPath.row].title ?? ""
        cell.roomTitleViews.address.text = roomData.roomDatas[indexPath.row].listAddress ?? ""
        cell.roomTitleViews.rate.text = roomData.roomDatas[indexPath.row].rate ?? ""
        cell.roomTitleViews.reviewCount.text = roomData.roomDatas[indexPath.row].reviewCount ?? ""
        //thumbnail
        let url = URL(string: roomData.roomDatas[indexPath.row].thumbnail ?? "")
        cell.thumbnailImg.kf.setImage(with: url)
        
        //대실
        //할인가
        cell.rentInfoView.badgeTitle.text = " 예약 "
        cell.rentInfoView.listPrice.text = "1000원"
        cell.rentInfoView.strikePrice.text = "2000원"
        
//        if let stringListPrice = roomData.roomDatas[indexPath.row].rentInfo["listPrice"]{
//            print("대실", indexPath.row, stringListPrice, String(describing: "\(stringListPrice)원"))
//            cell.rentInfoView.listPrice.text =  String(describing: (stringListPrice))
//        }else{
//            cell.rentInfoView.listPrice.text =  ""
//            print("대실2", indexPath.row)
//        }
 
        //원가
//        if let strikePrice = roomData.roomDatas[indexPath.row].rentInfo["strikePrice"]{
//                   cell.rentInfoView.listPrice.text =  String(describing: (strikePrice))
//        }else{
//            cell.rentInfoView.listPrice.text =  ""
//        }
//        
        
        
        cell.stayInfoView.badgeTitle.text = " 예약 "
        cell.stayInfoView.listPrice.text = "1000원"
        cell.stayInfoView.strikePrice.text = "2000원"
//        if let stringListPrice = roomData.roomDatas[indexPath.row].stayInfo["listPrice"]{
//            cell.stayInfoView.listPrice.text =  String(describing: "\(stringListPrice)원")
//        }
//        if let strikePrice = roomData.roomDatas[indexPath.row].stayInfo["strikePrice"]{
//                   cell.stayInfoView.listPrice.text =  String(describing: "\(strikePrice)원")
//        }
        cell.placeInfoView.placeInfoLabel.text = "가나다라"
        
        cell.isUserInteractionEnabled = false
        return cell
    }
     

}
