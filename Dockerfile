FROM centos:7

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

# Install Python 3 + Git
RUN yum update -y && \
	yum install -y \
	python3 \
	libselinux-python3 \
	yum clean all && \
	rm -rf /var/cache/yum

# Create a Linux user "docker"
RUN useradd docker
COPY ansible-solace /home/docker/ansible-solace

# Install Ansible
COPY requirements.txt /tmp/requirements.txt
RUN python3 -m pip install --user docker --upgrade pip && \
	python3 -m pip install --user docker ansible && \
	python3 -m pip install --user docker -r /tmp/requirements.txt
ENV PATH="/root/.local/bin:${PATH}"

# Install Solace collection
RUN ansible-galaxy collection install solace.pubsub_plus

CMD ["/usr/sbin/init"]
