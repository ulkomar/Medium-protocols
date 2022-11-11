import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

class DoThat<T: Numeric> {
    var container = [T]()
    let paral = DispatchQueue(label: "Disp", attributes: .concurrent)
    let group = DispatchGroup()
    var result = [T]()
    
    init(_ array: [T]) {
        self.container = array
    }
    
    func mult() {
        for i in container {
            group.enter()
            paral.async(group: group) {
                self.result.append(i * i)
                print(Thread.current)
                self.group.leave()
            }
        }
        group.notify(queue: .main) {
            print("done")
        }
    }
}

let cont = DoThat<Int>([1, 2, 3, 4, 5])
cont.mult()
cont.result
