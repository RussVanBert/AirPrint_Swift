import UIKit

class ViewController: UIViewController {

  @IBAction func print(sender: AnyObject) {
    let urlPath = "http://cdn2.raywenderlich.com/wp-content/uploads/2014/06/RW-Swift-Cheatsheet-0_3.pdf"
    if let url = NSURL(string: urlPath) {
      if (UIPrintInteractionController.canPrintURL(url)) {
        showPrintInteraction(url)
      } else {
        println("Unable to print: \(url)")
      }
    }
  }
  
  func showPrintInteraction(url: NSURL) {
    if var controller = UIPrintInteractionController.sharedPrintController() {
      controller.printingItem = url
      controller.printInfo = printerInfo(url.lastPathComponent!)
      controller.showsPageRange = true
      controller.presentAnimated(true, completionHandler: nil)
    }
  }
  
  func printerInfo(jobName: String) -> UIPrintInfo {
    let printInfo = UIPrintInfo.printInfo()
    printInfo.outputType = .General
    printInfo.jobName = jobName
    println("Printing: \(jobName)")
    return printInfo
  }
}
