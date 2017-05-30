//
//  SwiftDetailViewController.swift
//  Swift与OC混合开发DEMO
//
//  Created by 杨旗 on 2017/5/30.
//  Copyright © 2017年 杨旗. All rights reserved.
//

import UIKit

class SwiftDetailViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{

    @IBOutlet weak var swiftTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        swiftTableView.register(UINib.init(nibName: "OCTableViewCell", bundle: nil), forCellReuseIdentifier: "OCTableViewCell")
    }
    
    @IBAction func backClick(_ sender: Any) {
        //返回上一个页面
        self.dismiss(animated: true) { 
            
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.size.height/2.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let ocTableViewCell = tableView.dequeueReusableCell(withIdentifier: "OCTableViewCell")
        
        return ocTableViewCell!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
