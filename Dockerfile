FROM ubuntu:22.04

ARG TERRAFORM_VERSION=1.3.7

RUN apt-get update && DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get install -y \
  git \
  ansible \
  unzip \
  && rm -rf /var/lib/apt/lists/*

RUN wget --quiet https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
  && unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
  && mv terraform /usr/bin \
  && rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip

WORKDIR "/opt/vpnius"

RUN mkdir -p config

COPY . .

ENTRYPOINT ["/usr/bin/terraform"]

CMD ["apply", "-auto-approve"]
