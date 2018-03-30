
import Foundation

class TestModel : NSObject
{
    //带属性监视器的普通属性
    var name:String = ""
    {
        //在name属性变化前做点什么
        willSet
        {
            print("name 将设置新值 \(newValue) ")
        }
        //在age属性发生变化后做些什么
        didSet
        {
           print("name 已经设置新值 \(name) ")
        }
    }

}

var tt = TestModel()
tt.name = "biubiu"


/*程序输出
 name 将设置新值 biubiu
 name 已经设置新值 biubiu
 */
