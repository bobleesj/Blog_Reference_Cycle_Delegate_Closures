/*: 
 
## Swift Capture List in Closures
Full tutotiral originally published on [Medium] by Bob Lee
 - Last Update on March 18, 2017
 - Swift 3 & iOS 10

[Medium]: https://medium.com/ios-geek-community/intro-to-swift-functional-programming-with-bob-9c503ca14f13#.x47hcc2mn
*/
//: Closure Reference Type
var a = 0
var b = 0

let newClosure: () -> () = { print(a, b) }


let closure = { print(a, b) }
closure()

a = 6
b = 9
closure()

//: Problem
var closureArray: [() -> ()] = []
var i = 0

for _ in 1...5 {
  closureArray.append {
    print(i)
  }
  i += 1
}


closureArray[0]() // 5 😲
closureArray[1]() // 5 🤔
closureArray[2]() // 5 😨
closureArray[3]() // 5 😭
closureArray[4]() // 5 😱

//: Don't Reference, Copy
var c = 0
var d = 0

//let smartClosure: () -> () = { _ in
//  print(c, d)
//}

let smartClosure: () -> () = { [c, d] in
  print(c, d)
}

smartClosure()
print("Cool, bruh")


c = 6
d = 9

smartClosure() // 0 0
print("Not changed, bruh")



//: Solve the Problem
//var smartClosureArray: [() -> ()] = []
//var j = 0
//
//for _ in 1...5 {
//  smartClosureArray.append { [j] in
//    print(j)
//  }
//  j += 1
//}

var smartClosureArray: [() -> ()] = []
var j = 0

for _ in 1...5 {
  smartClosureArray.append { [num = j] in
    print(num)
  }
  j += 1
}


smartClosureArray[0]() // 0 ☝️
smartClosureArray[1]() // 1 💪
smartClosureArray[2]() // 2 🎁
smartClosureArray[3]() // 3 🎉
smartClosureArray[4]() // 4 🎅





/*:
> Follow me on [Instagram](https://instagram.com/bobthedev) and [Facebook Page](https://facebook.com/bobthedeveloper) for personal journey and regular updates! All of my free resources available [here](https://bobleesj.gitbooks.io/bob-s-learning-journey/content/WORK.html)
*/

