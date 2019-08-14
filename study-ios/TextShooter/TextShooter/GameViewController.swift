//
//  GameViewController.swift
//  TextShooter
//
//  Created by yang on 2019/4/23.
//  Copyright © 2019 yang. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let scene = GameScene(size: view.frame.size, levelNumber: 1)
        let skView = self.view as! SKView
        
        skView.showsFPS = true
        skView.showsNodeCount = true
       
        //sprite kit applies additional optimizations to improve rendering performence
        skView.ignoresSiblingOrder = true
        
        //set the scale mode to fit the window
        scene.scaleMode = .aspectFill
        
        skView.presentScene(scene)
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
