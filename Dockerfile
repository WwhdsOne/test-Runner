# 使用官方的 Go 基础镜像
FROM golang:1.24 as builder

# 设置工作目录
WORKDIR /app

# 复制 go.mod 和 go.sum 文件
COPY go.mod go.sum ./

# 下载依赖
RUN go mod download

# 复制项目源代码
COPY . .

# 构建 Go 项目，生成可执行文件
RUN go build -v -o myapp .

# 使用轻量级的基础镜像
FROM alpine:latest

# 设置工作目录
WORKDIR /root/

# 从 builder 阶段复制可执行文件到当前镜像
COPY --from=builder /app/myapp .

# 暴露应用的端口（如果需要）
EXPOSE 8080

# 定义容器启动时执行的命令
CMD ["./myapp"]