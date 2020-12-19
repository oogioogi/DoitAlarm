//
//  MainViewController.swift
//  DoitAlarm
//
//  Created by 이용석 on 2020/12/17.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var mainTableView: UITableView!
    
    var token: NSObjectProtocol?
    
    // 선언과 동시에 클로져를 통해 초기화
    let formatter: DateFormatter = {
        let format = DateFormatter()
        format.dateStyle = .long
        format.timeStyle = .short
        format.locale = Locale(identifier: "KO_KR")
        return format
    }()
    
    // 코어 데이터의 내용을 미리 읽어서 불러옴
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        DataManager.shared.fetchMemo()
        mainTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // MARK : - 오토 레이아웃을 잘 잡아줘야함 !!! 탑.리드.테일.버턴 다 잡아줘야함!!! 중요
        mainTableView?.rowHeight = UITableView.automaticDimension
        mainTableView?.estimatedRowHeight = 150
        
        mainTableView.register(MainTableViewCell.nib, forCellReuseIdentifier: MainTableViewCell.identifier)
        
        token = NotificationCenter.default.addObserver(forName: NewADDViewController.NowInsertedCoreData, object: nil, queue: OperationQueue.main, using: { [weak self](Notification) in
            self?.mainTableView.reloadData()
        })
    }
    
    deinit {
        if let token = token {
            NotificationCenter.default.removeObserver(token, name: NewADDViewController.NowInsertedCoreData, object: nil)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension MainViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        DataManager.shared.coreDataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier, for: indexPath) as? MainTableViewCell else { return UITableViewCell() }
        
        let coreDatas = DataManager.shared.coreDataList[indexPath.row]
        cell.titleLine.text = coreDatas.targetTitle
        cell.placeLabel.text = coreDatas.targetPlace
        cell.dateLabel.text = formatter.string(from: Date())
        
        if let placePhoto = coreDatas.targetImage, !placePhoto.isEmpty {
            cell.placePhoto.image = UIImage(data: placePhoto)
        }
        return cell
    }
}
