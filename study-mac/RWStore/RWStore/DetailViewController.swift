/**
 * Copyright (c) 2017 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import Cocoa

class DetailViewController: NSViewController {

  @IBOutlet weak var productImageView: NSImageView!
  @IBOutlet weak var titleLabel: NSTextField!
  @IBOutlet weak var descriptionLabel: NSTextField!
  @IBOutlet weak var audienceLabel: NSTextField!

  var selectedProduct: Product? {
    didSet {
      updateUI()
    }
  }

  override func viewWillAppear() {
    super.viewWillAppear()
    updateUI()
  }

  private func updateUI() {
    if isViewLoaded {
      if let product = selectedProduct {
        productImageView.image = product.image
        titleLabel.stringValue = product.title
        descriptionLabel.stringValue = product.descriptionText
        audienceLabel.stringValue = product.audience
      }
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do view setup here.
  }

}
