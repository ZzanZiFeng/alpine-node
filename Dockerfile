# 构建基础镜像
FROM alpine:3.17 AS base
RUN apk add --no-cache --update nodejs npm \
  && npm install -g pnpm@8.6.3

