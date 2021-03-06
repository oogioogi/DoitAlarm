//
//  TitleViewCell.swift
//  DoitAlarm
//
//  Created by 이용석 on 2020/12/17.
//
// 제목 

import UIKit

class TitleViewCell: UITableViewCell {

    
    @IBOutlet weak var titleInputLabel: UILabel!
    @IBOutlet weak var addTitleButton: UIButton!
    
    var alertProtocol: alertProtocolDelegate?
    
    @IBAction func pressAddButton(_ sender: UIButton) {

        alertProtocol?.alertProtocol(Title: "New Title")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    // 이 함수는 셀을 재 사용할때 호출한다
    override func prepareForReuse() {
        super.prepareForReuse()
        // [ ] code
    }
    

    // MARK: - identifier 자신의 클래스 이름을 스크라이빙 해서 문자로 저장
    // 컴퓨티드 프로퍼티는 var로 한다
    static var identifier: String {
        return String(describing: self)
    }
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}


