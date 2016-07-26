//
//  MenuViewController.swift
//  LenkilaUser
//
//  Created by Peeranut Mahatham on 7/23/2559 BE.
//  Copyright © 2559 Peeranut Mahatham. All rights reserved.
//


//////////////////// menu table
import UIKit
import SideMenu

protocol MenuViewControllerDelegate: class {
    func menu(menu: MenuViewController, didSelectItemAtIndex index: Int, atPoint point: CGPoint)
    func menuDidCancel(menu: MenuViewController)
}

class MenuViewController: UITableViewController {
    weak var delegate: MenuViewControllerDelegate?
    var selectedItem = 0
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let indexPath = NSIndexPath(forRow: selectedItem, inSection: 0)
        tableView.selectRowAtIndexPath(indexPath, animated: false, scrollPosition: .None)
    }
    
}

extension MenuViewController {
    @IBAction private func dismissMenu() {
        delegate?.menuDidCancel(self)
    }
}

//MARK: Menu protocol
extension  MenuViewController: Menu {
    var menuItems: [UIView] {
        return [tableView.tableHeaderView!] + tableView.visibleCells
    }
}

// MARK: - UITableViewDelegate
extension MenuViewController {
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        return indexPath == tableView.indexPathForSelectedRow ? nil : indexPath
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let rect = tableView.rectForRowAtIndexPath(indexPath)
        var point = CGPointMake(rect.midX, rect.midY)
        point = tableView.convertPoint(point, toView: nil)
        delegate?.menu(self, didSelectItemAtIndex: indexPath.row, atPoint:point)
    }
}
