//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)
var pthread = pthread_t(bitPattern: 0)
var attr = pthread_attr_t()

pthread_attr_init(&attr)
pthread_attr_set_qos_class_np(&attr, QOS_CLASS_USER_INITIATED, 0)
pthread_create(&pthread, &attr, { Pointer -> UnsafeMutableRawPointer? in
    print("text")
    pthread_set_qos_class_self_np(QOS_CLASS_BACKGROUND, 0)
    return nil
}, nil)


// objective-c
let nsthread = Thread {
    print("Text")
    print(qos_class_self())
}

nsthread.qualityOfService = .userInteractive
nsthread.start()

print(qos_class_main())
