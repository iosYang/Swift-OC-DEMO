# Swift-OC-DEMO
Swift与OC的混合开发DEMO
由于现在很多项目都是OC和Swift的混合开发，所以就涉及到了OC调用Swift、Swift调用OC这两种情况。
 
 1，   OC调用Swift的情况：
    系统会在项目中导入或者创建Swift文件的情况下，会自动创建一个类似 Swift与OC混合开发DEMO-Swift.h 这样一个.h文件；
        
        Swift与OC混合开发DEMO  ：  这个是项目名；
        -Swift.h             ：  这个是固定的写法；
 
    Xcode会自动把所有的Swift的文件的名称和外部函数、变量导入到 Swift与OC混合开发DEMO-Swift.h 中，我们只管使用就可以了。
 
    如果哪个OC文件要调用Swift的代码，像#import "Swift与OC混合开发DEMO-Swift.h" 这样，直接导入这个头文件就可以了；

 2，  Swift调用OC的情况：
    系统会在第一次创建Swift的文件会提示是否创建类似 Swift与OC混合开发DEMO-Bridging-Header.h这样的一个文件，如果没有提示，需要手动创建。
    
        Swift与OC混合开发DEMO  ：这个是项目名；
 
        -Bridging-Header.h   ：这个是固定的写法；桥接文件
 
        我们需要把在Swift中要调用的OC对应的.h文件都在 Swift与OC混合开发DEMO-Bridging-Header.h 中 import一下；
        #import "OCTableViewCell.h"
    
        这样在Swift的文件直接使用就可以了，不用在Swift中再次导入OC头文件。
    
 
 3，  关于Swift与OC语言的配置问题：
    在工程的Build Settings中  Packaging模块把 Defines Module 设置为 YES
