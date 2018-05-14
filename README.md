# GFLLoanDemo项目说明

------

本项目有以下几点说明：

> * 由于笔试题目要求使用的技术相对较为陈旧，本项目采用纯Native开发
> * 为提高开发效率，该项目首页建议采用`容器化`思路,通过下发模板形式展现首页，既能保证效率又能提升动态性(因为时间关系，该部分技术暂未实现)
> * 为提高开发效率，减少维护成本，该项目非首页部分采用Weex类技术实现(因为时间关系，该部分技术暂未实现)
> * 运行本项目前，请通过`pod install`安装第三方库


## 项目架构思路
整体架构采用`组件化`开发，
1. 第三方开源库通过`cocoapods`引入可快速提升开发效率和减少后期维护成本，对于第三方开源框架建议增加一层适配层，好处有两个，一是后期更改框架不需要改业务代码，二是可以将第三方的部分不合理接口进行重命名符合自己项目风格；
2. 整体项目需要严格控制分层，基础服务在最下层，基础业务在中层，普通业务在最上层，只能上层以来下层，不能下层依赖上层
3. 对于项目中比较稳定的独立模块建议采用`framework`引入
4. 对于项目中大模块建议通过`独立工程`形式编写


## 模块设计
1. 单个模块采用`MVVM`模式开发，目的是减少Controller的体积，Controller是非常容易膨胀，并且后期非常难以维护，通过`MVVM`可以较好的给Conroller瘦身
2. 对于`Model`的设计需要强调一点，无论是否采用`MVVM`模式，个人建议采用`thin model`，尽量把model设计的薄，这样可以方便Model后期的扩展和移植，Model太复杂不利于后面的移植

## 其他补充
1. Native开发UI采用Flex相对布局，结合传统Frame布局可以让UI开发效率大幅度提高 
2. 项目AppIcon和LaunchImage拿了平安贷款和招商银行的相关图标，特此说明
3. 平时上班太忙，Demo做的还非常粗糙(注释不够详细，格式不一定都合理)，有问题尽量提Issue吧；

## 程序运行截图
![img](https://raw.githubusercontent.com/wiki/sysuleiw/GFLLoanDemo/Simulator%20Screen%20Shot%20-%20iPhone%206s%20-%202018-05-15%20at%2001.44.47.png)

![img](https://raw.githubusercontent.com/wiki/sysuleiw/GFLLoanDemo/Simulator%20Screen%20Shot%20-%20iPhone%206s%20-%202018-05-15%20at%2001.45.09.png)

![img](https://raw.githubusercontent.com/wiki/sysuleiw/GFLLoanDemo/Simulator%20Screen%20Shot%20-%20iPhone%206s%20-%202018-05-15%20at%2001.45.14.png)

![img](https://raw.githubusercontent.com/wiki/sysuleiw/GFLLoanDemo/Simulator%20Screen%20Shot%20-%20iPhone%206s%20-%202018-05-15%20at%2001.45.16.png)

![img](https://raw.githubusercontent.com/wiki/sysuleiw/GFLLoanDemo/Simulator%20Screen%20Shot%20-%20iPhone%206s%20-%202018-05-15%20at%2001.45.18.png)

------

再一次感谢您花费时间阅读本项目说明，如有问题欢迎在Issue中提问！

作者 王磊     
2018 年 05月 15日    

