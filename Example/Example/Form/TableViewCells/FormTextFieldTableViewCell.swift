//
//  FormTextFieldTableViewCell.swift
//  Example
//
//  Created by Mei Ma on 18/11/18.
//  Copyright © 2018 meim. All rights reserved.
//

import UIKit
import MMTableViewAdapter

class FormTextFieldTableViewCell: UITableViewCell {
    
    @IBOutlet fileprivate weak var textField: UITextField!
    
}

class FormTextFieldTableViewCellViewHolder: TableViewDynamicCellViewHolder {
    
    var text: String?
    
    init(text: String?) {
        self.text = text
    }
    
    class var cellIdentifier: String {
        return "FormTextFieldTableViewCell"
    }
    
    class var cellNib: UINib? {
        return UINib(nibName: "FormTextFieldTableViewCell", bundle: Bundle(for: FormTextFieldTableViewCell.self))
    }
    
    class var cellClass: AnyClass? {
        return nil
    }
    
    func configureCell(_ cell: UITableViewCell, at indexPath: IndexPath) {
        guard let cell = cell as? FormTextFieldTableViewCell else {
            return
        }
        cell.textField.text = text
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
}
