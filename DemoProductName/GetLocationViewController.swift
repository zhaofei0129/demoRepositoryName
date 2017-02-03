//
//  GetLocationViewController.swift
//  DemoProductName
//
//  Created by zhaofei on 2017/2/2.
//  Copyright © 2017年 organizationName. All rights reserved.
//

import UIKit

class GetLocationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let places = ["北京", "上海", "广州", "深圳", "杭州"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.white

        self.title = "选择城市"
        let leftBtn = UIBarButtonItem(title: "取消", style: .plain, target: self, action: #selector(cancel))
        self.navigationItem.leftBarButtonItem = leftBtn
        print("GetLocationVC")
        
        let tableView = UITableView(frame: self.view.frame, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        
//        let label = UILabel(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
//        label.backgroundColor = UIColor.green
//        self.view.addSubview(label)
//        label.text = str
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func cancel() {
        self.dismiss(animated: true) { 
            print("dismiss")
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return places.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "reusedCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: identifier)
        }
        if indexPath.section == 0 {
            cell?.textLabel?.text = place
        } else {
            cell?.textLabel?.text = places[indexPath.row]
        }
        return cell!
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "当前定位的城市"
        } else {
            return "所有城市"
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.section > 0 {
            place = places[indexPath.row]
        }
        print(place)
        self.dismiss(animated: true) {
            print("dismiss")
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
