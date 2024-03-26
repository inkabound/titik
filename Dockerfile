FROM ubuntu:latest

USER root

RUN apt-get update && apt-get install -y \
    sudo \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -ms /bin/bash user && \
    echo "user ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

WORKDIR /home/user

COPY script.sh .

RUN chmod +x script.sh

CMD ["/bin/bash", "./script.sh"]
