![image](http://img2.tbcdn.cn/L1/461/1/845a3de12a57bdc5d4e4c3ca34bd72cc8befd66f.png)

###入口：

1. Swift没有main函数，这个有点像脚本语言。Swift程序的默认入口是main.swift文件
2. Android中，在AndroidManifest.xml中定义的Application

###变量
  
  1. Swift用let定义常量，Java里面是static final。 
  2. array跟Java中的array是一样的概念。dictionary就是Java中的map。dictionary的取值的方式是dictionary[key]，接口就像array一样，简洁方便。 
  3. nil在swift中就类似Java中的null。nil是没有初始化成功，是没有值
  
  4. optional value是指该value的值可以是nil，Swift默认一个var是不能赋值nil，除非它声明了optional。optional不能直接输出，而必须unwrap，形如optionalValue!。有点类似于Java中打包好的null判断。也可以用!代替?声明一个无需unwrap的var
  
###业务逻辑
 1.swich
 
	switch value {
		case condition1:
    		response to condition 1
		case condition2, condition3:
    		resoponse to condition 2 or 3
		default:
    		otherwise, do something else
	}
	
2. while循环和Java或者C++中基本一致，不过while后面直接写condition，不需要用括号。 
3. for循环和Java也基本一样，不过也是不需要括号。for循环中，..<的用法比较方便。下划线符号_（替代循环中的变量）能够忽略具体的值，并且不提供循环遍历时对值的访问。for-in则有点类似与Java中for eac

###函数

	func sayHelloAgain(personName: String) -> String {
    	return "Hello again, " + personName + "!"
	}
	
###类与结构
1. 类的构造函数，直接叫init()。类函数调用跟Java，C++基本一样。self相当于Java中的this。
2. 1.类的构造函数，直接叫init()。类函数调用跟Java，C++基本一样。self相当于Java中的this。 
2.在Swift中class的成员访问权限控制级别有public, internal, private，类似Java中的public, protected, private。

3. deinit是析构函数。Java中也有finalize()函数。不过Java的finalize()函数并不确保一定
被调用，所以并不推荐override该函数。 
4. 类的继承跟C++有点像，使用:。

		class SomeSubclass: SomeSuperclass {
    		// subclass definition goes here
		}

5. 他的setter和getter函数跟Java不太一样，是隐式调用的。我觉得Swift的设计思想是，用户只需关心输入和输出，其他的不用关心。例如此处只需关心需要set或者get。具体的set和get函数则是封装的，无需使用者去关心。又譬如上面提到的method的type，只要定义了输入和输出，就定义了一类method，那就可以对这种type有多种具体实现。

		struct Point {
    		var x = 0.0, y = 0.0
		}
		struct Size {
    		var width = 0.0, height = 0.0
		}
		struct Rect {
    		var origin = Point()
    		var size = Size()
    		var center: Point {
        		get {
            		 let centerX = origin.x + (size.width / 2)
            		 let centerY = origin.y + (size.height / 2)
             		 return Point(x: centerX, y: centerY)
         		 	}
         		set(newCenter) {
            		 origin.x = newCenter.x - (size.width / 2)
            		 origin.y = newCenter.y - (size.height / 2)
        		 }
     		}
 		}


 		var square = Rect(origin: Point(x: 0.0, y: 0.0),
     		size: Size(width: 10.0, height: 10.0))
 		let initialSquareCenter = square.center
 		square.center = Point(x: 15.0, y: 15.0)
 		print("square.origin is now at (\(square.origin.x), \(square.origin.y))")

6. Swift的枚举和Java类似，本质是一个类，里面可以包含函数。 
7. Swift的struct和class写法基本一样，区别在于struct传递的是内容的copy，而class传递的是引用。这个厉害啊。
8. 枚举还支持associated value，这个是Java没有的。

 		enum Barcode {
     		case UPCA(Int, Int, Int, Int)
   		  case QRCode(String)
 		}

 		var productBarcode = Barcode.UPCA(8, 85909, 51226, 3)

9. protocol类似于Java中的interface。 
10. extension比较强大，甚至变态，可以动态往某个类中增添函数以及成员变量，动态让某个类实现某个protocol，而无需修改该类源代码。Java新增成员变量，新增函数，实现某个interface，Java都只能通过继承实现。而这个直接实现，且对一切该类的对象生效，包括extend之前已经创建的对象。

 		extension Double {
     		var km: Double { return self * 1_000.0 }
     		var m: Double { return self }
     		var cm: Double { return self / 100.0 }
     		var mm: Double { return self / 1_000.0 }
    		 var ft: Double { return self / 3.28084 }
 		}
 		let oneInch = 25.4.mm
 		print("One inch is \(oneInch) meters")
 		// prints "One inch is 0.0254 meters"
 		let threeFeet = 3.ft
 		print("Three feet is \(threeFeet) meters")
 		// prints "Three feet is 0.914399970739201 meters"

11. Swift泛型和Java类似的，Swift的泛型支持where语句，可以在对类型控制之外，作更加精细的控制。

 		func allItemsMatch<
     		C1: Container, C2: Container
     		where C1.ItemType == C2.ItemType, C1.ItemType: Equatable>
     		(someContainer: C1, _ anotherContainer: C2) -> Bool {

        // check that both containers contain the same number of items
        if someContainer.count != anotherContainer.count {
            return false
        }

        // check each pair of items to see if they are equivalent
        for i in 0..<someContainer.count {
            if someContainer[i] != anotherContainer[i] {
                return false
            }
        }

        // all items match, so return true
        return true

}