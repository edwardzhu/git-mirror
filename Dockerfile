FROM edzhu/git-lfs:latest
LABEL maintainer="edward.zr.zhu@gmail.com"
ENV GIT_LIST="git.txt"
RUN mkdir /repos
COPY bash.sh /
VOLUME /repos
WORKDIR /repos
ENTRYPOINT [ "/bash.sh" ]