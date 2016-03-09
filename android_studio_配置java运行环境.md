##Android studio 配置JAVA运行环境

1.新建一个module

![image](http://7xrmo5.com1.z0.glb.clouddn.com/%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202016-03-07%20%E4%B8%8B%E5%8D%8811.19.12.png)
2.选择java  
![image](http://7xrmo5.com1.z0.glb.clouddn.com/%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202016-03-07%20%E4%B8%8B%E5%8D%8811.19.21.png)

3.进入到新建的java lib 的  build.gradle 文件
![image](http://7xrmo5.com1.z0.glb.clouddn.com/%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202016-03-07%20%E4%B8%8B%E5%8D%8811.19.51.png)

4.在apply plugin: 'java'下面写上

apply plugin: 'application'

5.添加启动类

mainClassName = 'com.example.MyClass'

task copyLicense {
    outputs.file new File("$buildDir/LICENSE")
    doLast {
        copy {
            from "LICENSE"
            into "$buildDir"
        }
    }
}

![image](http://7xrmo5.com1.z0.glb.clouddn.com/3BC2631D-29B7-49C8-9CAC-EB086955D0A9.png)

6.![image](http://7xrmo5.com1.z0.glb.clouddn.com/%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202016-03-07%20%E4%B8%8B%E5%8D%8811.21.22.png)

7.
完成第六步以后弹出此页面 选择Application
添加启动类的配置信息
![image](http://7xrmo5.com1.z0.glb.clouddn.com/%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202016-03-07%20%E4%B8%8B%E5%8D%8811.21.37.png)

8.填写红框中的信息
![image](http://7xrmo5.com1.z0.glb.clouddn.com/12.png)

9.use classpath of module  一栏中选中新建的javaLib,MainClass 选择JavaLib中的的默认类， Use alternative JRE 选择JDK 1.7或者1.8
然后完成

10.返回javaLib中，编写入口  main函数

public class MyClass {

    public static void main(String args[]) throws Exception {
        System.out.println("----");
    }

}
11.右击MyClass.java 选择 run ->MyClass.main()

12.完成