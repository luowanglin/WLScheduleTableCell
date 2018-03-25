//
//  ViewController.swift
//  WLScheduleTableCellDemo
//
//  Created by luowanglin on 2018/3/23.
//  Copyright © 2018年 luowanglin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var table_view: UITableView?
    let footViewHeight: CGFloat = 0.5
    let headViewHeight: CGFloat = 50.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        table_view = UITableView.init(frame: CGRect.init(x: 0.0, y: 20.0, width: self.view.frame.width, height: self.view.frame.height - 20.0), style: UITableViewStyle.plain)
        table_view?.register(WLScheduleTableViewCell.self, forCellReuseIdentifier: "cell")
        table_view?.delegate = self
        table_view?.dataSource = self
        table_view?.separatorStyle = .none
        self.view.addSubview(table_view!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: WLScheduleTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath) as! WLScheduleTableViewCell
        while (cell.contentView.subviews.last != nil) {
            cell.contentView.subviews.last?.removeFromSuperview()
        }
        cell.contentText = "电流异常"
        cell.timeText = "12:00:00"
        cell.marginLeft = 34.0
        cell.isFirstCell = false
        cell.isLastCell = false
        if indexPath.row == 0 {
            cell.isFirstCell = true
        }
        if indexPath.row == (tableView.numberOfRows(inSection: indexPath.section) - 1) {
            cell.isLastCell = true
        }
        cell.beginForElementLayout()
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headView: WLScheduleCellHeadView = WLScheduleCellHeadView.init(frame: CGRect.init(x: 0.0, y: 0.0, width: tableView.frame.width, height: headViewHeight))
        headView.dayText = "20"
        headView.monthText = "3月"
        headView.weekText = "星期日"
        headView.beginLaoutForElement()
        return headView
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footView: UIView = UIView.init(frame: CGRect.init(x: 0.0, y: 0.0, width: tableView.frame.width, height: footViewHeight))
        footView.backgroundColor = UIColor.white
        return footView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return footViewHeight
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return headViewHeight
    }
    
    
}
