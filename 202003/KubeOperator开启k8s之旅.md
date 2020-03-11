# 什么是KbueOperator?

KubeOperator 是一个开源项目，在离线网络环境下，通过可视化 Web UI 在 VMware、Openstack 或者物理机上规划、部署和运营生产级别的 Kubernetes 集群。KubeOperator 是 Jumpserver 明星开源团队在 Kubernetes 领域的的又一全新力作。

## KubeOperator 的技术优势

按需创建：调用云平台 API，一键快速创建和部署 Kubernetes 集群 (即 Kubernetes as a Service)；
按需伸缩：快速伸缩 Kubernetes 集群，优化资源使用效率；
按需修补：快速升级和修补 Kubernetes 集群，并与社区最新版本同步，保证安全性；
自我修复：通过重建故障节点确保集群可用性；
离线部署：持续更新包括 Kubernetes 及常用组件的离线包；
Multi-AZ 支持：通过把 Kuernetes 集群 Master 节点分布在不同的故障域上确保高可用；

### 部署方式

1) 一主多节点类型： k8s集群由一个master节点，一个及以上的worker节点组成

2) 多主多节点类型： K8S集由三个master节点，三个及以上的worker节点组成

## 部署模式
KubeOperator 支持两种部署模式，一种是手动部署，一种是自动部署。

手动模式：用户需要自己准备物理机或虚拟机及 NFS 持久化存储。
自动模式：用户只需要绑定云平台（比如 VMware）账号信息，KubeOperator 会根据预先定义的部署计划来自动创建主机实现一键自动化部署。
Kubernetes 离线安装包
KubeOperator 提供完整的离线 Kubernetes 安装包，每个安装包会被构建成一个独立容器镜像供 KubeOperator 使用，离线安装包中包括以下三种内容：

Kubenetes 核心组件：包括 Kubenetes、Docker 及 etcd；
Kubenetes 附属组件（镜像）：包括网络、存储、监控、Dashboard 及常用工具；
操作系统 RPM 包：除 CentOS 7.6 Minimal 外的其他必备 RPM。安装包容器运行后是一个标准的 Yum 源服务器。
资源下载地址： https://download.csdn.net/download/xinshuzhan/11994743

以 Kubernetes 离线包 v1.15.4 为例，其包括的内容如下：

### Kubenetes 核心组件

| 分类 | 组件名称 | 版本

| | ---- | ---------- | -----------------

| | 核心 | kubernetes | 1.15.4

| | 核心 | etcd | 3.3.10

| | 核心 | docker | docker-ce-18.09.9 |

### 安装环境准备
1 环境要求
最低硬件配置: 2 CPU, 4G 内存, 50G 磁盘 （推荐大小是：4核8G内存100G磁盘）
操作系统要求: CentOS 7.6 / 7.7 Minimal （不支持 CentOS 8）
注：CentOS 7.6 Minimal ISO 下载链接：

链接：https://pan.baidu.com/s/1potf65zMMCrUS0MvklAHEw 提取码：4igp

2 下载离线包
请自行下载 KubeOperator 完整离线包，并复制到目标机器的 /tmp 目录下。

下载链接:
链接：https://pan.baidu.com/s/1Ujxukvbhfdk-jMQwvfnmgg 提取码：khql

### 安装 KubeOperator
```
$ cd /tmp
# 解压离线包
$ tar zxvf kubeOperator-v2.1.xx-release.tar.gz
# 查看防火墙状态
$ firewall-cmd --state
# 关闭防火墙
$ systemctl stop firewalld.service
# 进入项目目录
$ cd kubeOperator-v2.1.xx-release
# 运行安装脚本
$ ./kubeopsctl.sh install
# 查看 KubeOperator 状态
$ systemctl status kubeops
```

## 访问 KubeOperator
KubeOperator 默认监听 HTTP 80 端口。安装完毕后，请使用浏览器登录 KubeOperator 管理控制台。

注：KubeOperator 默认用户名和密码为: admin / kubeoperator@admin123 为了保证系统的安全，请在完成登录后，点击控制台右上角的"修改密码"进行密码的重置。
## 升级 KubeOperator
```
$ cd /tmp
# 下载新版本离线包
$ wget http://xxxxxxx.kubeOperator-v2.1.xx-release.tar.gz
# 解压离线包
$ tar zxvf kubeOperator-v2.1.xx-release.tar.gz
# 进入项目目录
$ cd kubeOperator-v2.1.xx-release
# 运行升级脚本
$ ./kubeopsctl.sh upgrade
# 查看 KubeOperator 状态
$ systemctl status kubeops
```

KubeOperator 默认监听 HTTP 80 端口。安装完毕后，请使用浏览器登录 KubeOperator 管理控制台。

注：KubeOperator 默认用户名和密码为: admin / kubeoperator@admin123 为了保证系统的安全，请在完成登录后，点击控制台右上角的"修改密码"进行密码的重置。
