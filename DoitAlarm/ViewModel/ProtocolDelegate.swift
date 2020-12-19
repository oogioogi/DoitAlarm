//
//  ProtocolDelegate.swift
//  DoitAlarm
//
//  Created by 이용석 on 2020/12/19.
//

import Foundation

protocol alertProtocolDelegate {
    func alertProtocol(Title title: String)
}

protocol alarmTimeProtocolDelegate {
    func alarmTimeProtocol(Time time: Date)
}

protocol imageAndPlaceProtocolDelegate {
    func imageAndPlaceProtocol(Image image: Data, Place place: String)
}
