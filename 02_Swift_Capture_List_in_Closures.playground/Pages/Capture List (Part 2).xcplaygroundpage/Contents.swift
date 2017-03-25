/*:
 
 ## Swift Retention Cycle in Closures and Delegate with Bob
 Full tutotiral originally published on Medium by Bob Lee
 - Last Update on March 26, 2017
 - Swift 3 & iOS 10

 */
//: Why Delegate is Weak
import UIKit

protocol SendDataDelegate: class{
  
}

class SendingVC {
  var delegate: SendDataDelegate?
}

class ReceivingVC: UIViewController, SendDataDelegate {
  lazy var sendingVC: SendingVC = {
    let vc = SendingVC()
    vc.delegate = self
    return vc
  }()
  
  deinit {
    print("I'm well gone, bruh")
  }
  
}


var receivingVC: ReceivingVC? = ReceivingVC()
receivingVC = nil

// ReceivingVC has property that has a reference to SendingVC. SendingVC has a property that has a reference to Receiving VC. 

//: Retention Cycle in Closures
class BobClass {
  var bobClosure: (() -> ())?
  var name: String = "Bob"
  
  init() {
    
   //self.bobClosure = { ("Bob the Developer") }
    
   // self.bobClosure = { print("\(self.name) the Developer") }
    
    self.bobClosure = { [weak self] in
      guard let object = self else {
        return
      }
      
      print("\(object.name) the Developer")
    }
    
//    self.bobClosure = { [unowned self] in
//      print("\(self.name) the Developer")
//    }
//    
//    
  }
  
  deinit {
    print("I'm gone...")
  }
}


var bobClass: BobClass? = BobClass()



/*:
 > Follow me on [Instagram](https://instagram.com/bobthedev) and [Facebook Page](https://facebook.com/bobthedeveloper) for personal journey and regular updates! All of my free resources available [here](https://learnswiftwithbob.com/RESOURCES.html)
 */
