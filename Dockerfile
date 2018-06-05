#ubuntu をベースイメージにする
FROM centos:latest

# ENVをdevelopmentに設定する
ENV MYENV=development

# /appDirectoryをワークDirectoryに設定
WORKDIR /nodejs/react-sample

RUN curl --silent --location https://rpm.nodesource.com/setup_8.x | bash -

# nodejs と vim の インストール
RUN yum update -y && yum install -y \
nodejs-8.10.0 \
vim

COPY ./react-sample/package.json /nodejs/react-sample/package.json

RUN npm i

EXPOSE 3000

