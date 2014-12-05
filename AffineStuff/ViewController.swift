//
//  ViewController.swift
//  AffineStuff
//
//  Created by Chris Adamson on 12/5/14.
//  Copyright (c) 2014 Subsequently & Furthermore, Inc. CC0 License - http://creativecommons.org/about/cc0//
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

	@IBOutlet weak var canvasView: UIView!
	@IBOutlet weak var tableView: UITableView!

	var logoLayer : CALayer!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		logoLayer = CALayer()
		logoLayer.frame = CGRect (x: 0.0, y: 0.0, width: 100.0, height: 100.0)
		let logoImage = UIImage(named: "cocoaconf-logo")
		logoLayer.contents = logoImage!.CGImage
		canvasView.layer.addSublayer(logoLayer)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	//MARK: buttons
	
	@IBAction func handleXPlus20(sender: AnyObject) {
		var logoTransform = CATransform3DGetAffineTransform(self.logoLayer.transform)
		logoTransform = CGAffineTransformTranslate(logoTransform, 20, 0)
		self.logoLayer.setAffineTransform(logoTransform)
		self.tableView.reloadData()
	}
	@IBAction func handleXMinus20(sender: AnyObject) {
		var logoTransform = CATransform3DGetAffineTransform(self.logoLayer.transform)
		logoTransform = CGAffineTransformTranslate(logoTransform, -20, 0)
		self.logoLayer.setAffineTransform(logoTransform)
		self.tableView.reloadData()
	}
	@IBAction func handleYPlus20(sender: AnyObject) {
		var logoTransform = CATransform3DGetAffineTransform(self.logoLayer.transform)
		logoTransform = CGAffineTransformTranslate(logoTransform, 0, 20)
		self.logoLayer.setAffineTransform(logoTransform)
		self.tableView.reloadData()
	}
	@IBAction func handleYMinus20(sender: AnyObject) {
		var logoTransform = CATransform3DGetAffineTransform(self.logoLayer.transform)
		logoTransform = CGAffineTransformTranslate(logoTransform, 0, -20)
		self.logoLayer.setAffineTransform(logoTransform)
		self.tableView.reloadData()
	}
	@IBAction func handleXTimes2(sender: AnyObject) {
		var logoTransform = CATransform3DGetAffineTransform(self.logoLayer.transform)
		logoTransform = CGAffineTransformScale(logoTransform, 2.0, 1.0)
		self.logoLayer.setAffineTransform(logoTransform)
		self.tableView.reloadData()
	}
	@IBAction func handleXDividedBy2(sender: AnyObject) {
		var logoTransform = CATransform3DGetAffineTransform(self.logoLayer.transform)
		logoTransform = CGAffineTransformScale(logoTransform, 0.5, 1.0)
		self.logoLayer.setAffineTransform(logoTransform)
		self.tableView.reloadData()
	}
	@IBAction func handleYTimes2(sender: AnyObject) {
		var logoTransform = CATransform3DGetAffineTransform(self.logoLayer.transform)
		logoTransform = CGAffineTransformScale(logoTransform, 1.0, 2.0)
		self.logoLayer.setAffineTransform(logoTransform)
		self.tableView.reloadData()
	}
	@IBAction func handleYDividedBy2(sender: AnyObject) {
		var logoTransform = CATransform3DGetAffineTransform(self.logoLayer.transform)
		logoTransform = CGAffineTransformScale(logoTransform, 1.0, 0.5)
		self.logoLayer.setAffineTransform(logoTransform)
		self.tableView.reloadData()
	}
	@IBAction func handleXTimesNegative1(sender: AnyObject) {
		var logoTransform = CATransform3DGetAffineTransform(self.logoLayer.transform)
		logoTransform = CGAffineTransformScale(logoTransform, -1.0, 1.0)
		self.logoLayer.setAffineTransform(logoTransform)
		self.tableView.reloadData()
	}
	@IBAction func handleYTimesNegative1(sender: AnyObject) {
		var logoTransform = CATransform3DGetAffineTransform(self.logoLayer.transform)
		logoTransform = CGAffineTransformScale(logoTransform, 1.0, -1.0)
		self.logoLayer.setAffineTransform(logoTransform)
		self.tableView.reloadData()
	}
	@IBAction func handleRotateClockwise45(sender: AnyObject) {
		var logoTransform = CATransform3DGetAffineTransform(self.logoLayer.transform)
		logoTransform = CGAffineTransformRotate(logoTransform, CGFloat (M_PI / 4))
		self.logoLayer.setAffineTransform(logoTransform)
		self.tableView.reloadData()
	}
	@IBAction func handleRotateCounterClockwise45(sender: AnyObject) {
		var logoTransform = CATransform3DGetAffineTransform(self.logoLayer.transform)
		logoTransform = CGAffineTransformRotate(logoTransform, CGFloat (-1 * M_PI_4))
		self.logoLayer.setAffineTransform(logoTransform)
		self.tableView.reloadData()
	}
	@IBAction func handleReset(sender: AnyObject) {
		self.logoLayer.setAffineTransform(CGAffineTransformIdentity)
		self.tableView.reloadData()
	}
	
	//MARK: table stuff
	func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 6
	}
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		if let cell = tableView.dequeueReusableCellWithIdentifier("DefaultCell") as? UITableViewCell {
			let logoTransform = CATransform3DGetAffineTransform(self.logoLayer.transform)
			switch indexPath.row {
			case 0: cell.textLabel!.text = "a: \(logoTransform.a)"
			case 1: cell.textLabel!.text = "b: \(logoTransform.b)"
			case 2: cell.textLabel!.text = "c: \(logoTransform.c)"
			case 3: cell.textLabel!.text = "d: \(logoTransform.d)"
			case 4: cell.textLabel!.text = "tx: \(logoTransform.tx)"
			case 5: cell.textLabel!.text = "ty: \(logoTransform.ty)"
			default: cell.textLabel!.text = "wtf"
			}
			return cell
		} else {
			return UITableViewCell()
		}
	}
	
	
}

