//
//  MainTableViewCell.swift
//  DoitAlarm
//
//  Created by 이용석 on 2020/12/17.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLine: UILabel!
    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var placePhoto: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // 이 함수는 셀을 재 사용할때 호출한다
    override func prepareForReuse() {
        super.prepareForReuse()
        // [ ] code
    }
    
    // MARK: - identifier 자신의 클래스 이름을 디스크라이빙 해서 문자로 저장
    // 컴퓨티드 프로퍼티는 var로 한다
    static var identifier: String {
        return String(describing: self)
    }
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
}
