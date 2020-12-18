//
//  NewAddViewModel.swift
//  DoitAlarm
//
//  Created by 이용석 on 2020/12/18.
//

import Foundation
import UIKit

enum NibCellsEnum {
    case titleView
    case imageAndPlace
    case alarmAndRepeat
}

struct LocalValuesEnum {
    var title: String?
    var image: Data?
    var time: Date?
    var place: String?
    var cycle: Int?
}

protocol NibCellsProtocol {
    var type: NibCellsEnum {get}
    var sectionTitle: String {get}
    var rowCount: Int {get}
}

class NewAddViewModel {
    
    static var shared = NewAddViewModel()
    
    var nibCells: [NibCellsProtocol] = [TitleViewModel(), ImageAndplaceModel(), AlarmAndRepeatViewModel()]
    
    init() {
        // 제이슨 파일의 내용을 불러와서 배열 형태로 저장
        // [ ] Core DATA 불러 와서 뿌려줌
        
        
    }
}

class TitleViewModel: NibCellsProtocol {
    
    var type: NibCellsEnum {
        return .titleView
    }
    
    var sectionTitle: String {
        return "알람 제목"
    }
    
    var rowCount: Int {
        return 1
    }
    
    init() { }
}

class ImageAndplaceModel: NibCellsProtocol {
    
    var type: NibCellsEnum {
        return .imageAndPlace
    }
    
    var sectionTitle: String {
        return "알람 해제 장소 및 위치"
    }
    
    var rowCount: Int {
        return 1
    }
    
    init() { }
}

class AlarmAndRepeatViewModel: NibCellsProtocol {
    
    var type: NibCellsEnum {
        return .alarmAndRepeat
    }
    
    var sectionTitle: String {
        return "알람 울림 싸이클"
    }
    
    var rowCount: Int {
        return 1
    }
    
    init() { }
}


