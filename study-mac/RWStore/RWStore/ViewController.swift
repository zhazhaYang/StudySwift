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

class ViewController: NSViewController {

  @IBOutlet weak var productsButton: NSPopUpButton!

  private var products = [Product]()
  var selectedProduct: Product?

  private var overviewViewController: OverviewController?
  private var detailViewController: DetailViewController?

  override func viewDidLoad() {
    super.viewDidLoad()

    if let filePath = Bundle.main.path(forResource: "Products", ofType: "plist") {
      products = Product.productsList(filePath)
    }

    productsButton.removeAllItems()

    for product in products {
      productsButton.addItem(withTitle: product.title)
    }

    selectedProduct = products[0]
    productsButton.selectItem(at: 0)
  }

  override var representedObject: Any? {
    didSet {
      // Update the view, if already loaded.
    }
  }

  @IBAction func valueChanged(_ sender: NSPopUpButton) {
    if let bookTitle = sender.selectedItem?.title,
      let index = products.index(where: {$0.title == bookTitle}) {
      selectedProduct = products[index]
      overviewViewController?.selectedProduct = selectedProduct
      detailViewController?.selectedProduct = selectedProduct
    }
  }

  override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
    guard let tabViewController = segue.destinationController
      as? NSTabViewController else { return }

    for controller in tabViewController.childViewControllers {

      if let controller = controller as? OverviewController {
        overviewViewController = controller
        overviewViewController?.selectedProduct = selectedProduct
      } else if let controller = controller as? DetailViewController {
        detailViewController = controller
        detailViewController?.selectedProduct = selectedProduct
      }
    }
  }
  
}
