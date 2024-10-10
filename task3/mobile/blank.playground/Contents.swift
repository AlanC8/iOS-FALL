import Cocoa

var arr = [1,2,3,4,5,5,6]
var set = Set<Int>()
for i in arr {
    
    if set.contains(i){
        print("yes")
    }
    set.insert(i)
    print("no")
}

print(set)

for i in 1...100{
    if i % 2 != 0{
        print(i)
    }
}
