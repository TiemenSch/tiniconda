# Alpine 3.7 image with Miniconda
FROM frolvlad/alpine-glibc@sha256:4d1f3e1a752fa1fdb7c59b937129fbf8517d963322f03e939387e09165cf6ea1
LABEL maintainer="Ratio"

USER root

# Copy useful "minimal" commands from util
COPY util/* /usr/local/bin/
RUN chmod +x /usr/local/bin/* && sync && \
    min-apk \
    tini \
    wget

# Configure Miniconda environment
ENV MINICONDA_VERSION=4.5.1 \
    MINICONDA_HASH=0c28787e3126238df24c5d4858bd0744 \
    CONDA_DIR=/opt/conda \
    LC_ALL=en_US.UTF-8 \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8
ENV PATH=$CONDA_DIR/bin:$PATH

# Install Miniconda, configure, cleanup, fix permissions
RUN cd /tmp && \
    wget --quiet https://repo.continuum.io/miniconda/Miniconda3-${MINICONDA_VERSION}-Linux-x86_64.sh && \
    echo "${MINICONDA_HASH} *Miniconda3-${MINICONDA_VERSION}-Linux-x86_64.sh" | md5sum -c - && \
    /bin/sh Miniconda3-${MINICONDA_VERSION}-Linux-x86_64.sh -f -b -p $CONDA_DIR && \
    rm Miniconda3-${MINICONDA_VERSION}-Linux-x86_64.sh && \
    conda config --system --append channels conda-forge && \
    conda config --system --set auto_update_conda false && \
    conda config --system --set show_channel_urls true && \
    clean-conda

RUN min-conda conda-build && \
    min-apk bash

ENTRYPOINT [ "/sbin/tini", "--" ]
CMD [ "/bin/bash" ]
