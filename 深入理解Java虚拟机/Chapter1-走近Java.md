# 走近 Java

### Java虚拟机发展史

#### Sun HotSpot VM

在2006年的JavaOne大会上,Sun公苛宣布最终会把Java开源,并在随后的一年,陆
续将JDK的各个部分(其中当然也包括了HotSpotVM)在GPL协议下公开了源码,并在此
基础上建立了OpenJDK。这样,HotSpotVM便成为了Sun JDK和Open JDK两个实现极度接近的JDK项目的共同虚拟机。

在2008年和2009年,Oracle公司分别收购了BEA公司和Sun公司,这样Oracle就同
时拥有了两款优秀的Java虚拟机:JRockitVM和HotSpotVM。Oracle公司宣布在不久的将来(大约应在发布JDK8的时候)会完成这两款虚拟机的整合工作,使之优势互补。整合的方式大致上是在HotSpot的基础上,移植JRockit的优秀特性,譬如使用JRockit的垃圾回收器与MissionControl服务,使用HotSpot的JIT编译器与混合的运行时系统。

### 展望Java技术的未来

- 模块化

- 混合语言

- 多核并行

早在JDK1.5就已经有java.util.concurrent包实现了一个粗粒度的并发框架。而jdk1.7中加入的java.util.concurrent.forkjoin包则是对这个企业框架的一次重要扩充。Fork/Join模式是处理并行编程的一个经典方法。虽然不能解决所
有的问题,但是在此模式的适用范围之内,能够轻松地利用多个CPU核心提供的计算资源来协作完成一个复杂的计算任务。

- 64位虚拟机

首先是内存问题,由于指针膨胀和各种数据类型对齐补白的原因,运行于64位系统上的Java应用需要消耗更多的内存,通常要比32位系统额外增加10%〜30%的内存消耗。

在JDK1.6Update14之后,提供了普通对象指针压缩功能(-XX:+UseCompressedOops,这个参数不建议显式设置,建议维持默认由虚拟机的Ergonomics机制自动开启),在执行代码时,动态植人压缩指令以节省内存消耗,但是开启压缩指针会增加执行代码数量,因为所有在Java堆里的、指向Java堆内对象的指针都会被压缩。
