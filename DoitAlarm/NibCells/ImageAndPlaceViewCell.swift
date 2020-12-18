//
//  ImageAndPlaceViewCell.swift
//  DoitAlarm
//
//  Created by 이용석 on 2020/12/17.
// 목표 장소 이미지 사진 및 사진 찍은 장소 위도. 경도 표시
//

import UIKit

class ImageAndPlaceViewCell: UITableViewCell {

    @IBOutlet weak var targetImage: UIImageView!
    @IBOutlet weak var tragetPlace: UILabel!
    
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
    
    var item: NewAddElementProtocol? {
        didSet{
            guard let item = item as? NewAddViewModelImageAndPlace else { return }
            
            targetImage.image = UIImage(data: item.image)
            tragetPlace.text = item.place
        }
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
