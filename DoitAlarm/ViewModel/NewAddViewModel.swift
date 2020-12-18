//
//  NewAddViewModel.swift
//  DoitAlarm
//
//  Created by 이용석 on 2020/12/18.
//

import Foundation
import UIKit

enum NewAddElementsEnum {
    case targetImage
    case targetPlace
    case titleInput
    case targettime
    case targetButton
}

protocol NewAddElementProtocol {
    var type: NewAddElementsEnum { get }
    var sectionString: String { get }
    var rowCount: Int { get }
}

class NewAddViewModel {
    var items = [NewAddElementProtocol]()
    
    init() {
        // 제이슨 파일의 내용을 불러와서 배열 형태로 저장
        // [ ] Core DATA 불러 와서 뿌려줌
        
        
    }
}
