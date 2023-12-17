import UIKit

class SelectCarCell: UITableViewCell {
            
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
                
            super.init(style: style, reuseIdentifier: reuseIdentifier)
           
            contentView.backgroundColor = .backgroundTabBar
            
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
          
    }
