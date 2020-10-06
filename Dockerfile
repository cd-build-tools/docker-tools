FROM centos:7

ENV NODE_VERSION 10
ENV TERRAFORM_VERSION=0.13.2

RUN \
   yum -y update && \
   yum install -y curl && \
   yum install -y wget && \
   yum install -y unzip && \
   cd /tmp && curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py" && \
   python get-pip.py && pip install awscli && pip install aws-sam-cli && \
   wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
   unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/local/bin && \
   curl "https://rpm.nodesource.com/setup_${NODE_VERSION}.x" -o "setup_node.x" && \
   sh setup_node.x && yum -y install nodejs && \
   yum clean all

#tools mappings
VOLUME /root/.aws
VOLUME /root/.npm

#work area
VOLUME /work
WORKDIR /work

EXPOSE 3000
