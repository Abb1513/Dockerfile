FROM centos:latest
MAINTAINER wangcq
ENV name Wangcq
COPY t.sh /usr/bin/
ENTRYPOINT ["t.sh"]
