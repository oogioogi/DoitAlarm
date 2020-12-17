//
//  MainViewController.swift
//  DoitAlarm
//
//  Created by 이용석 on 2020/12/17.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var mainTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // MARK : - 오토 레이아웃을 잘 잡아줘야함 !!! 탑.리드.테일.버턴 다 잡아줘야함!!! 중요
        mainTableView?.rowHeight = UITableView.automaticDimension
        mainTableView?.estimatedRowHeight = 150
        
        mainTableView.register(MainTableViewCell.nib, forCellReuseIdentifier: MainTableViewCell.indetifier)
        
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
        return 2 //DataManager.shared.coreDataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.indetifier, for: indexPath) as? MainTableViewCell else { return UITableViewCell() }
        cell.dateLabel.text = "\(Date())"
        return cell
    }
}
