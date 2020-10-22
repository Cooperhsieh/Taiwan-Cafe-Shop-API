//
//  CoffeeTableViewController.swift
//  Cafe_in_Taiwan_API
//
//  Created by Cooper on 2020/10/21.
//

import UIKit

class CoffeeTableViewController: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet weak var coffeeTableView: UITableView!
    

    
    var cafes = [Coffee]()

    //API 抓資料
    func fetchCoffees() {
        if let urlStr = "https://cafenomad.tw/api/v1.2/cafes/".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
           let url = URL(string: urlStr){
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                if let data = data,
                   let coffeeResult = try? decoder.decode([Coffee].self, from: data) {
                    self.cafes = coffeeResult
                    
                    
                    //print(coffeeResult)
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                        
                    }
                }
            }.resume()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCoffees()
        searchBar()
    }
    
    //建立SearchBar 元件
    func searchBar() {
        let searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 50))
        searchBar.delegate = self
        searchBar.tintColor = UIColor.lightGray
        searchBar.placeholder = "搜尋城市"
        self.coffeeTableView.tableHeaderView = searchBar
        
    }

    //執行搜索功能
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let text = searchBar.text ?? ""
        if text == "" {
            fetchCoffees()
        } else {
            cafes = cafes.filter({ (coffee) -> Bool in
                return coffee.city.uppercased().contains(text.uppercased())
            })
        }
        self.tableView.reloadData()
        
    }
    
    // 點擊鍵盤上的Search按鈕時將鍵盤隱藏
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        self.tableView.reloadData()
        
    }
    
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return cafes.count
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(CoffeeTableViewCell.self)", for: indexPath) as! CoffeeTableViewCell
        
        
        let cafe = cafes[indexPath.row]
        cell.coffeeName.text = cafe.name
        cell.coffeeCity.text = cafe.city
        if cafe.city == "taipei" {
            cell.coffeeCity.text = "台北市"
        } else if cafe.city == "chiayi" {
            cell.coffeeCity.text = "嘉義市"
        } else if cafe.city == "taichung" {
            cell.coffeeCity.text = "台中市"
        } else if cafe.city == "kaohsiung" {
            cell.coffeeCity.text = "高雄市"
        } else if cafe.city == "taoyuan" {
            cell.coffeeCity.text = "桃園市"
        } else if cafe.city == "yilan" {
            cell.coffeeCity.text = "宜蘭縣"
        } else if cafe.city == "changhua" {
            cell.coffeeCity.text = "彰化縣"
        } else if cafe.city == "tainan" {
            cell.coffeeCity.text = "台南市"
        } else if cafe.city == "nantou" {
            cell.coffeeCity.text = "南投縣"
        } else if cafe.city == "hualien" {
            cell.coffeeCity.text = "花蓮縣"
        } else if cafe.city == "hsinchu" {
            cell.coffeeCity.text = "新竹市"
        } else if cafe.city == "pingtung" {
            cell.coffeeCity.text = "屏東市"
        } else if cafe.city == "miaoli" {
            cell.coffeeCity.text = "苗栗縣"
        } else if cafe.city == "taitung" {
            cell.coffeeCity.text = "台東縣"
        } else if cafe.city == "lienchiang" {
            cell.coffeeCity.text = "連江縣"
        } else if cafe.city == "penghu" {
            cell.coffeeCity.text = "澎湖縣"
        } else if cafe.city == "yunlin" {
            cell.coffeeCity.text = "雲林縣"
        } else if cafe.city == "keelung" {
            cell.coffeeCity.text = "基隆市"}
        
        
        cell.coffeePrice.text = String(cafe.cheap)
        
        if cafe.cheap == 0.0 {
            cell.coffeePrice.text = String("沒有價錢資訊")
            cell.coffeePrice.textColor = UIColor.red
        } else if cafe.cheap <= 2.0 {
            cell.coffeePrice.text = String("💰💰")
        } else if cafe.cheap <= 3.0 {
            cell.coffeePrice.text = String("💰💰💰")
        } else if cafe.cheap <= 4.0 {
            cell.coffeePrice.text = String("💰💰💰💰")
        } else if cafe.cheap <= 5.0 {
            cell.coffeePrice.text = String("💰💰💰💰💰")
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? CoffeeDetailViewController,
           let row = self.tableView.indexPathForSelectedRow?.row {
            let cafeList = cafes[row]
            controller.cafeDetails = cafeList
            
        }
    }
}
/*
 // Override to support conditional editing of the table view.
 override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
 // Return false if you do not want the specified item to be editable.
 return true
 }
 */

/*
 // Override to support editing the table view.
 override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
 if editingStyle == .delete {
 // Delete the row from the data source
 tableView.deleteRows(at: [indexPath], with: .fade)
 } else if editingStyle == .insert {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
 
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
 // Return false if you do not want the item to be re-orderable.
 return true
 }
 */

/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */


