//
//  ViewController.swift
//  ClickGame
//
//  Created by 乾太 on 2016/10/18.
//  Copyright © 2016年 乾太. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // 讀取記事本
    let preferences = UserDefaults.standard
    
    @IBOutlet weak var ClickButton: UIButton!
    @IBOutlet weak var Main_ClickUpdateButton: UIButton!
    @IBOutlet weak var Main_AutoUpdateButton: UIButton!
    @IBOutlet weak var Main_Label: UILabel!
    
    var _自動級數: Int = 1
    var _點擊級數: Int = 1
    var _金幣量: Int = 0
    
    var _自動升級倍率: Double = 3.3
    var _點擊升級倍率: Double = 2.2
    
    var _自動升級速度: Int = 1000
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self._initRead()
        self._updataMessage()
        _addCoin()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self._initWire()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func AutoButton(_ sender: AnyObject) {
        if (self._金幣量 > Int(pow(Double(self._自動級數), self._自動升級倍率))) {
            self._金幣量 -= Int(pow(Double(self._自動級數), self._自動升級倍率))
            self._自動級數 += 1
            self._updataMessage()
        } else {
        }
    }
    
    @IBAction func ClickButton(_ sender: AnyObject) {
        if (self._金幣量 > Int(pow(Double(self._點擊級數), self._點擊升級倍率))) {
            self._金幣量 -= Int(pow(Double(self._點擊級數), self._點擊升級倍率))
            self._點擊級數 += 1
            self._updataMessage()
        } else {
        }
    }
    
    @IBAction func _addCoinButton(_ sender: AnyObject) {
        self._金幣量 += _點擊級數
        self._updataMessage()
    }
    
    private func _addCoin() {
        self._updataMessage()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .milliseconds(self._自動升級速度)) {
            self._金幣量 += self._自動級數
            self._addCoin()
        }
    }
    
    private func _updataMessage() {
        self.Main_Label.text = "Coin = \(self._金幣量)"
        self.Main_AutoUpdateButton.setTitle("升級自動\n消耗 \(Int(pow(Double(self._自動級數), self._自動升級倍率)))", for: .normal)
        self.Main_ClickUpdateButton.setTitle("升級點擊\n消耗 \(Int(pow(Double(self._點擊級數), self._點擊升級倍率)))", for: .normal)
        self.ClickButton.setTitle("點我+\(self._點擊級數)", for: .normal)
    }
    
    private func _initRead() {
        if (self.preferences.object(forKey: "人家的第一次") == nil) {
            //
            self.preferences.setValue("已經沒有了", forKey: "人家的第一次")
            preferences.synchronize()
        } else {
            self._金幣量 = self.preferences.object(forKey: "金幣量") as! Int
            self._自動級數 = self.preferences.object(forKey: "自動級數") as! Int
            self._點擊級數 = self.preferences.object(forKey: "點擊級數") as! Int
            self._自動升級倍率 = self.preferences.object(forKey: "自動升級倍率") as! Double
            self._點擊升級倍率 = self.preferences.object(forKey: "點擊升級倍率") as! Double
            self._自動升級速度 = self.preferences.object(forKey: "自動升級速度") as! Int
        }
    }
    
    private func _initWire() {
        self.preferences.setValue(self._金幣量, forKey: "金幣量")
        self.preferences.setValue(self._自動級數, forKey: "自動級數")
        self.preferences.setValue(self._點擊級數, forKey: "點擊級數")
        self.preferences.setValue(self._自動升級倍率, forKey: "自動升級倍率")
        self.preferences.setValue(self._點擊升級倍率, forKey: "點擊升級倍率")
        self.preferences.setValue(self._自動升級速度, forKey: "自動升級速度")
        preferences.synchronize()
    }
    
}
