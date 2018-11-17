//
//  TableViewSection.swift
//  MMTableViewAdapter
//
//  Created by Mei Ma on 18/11/18.
//  Copyright © 2018 meim. All rights reserved.
//

import UIKit

public protocol TableViewSection: UICollectionViewDelegate {
    var cellViewHolders: [TableViewCellViewHolder] { get set }
    var headerViewHolder: TableViewSectionHeaderFooterViewHolder? { get }
    var footerViewHolder: TableViewSectionHeaderFooterViewHolder? { get }
}
