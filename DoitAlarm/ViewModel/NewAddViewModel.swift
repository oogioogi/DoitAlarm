//
//  NewAddViewModel.swift
//  DoitAlarm
//
//  Created by 이용석 on 2020/12/18.
//

import Foundation
import UIKit

enum NewAddElementsEnum {
    case titleView
    case imageAndPlace
    case alarmAndRepeat
    
}

// MARK: - 이넘 " NewAddElementsEnum" 요소 만큼 프로토콜 정의
protocol NewAddElementProtocol {
    var type: NewAddElementsEnum { get }
    var sectionString: String { get }
    var rowCount: Int { get }
}

class NewAddViewModel {
    static var shared = NewAddViewModel()
    var items = [NewAddElementProtocol]()
    
    init() {
        // 제이슨 파일의 내용을 불러와서 배열 형태로 저장
        // [ ] Core DATA 불러 와서 뿌려줌
        
        
    }
}
// MARK: - 프로토콜 " titleView "구현
class NewAddViewTitleView: NewAddElementProtocol {
    var type: NewAddElementsEnum {
        return .titleView
    }
    
    var sectionString: String {
        return " 알람 제목"
    }
    
    var rowCount: Int {
        return 1
    }
    
    var title: String
    
    init(title: String) {
        self.title = title
    }
}


// MARK: - 프로토콜 " NewAddElementProtocol "구현
class NewAddViewModelImageAndPlace: NewAddElementProtocol {
    var type: NewAddElementsEnum {
        return .imageAndPlace
    }
    
    var sectionString: String {
        return " 알람 해지 장소 및 위치"
    }
    
    var rowCount: Int {
        return 1
    }
    
    var image: Data
    var place: String
    
    init(image: Data, place: String) {
        self.image = image
        self.place = place
    }
    
}

// MARK: - 프로토콜 " alarmAndRepeat "구현
class NewAddViewAlarmAndRepeat: NewAddElementProtocol {
    var type: NewAddElementsEnum {
        return .alarmAndRepeat
    }
    
    var sectionString: String {
        return " 알람 시간 및 반복 횟수"
    }
    
    var rowCount: Int {
        return 1
    }
    
    var alarmTime: Date
    var cycle: Int16
    
    init(alarmTime: Date, cycle: Int16) {
        self.alarmTime = alarmTime
        self.cycle = cycle
    }
}



