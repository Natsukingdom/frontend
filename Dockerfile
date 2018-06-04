#ubuntu をベースイメージにする
FROM centos:latest

# ENVをdevelopmentに設定する
ENV MYENV=development

# /appDirectoryをワークDirectoryに設定
WORKDIR /nodejs/react-sample

# nodejs-8.10.0のinstall
RUN ["yum", "update", "-y"]
RUN curl --silent --location https://rpm.nodesource.com/setup_8.x | bash -
RUN ["yum", "install", "-y", "nodejs-8.10.0"]

# vim の install
RUN ["yum", "install", "-y", "vim"]

RUN ["mkdir", "react-sample"]
RUN ["npm", "init", "-y"]
RUN ["npm", "i", "react@16.2.0", "react-dom@16.2.0"]
RUN ["npm", "i", "-D", "webpack@4.4.1", "webpack-cli@2.0.11"]
COPY ./react-sample/package-lock.json package-lock.json

EXPOSE 3000

