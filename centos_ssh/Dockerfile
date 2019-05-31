FROM centos
# 指定作者信息
MAINTAINER by wangcq

#解决systemd无法加载的问题
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == \
systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;
#挂载cgroup CGroup 是将任意进程进行分组化管理的 Linux 内核功能。
VOLUME [ "/sys/fs/cgroup" ]

# 安装openssh-server
RUN yum -y install openssh-server && yum install -y net-tools

RUN mkdir /var/run/sshd
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key
RUN ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key

# 指定root密码
RUN /bin/echo 'root:123456'|chpasswd
#开放端口22
EXPOSE 22
#启动sshd
CMD ["/usr/sbin/sshd -D"]
#加载开机启动项
CMD ["/usr/sbin/init","systemctl start sshd"]
