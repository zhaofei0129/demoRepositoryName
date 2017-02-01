//
//  FirstSubViewController.swift
//  DemoProductName
//
//  Created by zhaofei on 2017/1/26.
//  Copyright © 2017年 organizationName. All rights reserved.
//

import UIKit

class FirstSubViewController: UIViewController, UIScrollViewDelegate {

    var scrollView: UIScrollView!
    var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.white
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 30, width: SCREEN_WIDTH, height: 120))
        scrollView.delegate = self
        let btn0 = UIButton(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 120))
        btn0.setImage(UIImage(named: "btn0_bg_image"), for: .normal)
        btn0.addTarget(self, action: #selector(clickBtn0), for: .touchUpInside)
        scrollView.addSubview(btn0)
        let btn1 = UIButton(frame: CGRect(x: SCREEN_WIDTH, y: 0, width: SCREEN_WIDTH, height: 120))
        btn1.setImage(UIImage(named: "btn1_bg_image"), for: .normal)
        btn1.addTarget(self, action: #selector(clickBtn1), for: .touchUpInside)
        scrollView.addSubview(btn1)
        let btn2 = UIButton(frame: CGRect(x: SCREEN_WIDTH * 2, y: 0, width: SCREEN_WIDTH, height: 120))
        btn2.setImage(UIImage(named: "btn2_bg_image"), for: .normal)
        btn2.addTarget(self, action: #selector(clickBtn2), for: .touchUpInside)
        scrollView.addSubview(btn2)
        scrollView.contentSize = CGSize(width: SCREEN_WIDTH * 3, height: 100)
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        self.view.addSubview(scrollView)
        
        pageControl = UIPageControl(frame: CGRect(x: 0, y: scrollView.frame.origin.y + scrollView.frame.height - 20, width: SCREEN_WIDTH, height: 20))
        pageControl.numberOfPages = 3
        pageControl.isEnabled = false
        //设置当前小点颜色
        //pageControl.currentPageIndicatorTintColor = UIColor.black
        //设置其余小点颜色
        //pageControl.pageIndicatorTintColor = UIColor.red
        self.view.addSubview(pageControl)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func clickBtn0() {
        let alert = UIAlertController(title: "title", message: "message", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "cancelTitle", style: .cancel) { (alert: UIAlertAction) in
            print("cancel")
        }
        let _default = UIAlertAction(title: "defaultTitle", style: .default) { (alert: UIAlertAction) in
            print("default")
        }
        let destructive = UIAlertAction(title: "destructiveTitle", style: .destructive) { (alert: UIAlertAction) in
            print("destructive")
        }
        alert.addAction(cancel)
        alert.addAction(_default)
        alert.addAction(destructive)
        self.present(alert, animated: true, completion: nil)
    }
    
    func clickBtn1() {
        let alert = UIAlertController(title: "clickBtn1", message: "message", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
    
    func clickBtn2() {
        let alert = UIAlertController(title: "clickBtn2", message: "message", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageWidth = scrollView.frame.width
        let page = floor((scrollView.contentOffset.x - pageWidth/2)/pageWidth) + 1
        pageControl.currentPage = Int(page)
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
