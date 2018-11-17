//
//  FormTableViewAdapter.swift
//  Example
//
//  Created by Mei Ma on 18/11/18.
//  Copyright © 2018 meim. All rights reserved.
//

import Foundation
import MMTableViewAdapter

class FormTableViewAdapter: TableViewAdapter {
    
    init() {
     super.init(dynamicCellViewHolderTypes: [
            FormTextFieldTableViewCellViewHolder.self,
            FormSwitchTableViewCellViewHolder.self
        ])
    }
    
    func populate() {
        let cellViewHolders: [TableViewCellViewHolder] = [
            FormTextFieldTableViewCellViewHolder(text: "First text field"),
            FormSwitchTableViewCellViewHolder(title: "First switch", isOn: true),
            FormTextFieldTableViewCellViewHolder(text: "Second text field"),
            FormSwitchTableViewCellViewHolder(title: "Second switch", isOn: false)
        ]
        super.replaceSections([SimpleTableViewSection(cellViewHolders: cellViewHolders)])
    }
}
