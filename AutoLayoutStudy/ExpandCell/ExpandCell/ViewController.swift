//
//  ViewController.swift
//  ExpandCell
//
//  Created by 김영선 on 2023/02/22.
//

import UIKit

class ExpandCell: UITableViewCell {
    @IBOutlet weak var descriptionLabel: UILabel!
    
}

struct ExpandDataModel {
    var description: String //디테일 내용 텍스트
    var isExpand: Bool      //expand 상태
}

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var dataModels = [ExpandDataModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        let contents = ["short text","long long long long long long long long long long long long long long long text",
        "long long long long long long long long long long long long long long long long long long long long long long text",
        "short text!", "long long long long long long long long long long long long long long long long long long long long long text!"]
        for (_, value) in contents.enumerated() {
            dataModels.append(ExpandDataModel(description: value, isExpand: false))
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell_ID", for: indexPath) as! ExpandCell
        cell.descriptionLabel.text = dataModels[indexPath.row].description
        if dataModels[indexPath.row].isExpand {
            cell.descriptionLabel.numberOfLines = 0
        }else {
            cell.descriptionLabel.numberOfLines = 1
        }
        
        //클릭 효과 없애기
        cell.selectionStyle = .none
        
        return cell
    }
    

}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dataModels[indexPath.row].isExpand = !dataModels[indexPath.row].isExpand
//        tableView.reloadData() //모든 cell reload
        
//        tableView.estimatedSectionHeaderHeight = 0
//        tableView.estimatedSectionFooterHeight = 0
        
        UIView.setAnimationsEnabled(false) //애니메이션 효과 없애기
        tableView.reloadRows(at: [indexPath], with: .none)
        UIView.setAnimationsEnabled(true) //다시 효과 설정해줘야 함 -> 아니면 모든 상황에서 애니메이션 효과 없음
    }
}
