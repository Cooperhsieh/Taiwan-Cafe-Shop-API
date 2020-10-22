//
//  CoffeeDetailViewController.swift
//  Cafe_in_Taiwan_API
//
//  Created by Cooper on 2020/10/21.
//

import UIKit
import SafariServices

class CoffeeDetailViewController: UIViewController {
    
    @IBOutlet weak var cafeName: UILabel!
    @IBOutlet weak var cafeAddress: UILabel!
    @IBOutlet weak var cafeWifi: UILabel!
    @IBOutlet weak var cafeSocket: UILabel!
    @IBOutlet weak var cafeLimitTime: UILabel!
    @IBOutlet weak var cafeOpenTime: UILabel!
    @IBOutlet weak var cafeURL: UIButton!
    
    
    var cafeDetails: Coffee?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCoffeeDetails()
        
    }
    
    //按下按鈕抓到cafe API的官網資料，使用Safari Controller來開啟網頁
    @IBAction func btCafeURL(_ sender: Any) {
        if let url = URL(string: (cafeDetails?.url)!) {
            
            let safariController = SFSafariViewController(url: url)
            present(safariController, animated: true)
        }
    }

func fetchCoffeeDetails() {
    cafeName.text = cafeDetails?.name
    cafeAddress.text = cafeDetails?.address
    cafeWifi.text = String(cafeDetails!.wifi) + " ★"
    cafeSocket.text = cafeDetails?.socket
    cafeLimitTime.text = cafeDetails?.limited_time
    cafeOpenTime.text = cafeDetails?.open_time
    
    
    setTextInfo()
    setTextStyle()
}

func setTextStyle(){
    cafeName.font = UIFont.boldSystemFont(ofSize: 28)
    cafeName.textColor = UIColor(red: 92/255, green: 71/255, blue: 60/255, alpha: 1)
    cafeAddress.textColor = UIColor.blue
    cafeWifi.textColor = UIColor(red: 69/255, green: 151/255, blue: 236/255, alpha: 1)
    
    
}

func setTextInfo(){
    
    if cafeDetails?.socket == "" {
        cafeSocket.text = "沒有資訊"
        cafeSocket.textColor = UIColor.red
    } else if cafeDetails?.socket == "no" {
        cafeSocket.text = "少量插座" + " 👎🏽"
    } else if cafeDetails?.socket == "maybe"{
        cafeSocket.text = "一般，依座位分配"
    }else if cafeDetails?.socket == "yes"{
        cafeSocket.text = "很多插座" + " ✌🏽"
    }
    
    
    if cafeDetails?.limited_time == "" {
        cafeLimitTime.text = "沒有資訊"
        cafeLimitTime.textColor = UIColor.red
    } else if cafeDetails?.limited_time == "no" {
        cafeLimitTime.text = "一律不限時" + " ✌🏽"
    } else if cafeDetails?.limited_time == "maybe" {
        cafeLimitTime.text = "看情況，假日或客滿限時"
    } else if cafeDetails?.limited_time == "yes" {
        cafeLimitTime.text = "有限時" + " 👎🏽"
    }
    
    if cafeDetails?.open_time == "" {
        cafeOpenTime.text = "沒有資訊"
        cafeOpenTime.textColor = UIColor.red
    }
    
    if cafeDetails?.wifi == 0.0 {
        cafeWifi.text = String("無提供Wi-Fi")
        cafeWifi.textColor = UIColor.red
        
    }
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
