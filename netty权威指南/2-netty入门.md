# netty入门

## netty 服务端开发

### 主流程

```java
// 配置服务端Reactor线程组
// 一个用于服务端接受客户端的连接
EventLoopGroup bossGroup = new NioEventLoopGroup();
// 用于进行SocketChannel的网络读写
EventLoopGroup workerGroup = new NioEventLoopGroup();

// Netty用于启动N10服务端的辅助启动类,目的是降低服务端的开发复杂度
ServerBootstrap b = new ServerBootstrap();

// ServerBootstrap的group方法,将两个NIO线程组当作入参传递到ServerBootstrap中。接着设置创建的Channel为NioServerSocketChannel,它的功能对应于JDKNI0类库中的ServerSocketChannel类。然后配置NioServerSocketChannel的TCP参数,此处将它的backlog设置为1024,最后绑定I/O事件的处理类ChildChannelHandler,它的作用类似于Reactor模式中的Handler类,主要用于处理网络I/O事件,例如记录日志、对消息进行编解码等。
b.group(bossGroup, workerGroup)
        .channel(NioServerSocketChannel.class)
        .option(ChannelOption.SO_BACKLOG, 1024)
        .childHandler(new ChildChannelHandler());

// 调用它的bind方法绑定监听端口,随后,调用它的同步阻塞方法sync等待绑定操作完成。完成之后Netty会返回一个ChannelFuture,它的功能类似于JDK的java.util.concurrent.Future,主要用于异步操作的通知回调。
ChannelFuture f = b.bind(port).sync();

// 等待服务端链路关闭之后main函数才退出
f.channel().closeFuture().sync();

// 优雅退出，释放线程池资源
bossGroup.shutdownGracefully();
workerGroup.shutdownGracefully();
```

*tip :*

*服务端socket处理客户端socket连接是需要一定时间的。ServerSocket有一个队列，存放还没有来得及处理的客户端Socket，这个队列的容量就是backlog的含义。如果队列已经被客户端socket占满了，如果还有新的连接过来，那么ServerSocket会拒绝新的连接。也就是说backlog提供了容量限制功能，避免太多的客户端socket占用太多服务器资源。*


### TimeServerHandler

TimeServerHandler继承自ChannelHandlerAdapter,它用于对网络事件进行读写操作,通常我们只需要关注channelRead和exceptionCaught方法

```java
@Override
public void channelRead(ChannelHandlerContext ctx, Object msg) throws Exception {
    // 将msg转换成Netty的ByteBuf对象。ByteBuf类似于JDK中的java.nio.ByteBuffer对象,不过它提供了更加强大和灵活的功能。
    ByteBuf buf = (ByteBuf) msg;
    byte[] req = new byte[buf.readableBytes()];
    buf.readBytes(req);
    String body = new String(req, "UTF-8");
    System.out.println("The time server receive order : " + body);
    // 对请求消息进行判断
    String currentTime = "QUERY TIME ORDER".equalsIgnoreCase(body) ? new java.util.Date(
            System.currentTimeMillis()).toString() : "BAD ORDER";
    ByteBuf resp = Unpooled.copiedBuffer(currentTime.getBytes());
    ctx.write(resp);
}
```
