FROM centos:8

ENV TERRAFORM_VERSION "0.13.2"

RUN \
   yum install -y gcc && \
   yum install -y make && \
   yum install -y unzip && \
   yum install -y python3-pip && \
   yum install -y git

RUN \
   cd /tmp && \
   pip3 install awscli && \
   curl -SLO https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
   unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/local/bin && \
   rm -rf terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
   yum clean all

VOLUME /root/.aws

VOLUME /work
WORKDIR /work
