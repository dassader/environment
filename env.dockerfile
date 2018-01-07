FROM ubuntu:16.04
RUN \
	apt-get update && \
	apt-get -y install software-properties-common && \
	add-apt-repository ppa:webupd8team/java && \
	echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
	apt-get update && \
	apt-get -y install curl nano ssh sudo htop nautilus oracle-java8-installer && \
	echo "X11UseLocalhost no" >> /etc/ssh/sshd_config && \
	rm -rf /var/lib/apt/lists/* && \
	rm -rf /var/cache/oracle-jdk8-installer && \
	mkdir /home/dev && \
	useradd --shell=/bin/bash dev && \
	echo "dev:dev" | chpasswd && \
	chown dev:dev /home/dev && \
	usermod -aG sudo dev
SHELL ["/bin/bash", "--login", "-c"]
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle
CMD bash