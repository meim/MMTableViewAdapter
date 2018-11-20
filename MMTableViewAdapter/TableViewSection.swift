//
//  TableViewSection.swift
//  MMTableViewAdapter
//
//  Created by Mei Ma on 18/11/18.
//  Copyright © 2018 meim. All rights reserved.
//

import UIKit

public protocol TableViewSection {
    var cellViewHolders: [TableViewCellViewHolder] { get set }
    var headerViewHolder: TableViewSectionHeaderFooterViewHolder? { get }
    var footerViewHolder: TableViewSectionHeaderFooterViewHolder? { get }
}

public class SimpleTableViewSection: NSObject, TableViewSection {
    
    public var cellViewHolders: [TableViewCellViewHolder]
    
    public init(cellViewHolders: [TableViewCellViewHolder]) {
        self.cellViewHolders = cellViewHolders
    }
    
    public var headerViewHolder: TableViewSectionHeaderFooterViewHolder? {
        return nil
    }
    
    public var footerViewHolder: TableViewSectionHeaderFooterViewHolder? {
        return nil
    }
    
}
