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
        
        newAddTableView.register(TitleViewCell.nib, forCellReuseIdentifier: TitleViewCell.identifier)
        newAddTableView.register(ImageAndPlaceViewCell.nib, forCellReuseIdentifier: ImageAndPlaceViewCell.identifier)
        newAddTableView.register(AlarmAndRepeatViewCell.nib, forCellReuseIdentifier: AlarmAndRepeatViewCell.identifier)
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
        let inputedTitle = NewAddViewTitleView()
        NewAddViewModel.shared.items.append(inputedTitle)
        let inputedImageAndPlace = NewAddViewModelImageAndPlace()
        NewAddViewModel.shared.items.append(inputedImageAndPlace)
        let inputedAlarmAndRepeat = NewAddViewAlarmAndRepeat()
        NewAddViewModel.shared.items.append(inputedAlarmAndRepeat)
        
        
        
        
        // [ * ] NewAddViewController 내용 저장
        guard let image = UIImage(named: "money.png")?.pngData() else {return}
        DataManager.shared.addNewContext(id: 0, title: "test1", photo: image, place: "장소", alarmTime: Date(), cycle: 1)
        // [*] 노티피케이션 센터 포스트 해야함. .?
        NotificationCenter.default.post(name: NewADDViewController.NowInsertedCoreData, object: nil, userInfo: nil)
        dismiss(animated: true, completion: nil)
    }
    
}

extension NewADDViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return NewAddViewModel.shared.items.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NewAddViewModel.shared.items[section].rowCount
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return NewAddViewModel.shared.items[section].sectionString
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = NewAddViewModel.shared.items[indexPath.section]
        
        switch item.type {
        case .titleView:
            if let cell = tableView.dequeueReusableCell(withIdentifier: TitleViewCell.identifier, for: indexPath) as? TitleViewCell {
                cell.item = item
                return cell
            }
        case .imageAndPlace:
            if let cell = tableView.dequeueReusableCell(withIdentifier: ImageAndPlaceViewCell.identifier, for: indexPath) as? ImageAndPlaceViewCell {
                cell.item = item
                return cell
            }
        case .alarmAndRepeat:
            if let cell = tableView.dequeueReusableCell(withIdentifier: AlarmAndRepeatViewCell.identifier, for: indexPath) as? AlarmAndRepeatViewCell {
                cell.item = item
                return cell
            }
        }
        
        return UITableViewCell()
    }
    
    
}


extension NewADDViewController {
    static let NowInsertedCoreData = Notification.Name(rawValue: "NowInsertedCoreData")
}
