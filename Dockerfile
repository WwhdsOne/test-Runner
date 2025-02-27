# 使用 alpine:latest 作为基础镜像
FROM alpine:latest

# 创建应用目录
RUN mkdir -p /app

# 将编译好的二进制文件复制到容器的 /app 目录下
COPY main /app/myapp

# 设置工作目录
WORKDIR /app

# 设置容器启动时执行的命令
CMD ["/app/myapp"]