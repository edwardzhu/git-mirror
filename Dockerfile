FROM edzhu/git-lfs:latest
LABEL maintainer="edward.zr.zhu@gmail.com"
ENV GIT_LIST="git.txt"
ENV PROXY=""
RUN mkdir /repos
COPY bash.sh /
RUN chmod +x bash.sh
VOLUME /repos
WORKDIR /repos
ENTRYPOINT [ "/bash.sh" ]