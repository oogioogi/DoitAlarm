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
    
    //var titleText: String?
    
    
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
        
        let titleText = NewAddViewModel.shared.localValueEnum.title
        let times = NewAddViewModel.shared.localValueEnum.time
        let images = NewAddViewModel.shared.localValueEnum.image
        let place = NewAddViewModel.shared.localValueEnum.place
        // [ * ] NewAddViewController 내용 저장
        DataManager.shared.addNewContext(id: 0, title: titleText!, photo: images!, place: place!, alarmTime: times!, cycle: 1)
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
        
        switch item.type {
        case .titleView:
            if let cell = tableView.dequeueReusableCell(withIdentifier: TitleViewCell.identifier, for: indexPath) as? TitleViewCell {
                cell.alertProtocol = self
                if let title = NewAddViewModel.shared.localValueEnum.title, !title.isEmpty {
                    cell.titleInputLabel.text = NewAddViewModel.shared.localValueEnum.title
                }
                return cell
            }
        case .imageAndPlace:
            if let cell = tableView.dequeueReusableCell(withIdentifier: ImageAndPlaceViewCell.identifier, for: indexPath) as? ImageAndPlaceViewCell {
                cell.imageAndPlaceProtocol = self
                
                if let image = NewAddViewModel.shared.localValueEnum.image, !image.isEmpty {
                    cell.targetImage.image = UIImage(data: image)
                }
                if let place = NewAddViewModel.shared.localValueEnum.place, !place.isEmpty {
                    cell.tragetPlace.text = place
                }
                
                return cell
            }
        case .alarmAndRepeat:
            if let cell = tableView.dequeueReusableCell(withIdentifier: AlarmAndRepeatViewCell.identifier, for: indexPath) as? AlarmAndRepeatViewCell {
                cell.alarmProtocol = self
                return cell
            }
        }
        
        return UITableViewCell()
    }
    
    
}

extension NewADDViewController: alertProtocolDelegate {
    
    func alertProtocol(Title title: String) {
        let alert = UIAlertController(title: title, message: "Enter The New Title", preferredStyle: .alert)
        alert.addTextField(configurationHandler: nil)
        alert.addAction(UIAlertAction(title: "summit", style: .cancel, handler: { [weak self] _ in
            guard let field = alert.textFields?.first, let text = field.text, !text.isEmpty else { return }
            
            NewAddViewModel.shared.localValueEnum.title = text
            self?.newAddTableView.reloadData()
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
}

extension NewADDViewController: alarmTimeProtocolDelegate {
    func alarmTimeProtocol(Time time: Date) {
        NewAddViewModel.shared.localValueEnum.time = time
        self.newAddTableView.reloadData()
    }
    
    
}

extension NewADDViewController: imageAndPlaceProtocolDelegate {
    func imageAndPlaceProtocol(Image image: Data, Place place: String) {
        NewAddViewModel.shared.localValueEnum.image = image
        NewAddViewModel.shared.localValueEnum.place = place
        self.newAddTableView.reloadData()
    }
    
    
}

extension NewADDViewController {
    static let NowInsertedCoreData = Notification.Name(rawValue: "NowInsertedCoreData")
}
