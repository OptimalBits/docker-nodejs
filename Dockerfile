FROM phusion/baseimage:latest

# Set correct environment variables.
ENV HOME /root

# Regenerate SSH host keys. baseimage-docker does not contain any, so you
# have to do that yourself. You may also comment out this instruction; the
# init system will auto-generate one during boot.
RUN /etc/my_init.d/00_regen_ssh_host_keys.sh

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# ...put your own build instructions here...

# Building Nodejs
RUN apt-get update
RUN apt-get install -y make curl python python-dev python-pip python-virtualenv
RUN \
  cd /tmp && \
  curl http://nodejs.org/dist/node-latest.tar.gz | tar xvz  

RUN cd /tmp/node-v* && \
	./configure && \
  	CXX="g++ -Wno-unused-local-typedefs" && \
  	make && make install && make clean && \
  	cd /tmp && \
  	rm -rf /tmp/node-v* && \
  	npm install -g npm && \
  	echo -e '\n# Node.js\nexport PATH="node_modules/.bin:$PATH"' >> /root/.bashrc


# Define working directory.
WORKDIR /data

# Define default command.
CMD ["bash"]

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
