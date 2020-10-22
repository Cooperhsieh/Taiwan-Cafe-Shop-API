//
//  CoffeeTableViewCell.swift
//  Cafe_in_Taiwan_API
//
//  Created by Cooper on 2020/10/21.
//

import UIKit

class CoffeeTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var coffeeName: UILabel!
    
    @IBOutlet weak var coffeeCity: UILabel!
    
    @IBOutlet weak var coffeePrice: UILabel!
    
   
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        coffeeName.font = UIFont.boldSystemFont(ofSize: 20)
        coffeeName.textColor = UIColor(red: 92/255, green: 71/255, blue: 60/255, alpha: 1)
        
    }
    
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
