//
//  TableViewAdapter.swift
//  MMTableViewAdapter
//
//  Created by Mei Ma on 18/11/18.
//  Copyright © 2018 meim. All rights reserved.
//

import UIKit

extension UITableView {
    
    public func registerAdapter(_ adapter: TableViewAdapter) {
        dataSource = adapter
        delegate = adapter
        adapter.tableView = self
        registerCellViewHolderTypes(adapter.dynamicCellViewHolderTypes)
        registerSectionHeaderFooterViewHolderTypes(adapter.dyanmicSectionHeaderFooterViewHolderTypes)
    }
    
    private func registerCellViewHolderTypes(_ cellViewHolderTypes: [TableViewDynamicCellViewHolder.Type]) {
        cellViewHolderTypes.forEach {
            let cellIdentifier = $0.cellIdentifier
            if let cellNib = $0.cellNib {
                register(cellNib, forCellReuseIdentifier: cellIdentifier)
            } else if let cellClass = $0.cellClass {
                register(cellClass, forCellReuseIdentifier: cellIdentifier)
            }
        }
    }
    
    private func registerSectionHeaderFooterViewHolderTypes(_ sectionHeaderFooterViewHolderTypes: [TableViewDynamicSectionHeaderFooterViewHolder.Type]) {
        sectionHeaderFooterViewHolderTypes.forEach {
            let viewIdentifier = $0.viewIdentifier
            if let viewNib = $0.viewNib {
                register(viewNib, forHeaderFooterViewReuseIdentifier: viewIdentifier)
            } else if let viewClass = $0.viewClass {
                register(viewClass, forHeaderFooterViewReuseIdentifier: viewIdentifier)
            }
        }
    }
    
}

protocol TableViewOperation {
    func replaceSections(_ sections: [TableViewSection])
    //TODO: More operations
}

open class TableViewAdapter: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    fileprivate var sections = [TableViewSection]()
    fileprivate weak var tableView: UITableView?
    fileprivate let dynamicCellViewHolderTypes: [TableViewDynamicCellViewHolder.Type]
    fileprivate let dyanmicSectionHeaderFooterViewHolderTypes: [TableViewDynamicSectionHeaderFooterViewHolder.Type]
    
    public init(dynamicCellViewHolderTypes: [TableViewDynamicCellViewHolder.Type] = [],
                dyanmicSectionHeaderFooterViewHolderTypes: [TableViewDynamicSectionHeaderFooterViewHolder.Type] = []) {
        self.dynamicCellViewHolderTypes = dynamicCellViewHolderTypes
        self.dyanmicSectionHeaderFooterViewHolderTypes = dyanmicSectionHeaderFooterViewHolderTypes
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].cellViewHolders.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cellViewHolder(at: indexPath).tableView(tableView, cellForRowAt: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellViewHolder(at: indexPath).tableView(tableView, estimatedHeightForRowAt: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellViewHolder(at: indexPath).tableView(tableView, heightForRowAt: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return sections[section].headerViewHolder?.tableView(tableView, viewForHeaderFooterInSection: section)
    }
    
    public func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return sections[section].footerViewHolder?.tableView(tableView, viewForHeaderFooterInSection: section)
    }
    
    public func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return sections[section].headerViewHolder?.tableView(tableView, estimatedHeightForHeaderFooterInSection: section) ?? 0
    }
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return sections[section].headerViewHolder?.tableView(tableView, heightForHeaderFooterInSection: section) ?? 0
    }
    
    public func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        return sections[section].footerViewHolder?.tableView(tableView, estimatedHeightForHeaderFooterInSection: section) ?? 0
    }
    
    public func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return sections[section].footerViewHolder?.tableView(tableView, heightForHeaderFooterInSection: section) ?? 0
    }
    
    public func cellViewHolder(at indexPath: IndexPath) -> TableViewCellViewHolder {
        return sections[indexPath.section].cellViewHolders[indexPath.row]
    }
    
}


extension TableViewAdapter: TableViewOperation {
    public func replaceSections(_ sections: [TableViewSection]) {
        self.sections = sections
        tableView?.reloadData()
    }
}
