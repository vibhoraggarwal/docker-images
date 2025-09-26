FROM ubuntu:22.04

ARG USERNAME=vscode
ENV USERNAME=${USERNAME}
ENV USER_UID=1000
ENV USER_GID=1000

# Avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install base tools + TeX Live full (includes pdfLaTeX, bibtex, etc.)
RUN apt-get update && apt-get install -y \
    texlive-full \
    latexmk \
    make \
    git \
    curl \
    wget \
    unzip \
    inkscape \
    libcanberra-gtk-module \
    libcanberra-gtk3-module \
    && rm -rf /var/lib/apt/lists/*

# Install VS Code Remote DevContainer support tools
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    sudo \
    locales \
    gosu \
    passwd \
    python3 python3-pip \
    && locale-gen en_US.UTF-8

ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8

RUN pip install --no-cache-dir Jinja2

RUN echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["bash"]