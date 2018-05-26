# Ubuntu 18.04 (Bionic) image with Miniconda
FROM ubuntu:bionic-20180426@sha256:c8c275751219dadad8fa56b3ac41ca6cb22219ff117ca98fe82b42f24e1ba64e
LABEL maintainer="Ratio"

USER root

# Copy useful "minimal" commands from util
COPY util/* /usr/local/bin/
RUN chmod +x /usr/local/bin/*

# Install all OS dependencies
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get -yq dist-upgrade && min-apt \
    wget \
    bzip2 \
    ca-certificates \
    sudo \
    locales \
    fonts-liberation
RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen

# Install Tini
RUN wget --quiet https://github.com/krallin/tini/releases/download/v0.18.0/tini && \
    echo "12D20136605531B09A2C2DAC02CCEE85E1B874EB322EF6BAF7561CD93F93C855 *tini" | sha256sum -c - && \
    mv tini /usr/local/bin/tini && \
    chmod +x /usr/local/bin/tini

# Configure Miniconda environment
ENV MINICONDA_VERSION=4.5.1 \
    MINICONDA_HASH=0c28787e3126238df24c5d4858bd0744 \
    CONDA_DIR=/opt/conda \
    SHELL=/bin/bash \
    NB_USER=jovyan \
    NB_UID=1000 \
    NB_GID=100 \
    LC_ALL=en_US.UTF-8 \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8
ENV PATH=$CONDA_DIR/bin:$PATH \
    HOME=/home/$NB_USER

# Add Python user to 'users' group
RUN useradd -m -s /bin/bash -N -u $NB_UID $NB_USER && \
    mkdir -p $CONDA_DIR && \
    chown $NB_USER:$NB_GID $CONDA_DIR && \
    chmod g+w /etc/passwd /etc/group && \
    # Setup work directory for backward-compatibility
    mkdir /home/$NB_USER/work && \
    fix-permissions $CONDA_DIR $HOME

USER $NB_USER

# Install Miniconda, configure, cleanup, fix permissions
RUN cd /tmp && \
    wget --quiet https://repo.continuum.io/miniconda/Miniconda3-${MINICONDA_VERSION}-Linux-x86_64.sh && \
    echo "${MINICONDA_HASH} *Miniconda3-${MINICONDA_VERSION}-Linux-x86_64.sh" | md5sum -c - && \
    /bin/bash Miniconda3-${MINICONDA_VERSION}-Linux-x86_64.sh -f -b -p $CONDA_DIR && \
    rm Miniconda3-${MINICONDA_VERSION}-Linux-x86_64.sh && \
    conda config --system --append channels conda-forge && \
    conda config --system --set auto_update_conda false && \
    conda config --system --set show_channel_urls true && \
    fix-permissions $CONDA_DIR $HOME && \
    clean-conda
