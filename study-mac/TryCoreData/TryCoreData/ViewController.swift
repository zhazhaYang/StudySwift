//
//  ViewController.swift
//  TryCoreData
//
//  Created by yang on 2019/7/22.
//  Copyright © 2019 yang. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var comboBox: NSComboBox!
    @IBOutlet weak var imageView: NSImageView!
    private var image: NSImage!
    private var imageData: NSData!
    private var test: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        let path = "file:///Users/yang/Desktop/yang.jpg"
//        let url = NSURL(string: path)
//        let imageData: NSData = try! NSData(contentsOf: url! as URL)
//        image = NSImage(data: imageData as Data)
//        self.imageView.image = image
        //userSelectedDirectory()
        //image = NSImage(data: imageData as Data)
       // self.imageView.image = image
        //updateData()
        //retrieveData()
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    func createData() {
        guard let appDelegate = NSApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let userEntity = NSEntityDescription.entity(forEntityName: "User", in: managedContext)!
        
        for i in 1...5 {
            let user = NSManagedObject(entity: userEntity, insertInto: managedContext)
            user.setValue("Y\(i)", forKey: "username")
            user.setValue("Y\(i)@test.com", forKey: "email")
            user.setValue("Y\(i)", forKey: "password")
        }
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func retrieveData() {
        guard let appDelegate = NSApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        //fetchRequest.predicate = NSPredicate(format: "forKey = %@", "username")
        do {
            let result = try managedContext.fetch(fetchRequest)
            for data in result as! [NSManagedObject] {
                print(data.value(forKey: "username") as! String)
                print(data.value(forKey: "email") as! String)
                comboBox.addItem(withObjectValue: data.value(forKey: "username") as! String)
//                if (data.value(forKey: "username") as! String) == "Y5" {
//                    self.image = NSImage(data: data.value(forKey: "image") as! Data)
//                    self.imageView.image = image
//                }
                }
            } catch {
                print("Failed")
            }
    }
    
    func updateData() {
        guard let appDelegate = NSApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "User")
        fetchRequest.predicate = NSPredicate(format: "username = %@", "Y5")
        do {
            let test = try managedContext.fetch(fetchRequest)
            
            let objectUpdate = test[0] as! NSManagedObject
//            objectUpdate.setValue("newName4", forKey: "username")
//            objectUpdate.setValue("newMail4", forKey: "email")
//            objectUpdate.setValue("newPassword4", forKey: "password")
            objectUpdate.setValue(imageData, forKey: "image")
            do {
                try managedContext.save()
            } catch {
                print(error)
            }
        } catch {
            print(error)
        }
    }
    
    func deleteData() {
        guard let appDelegate = NSApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        fetchRequest.predicate = NSPredicate(format: "username = %@", "Y3")
        
        do {
            let test = try managedContext.fetch(fetchRequest)
            
            let objectToDelete = test[0] as! NSManagedObject
            managedContext.delete(objectToDelete)
            
            do {
                try managedContext.save()
            } catch {
                print(error)
            }
        } catch {
            print(error)
        }
    }
    
    @IBAction func openPanelForSelection(_ sender: Any) {
        let openPanel: NSOpenPanel = NSOpenPanel()
        openPanel.canChooseDirectories = false
        openPanel.canChooseFiles = true
        openPanel.allowsMultipleSelection = false
        openPanel.allowedFileTypes = ["jpg","png"]
        openPanel.beginSheetModal(for: self.view.window!) { (response) in
            if response.rawValue == NSApplication.ModalResponse.OK.rawValue {
                let selectedURL = openPanel.url!
                self.imageData = NSData(contentsOf: selectedURL)
                self.test = self.test + 1
                print("tset22: \(String(describing: self.imageData))")
            }
        }
        print("test: \(self.test)")
    }

    @IBAction func showImage(_ sender: NSButton) {
//        image = NSImage(data: imageData as Data)
//        imageView.image = image
        //updateData()
        retrieveData()
//        image = NSImage(named: "yang")
//        self.imageView.image = image
    }
    
}






