//
//  GetLocationViewController.swift
//  DemoProductName
//
//  Created by zhaofei on 2017/2/2.
//  Copyright © 2017年 organizationName. All rights reserved.
//

import UIKit

class GetLocationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var places: [String] = []
    var headers: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.white

        for i in 0...99 {
            if i < 10 {
                places.append("0\(i)")
            } else {
                places.append("\(i)")
            }
            if i % 10 == 0 {
                headers.append("\(i / 10)")
            }
        }
        
        self.title = "选择城市"
        let leftBtn = UIBarButtonItem(title: "取消", style: .plain, target: self, action: #selector(cancel))
        self.navigationItem.leftBarButtonItem = leftBtn
        print("GetLocationVC")
        
        let tableView = UITableView(frame: self.view.frame, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        
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
            return 10
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "reusedCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: identifier)
        }
        if indexPath.section == 0 {
            cell?.textLabel?.text = locationPlace
        } else {
            cell?.textLabel?.text = places[(indexPath.section - 1) * 10 + indexPath.row]
        }
        return cell!
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return headers.count + 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "当前定位的城市"
        } else {
            return headers[section - 1]
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.section == 0 {
            selectedPlace = locationPlace
        } else {
            selectedPlace = places[(indexPath.section - 1) * 10 + indexPath.row]
        }
        self.dismiss(animated: true) {
            print("dismiss")
        }
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return headers
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        var count = 0
        for i in headers {
            if i == title {
                return count + 1
            }
            count += 1
        }
        
        return 0
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
