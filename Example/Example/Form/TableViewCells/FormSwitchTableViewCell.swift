//
//  FormSwitchTableViewCell.swift
//  Example
//
//  Created by Mei Ma on 18/11/18.
//  Copyright © 2018 meim. All rights reserved.
//

import UIKit
import MMTableViewAdapter

class FormSwitchTableViewCell: UITableViewCell {

    @IBOutlet fileprivate weak var titleLabel: UILabel!
    @IBOutlet fileprivate weak var theSwitch: UISwitch!
    
}

class FormSwitchTableViewCellViewHolder: TableViewDynamicCellViewHolder {
    
    let title: String
    var isOn: Bool
    
    init(title: String, isOn: Bool) {
        self.title = title
        self.isOn = isOn
    }
    
    class var cellIdentifier: String {
        return "FormSwitchTableViewCell"
    }
    
    class var cellNib: UINib? {
        return UINib(nibName: "FormSwitchTableViewCell", bundle: Bundle(for: FormSwitchTableViewCell.self))
    }
    
    class var cellClass: AnyClass? {
        return nil
    }
    
    func configureCell(_ cell: UITableViewCell, at indexPath: IndexPath) {
        guard let cell = cell as? FormSwitchTableViewCell else {
            return
        }
        cell.titleLabel.text = title
        cell.theSwitch.isOn = isOn
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
}
