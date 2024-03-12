# 构建基础镜像
FROM alpine:3.17 AS base

RUN apk add --no-cache --update nodejs npm \
  && npm install -g pnpm@8.6.3 \
  # 清理 npm 缓存
  && npm cache clean --force \
  # 可选：删除 npm 本身，但通常不推荐这么做，因为它可能影响 nodejs 的其他功能
  && rm -rf /usr/lib/node_modules/npm \
  && find /usr/lib/node_modules/npm -name test -o -name .bin -type d | xargs rm -rf

