//
//  NewADDViewController.swift
//  DoitAlarm
//
//  Created by 이용석 on 2020/12/18.
//

import UIKit

class NewADDViewController: UIViewController {

    @IBOutlet weak var newAddTableView: UITableView!
    //var cellList: [NewAddElementProtocol] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        newAddTableView.rowHeight = UITableView.automaticDimension
        newAddTableView.estimatedRowHeight = 150
        
        newAddTableView.register(TitleViewCell.nib, forCellReuseIdentifier: TitleViewCell.identifier)
        newAddTableView.register(ImageAndPlaceViewCell.nib, forCellReuseIdentifier: ImageAndPlaceViewCell.identifier)
        newAddTableView.register(AlarmAndRepeatViewCell.nib, forCellReuseIdentifier: AlarmAndRepeatViewCell.identifier)
        
        _ = TitleViewModel()
        _ = ImageAndplaceModel()
        _ = AlarmAndRepeatViewModel()
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
        DataManager.shared.addNewContext(id: 0, title: "aa", photo: image, place: "장소", alarmTime: Date(), cycle: 1)
        // [*] 노티피케이션 센터 포스트 해야함. .?
        NotificationCenter.default.post(name: NewADDViewController.NowInsertedCoreData, object: nil, userInfo: nil)
        dismiss(animated: true, completion: nil)
    }
    
}

extension NewADDViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return NewAddViewModel.shared.nibCells.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NewAddViewModel.shared.nibCells[section].rowCount
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return NewAddViewModel.shared.nibCells[section].sectionTitle
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = NewAddViewModel.shared.nibCells[indexPath.section]
        print("row = \(indexPath.row) :: section = \(indexPath.section)")
        //let item = cellList[indexPath.section]
        
        switch item.type {
        case .titleView:
            if let cell = tableView.dequeueReusableCell(withIdentifier: TitleViewCell.identifier, for: indexPath) as? TitleViewCell {
                
                return cell
            }
        case .imageAndPlace:
            if let cell = tableView.dequeueReusableCell(withIdentifier: ImageAndPlaceViewCell.identifier, for: indexPath) as? ImageAndPlaceViewCell {
                
                return cell
            }
        case .alarmAndRepeat:
            if let cell = tableView.dequeueReusableCell(withIdentifier: AlarmAndRepeatViewCell.identifier, for: indexPath) as? AlarmAndRepeatViewCell {
                
                return cell
            }
        }
        
        return UITableViewCell()
    }
    
    
}


extension NewADDViewController {
    static let NowInsertedCoreData = Notification.Name(rawValue: "NowInsertedCoreData")
}
