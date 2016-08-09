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
    
    //@IBOutlet var dissmissView: UIView!
    @IBOutlet var sView: UIView!
    
    let app = UIApplication.sharedApplication()
    let image = ["home","profile","calendar","topup","gift","trophy","setting","logout"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.preferredContentSize = CGSizeMake(self.view.frame.size.height/8, self.view.frame.size.height)
        
        self.sView.frame = CGRectMake(0,0,self.view.frame.size.height, app.statusBarFrame.size.height)
        //self.dissmissView.frame = CGRectMake(0,0,self.view.frame.size.height/9,self.view.frame.size.height/9)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let indexPath = NSIndexPath(forRow: selectedItem, inSection: 0)
        tableView.selectRowAtIndexPath(indexPath, animated: false, scrollPosition: .None)
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return (self.view.frame.size.height - app.statusBarFrame.size.height)/8
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! MenuTableViewCell
        cell.imageIcon.image = UIImage(named: image[indexPath.row])
        
        return cell
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
        return tableView.visibleCells
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
//        var selectedCell:UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
//        selectedCell.contentView.backgroundColor = UIColor.redColor()
    
    }
    
}
