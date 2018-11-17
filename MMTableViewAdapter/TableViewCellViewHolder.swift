//
//  TableViewCellViewHolder.swift
//  MMTableViewAdapter
//
//  Created by Mei Ma on 18/11/18.
//  Copyright © 2018 meim. All rights reserved.
//

import UIKit

public protocol TableViewCellViewHolder {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
}

public protocol TableViewStaticCellViewHolder: TableViewCellViewHolder {
    var cell: UITableViewCell { get }
}

public protocol TableViewDynamicCellViewHolder: TableViewCellViewHolder {
    static var cellIdentifier: String { get }
    static var cellNib: UINib? { get }
    static var cellClass: AnyClass? { get }
    func configureCell(_ cell: UITableViewCell, at indexPath: IndexPath)
}

extension TableViewStaticCellViewHolder {
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cell
    }
}

extension TableViewDynamicCellViewHolder {
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: type(of: self).cellIdentifier, for: indexPath)
        configureCell(cell, at: indexPath)
        return cell
    }
}
