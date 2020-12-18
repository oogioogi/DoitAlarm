//
//  NewADDViewController.swift
//  DoitAlarm
//
//  Created by 이용석 on 2020/12/18.
//

import UIKit

class NewADDViewController: UIViewController {

    @IBOutlet weak var newAddTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        newAddTableView.rowHeight = UITableView.automaticDimension
        newAddTableView.estimatedRowHeight = 150
        
        newAddTableView.register(ImageAndPlaceViewCell.nib, forCellReuseIdentifier: ImageAndPlaceViewCell.identifier)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func saveAddNewViewData(_ sender: UIBarButtonItem) {
        
        // [ ] 따로 저장 공간을 만들어 내용 저장
        
        
        
        // [ * ] NewAddViewController 내용 저장
        guard let image = UIImage(named: "money.png")?.pngData() else {return}
        DataManager.shared.addNewContext(id: 0, title: "test1", photo: image, place: "장소", alarmTime: Date(), cycle: 1)
        // [*] 노티피케이션 센터 포스트 해야함. .?
        NotificationCenter.default.post(name: NewADDViewController.NowInsertedCoreData, object: nil, userInfo: nil)
        dismiss(animated: true, completion: nil)
    }
    
}

extension NewADDViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ImageAndPlaceViewCell.identifier, for: indexPath) as? ImageAndPlaceViewCell else { return UITableViewCell() }
        
        return cell
    }
    
    
}


extension NewADDViewController {
    static let NowInsertedCoreData = Notification.Name(rawValue: "NowInsertedCoreData")
}
