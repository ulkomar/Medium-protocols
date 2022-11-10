import UIKit


// Unix - POSIX

var thread = pthread_t(bitPattern: 0)
var attr = pthread_attr_t()

pthread_attr_init(&attr)

pthread_create(&thread, &attr, { Pointer -> UnsafeMutableRawPointer? in
    print("Hello")
    return nil
}, nil)

// 2 thread
var nsthread = Thread {
    print("Hello thread 2")
}

nsthread.start()
