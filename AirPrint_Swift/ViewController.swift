import UIKit

class ViewController: UIViewController {

  @IBAction func print(_ sender: AnyObject) {
    let urlPath = "https://koenig-media.raywenderlich.com/downloads/RW-NSRegularExpression-Cheatsheet.pdf"
    let _ = URL(string: urlPath).flatMap{ printUrl($0) }
  }
  
  func printUrl(_ url: URL) {
    guard (UIPrintInteractionController.canPrint(url)) else {
      Swift.print("Unable to print: \(url)")
      return
    }
    
    showPrintInteraction(url)
  }
  
  func showPrintInteraction(_ url: URL) {
    let controller = UIPrintInteractionController.shared
    controller.printingItem = url
    controller.printInfo = printerInfo(url.lastPathComponent)
    controller.present(animated: true, completionHandler: nil)
  }
  
  func printerInfo(_ jobName: String) -> UIPrintInfo {
    let printInfo = UIPrintInfo.printInfo()
    printInfo.outputType = .general
    printInfo.jobName = jobName
    Swift.print("Printing: \(jobName)")
    return printInfo
  }
}
