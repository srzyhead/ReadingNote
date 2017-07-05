# Protobuf编解码

ProtobufDecoder仅仅负责解码,它不支持读半包。

使用Netty提供的ProtobufVarint32FrameDecoder,它可以处理半包消息。
