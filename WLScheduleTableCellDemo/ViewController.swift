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
    let footViewHeight: CGFloat = 0.01
    let headViewHeight: CGFloat = 40.0
    let cellIdentifi: String = "content_cell"
    let cellBeginIdentifi: String = "begin_cell"
    let cellEndIdentifi: String = "end_cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        table_view = UITableView.init(frame: CGRect.init(x: 0.0, y: 20.0, width: self.view.frame.width, height: self.view.frame.height - 20.0), style: UITableView.Style.plain)
        table_view?.register(WLScheduleTableViewCell.self, forCellReuseIdentifier: cellIdentifi)
        table_view?.register(WLScheduleTableViewCell.self, forCellReuseIdentifier: cellBeginIdentifi)
        table_view?.register(WLScheduleTableViewCell.self, forCellReuseIdentifier: cellEndIdentifi)
        table_view?.delegate = self
        table_view?.dataSource = self
        self.view.addSubview(table_view!)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: WLScheduleTableViewCell?
        if indexPath.row == 0 {
            cell = tableView.dequeueReusableCell(withIdentifier: cellBeginIdentifi) as? WLScheduleTableViewCell
            cell?.contentText = "time line begin"
            cell?.timeText = "10:00:00"
            cell?.isTimeLineBegin = true
            
        }else if indexPath.row == (tableView.numberOfRows(inSection: indexPath.section) - 1) {
            cell = tableView.dequeueReusableCell(withIdentifier: cellEndIdentifi) as? WLScheduleTableViewCell
            cell?.contentText = "time line end"
            cell?.timeText = "12:00:00"
            cell?.isTimeLineEnd = true
        }else{
            cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifi) as? WLScheduleTableViewCell
            cell?.contentText = "time line body"
            cell?.timeText = "11:00:00"
        }
        cell?.indexPath = indexPath
        cell?.marginLeft = 34.0
        cell?.expandBtnTitle = "收起"
        cell?.isShowExpandBtn = false
        cell?.isShowPicture = false
        cell?.isShowVideo = false
        cell?.contentHeight = 60.0
        cell?.commit()
        return cell ?? WLScheduleTableViewCell()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headView: WLScheduleCellHeadView = WLScheduleCellHeadView.init(frame: CGRect.init(x: 0.0, y: 0.0, width: tableView.frame.width, height: headViewHeight))
        headView.dayText = "20"
        headView.monthText = "3月"
        headView.weekText = "星期日"
        headView.commit()
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
}
