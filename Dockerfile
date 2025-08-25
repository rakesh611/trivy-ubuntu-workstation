FROM ubuntu:22.04

# Install dependencies + SSH server
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
        curl wget gnupg lsb-release software-properties-common cron \
        openssh-server && \
    mkdir /var/run/sshd && \
    echo 'root:root' | chpasswd && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' /etc/pam.d/sshd && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Install Trivy
RUN curl -sfL https://raw.githubusercontent.com/aquasecurity/trivy/main/contrib/install.sh | sh && \
    mv ./bin/trivy /usr/local/bin/trivy

# Expose SSH
EXPOSE 22

# Start SSH + cron
CMD service ssh start && service cron start && tail -f /dev/null

