//
//  TableViewSectionHeaderFooterViewHolder.swift
//  MMTableViewAdapter
//
//  Created by Mei Ma on 18/11/18.
//  Copyright © 2018 meim. All rights reserved.
//

import UIKit

public protocol TableViewSectionHeaderFooterViewHolder {
    func tableView(_ tableView: UITableView, viewForHeaderFooterInSection section: Int) -> UIView?
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderFooterInSection section: Int) -> CGFloat
    func tableView(_ tableView: UITableView, heightForHeaderFooterInSection section: Int) -> CGFloat
}

public protocol TableViewStaticSectionHeaderFooterViewHolder: TableViewSectionHeaderFooterViewHolder {
    var view: UIView { get }
}

public protocol TableViewDynamicSectionHeaderFooterViewHolder: TableViewSectionHeaderFooterViewHolder {
    static var viewIdentifier: String { get }
    static var viewNib: UINib? { get }
    static var viewClass: AnyClass? { get }
    func configureView(_ view: UIView?, in section: Int)
}

extension TableViewStaticSectionHeaderFooterViewHolder {
    public func tableView(_ tableView: UITableView, viewForHeaderFooterInSection section: Int) -> UIView? {
        return view
    }
}

extension TableViewDynamicSectionHeaderFooterViewHolder {
    public func tableView(_ tableView: UITableView, viewForHeaderFooterInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: type(of: self).viewIdentifier)
        configureView(view, in: section)
        return view
    }
}
