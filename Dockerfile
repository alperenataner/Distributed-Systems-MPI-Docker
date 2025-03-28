FROM ubuntu:20.04

# Zaman dilimi ayarı
ENV TZ=Europe/Istanbul
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Gerekli paketlerin kurulumu
RUN apt-get update && apt-get install -y \
    build-essential \
    wget \
    git \
    mpich \
    libmpich-dev \
    vim \
    && rm -rf /var/lib/apt/lists/*

# Çalışma dizini oluşturma
WORKDIR /app

# OpenMP için compiler flag'i ekleme
ENV CFLAGS="-fopenmp"
ENV LDFLAGS="-fopenmp"

# MPI için SSH yapılandırması
RUN apt-get update && apt-get install -y openssh-server && \
    mkdir /var/run/sshd && \
    echo 'root:mpi' | chpasswd && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH servisini başlatma
CMD ["/usr/sbin/sshd", "-D"] 