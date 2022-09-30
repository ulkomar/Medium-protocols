class Man {
    var name = "Person"
    deinit {
        print("We deleted person")
    }
}

var closure: (() -> Void)?

if true {
    let man = Man()
    closure = { [unowned man] in
        print(man.name)
    }
    
    closure!()
}



print("ended")
