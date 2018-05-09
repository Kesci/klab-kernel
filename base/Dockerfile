FROM debian:jessie

MAINTAINER K-Lab Authors <service@kesci.com>

USER root

# Configure environment
ENV CONDA_DIR /opt/conda
ENV PATH $CONDA_DIR/bin:$PATH
ENV SHELL /bin/bash
ENV NB_USER kesci
ENV NB_UID 1000
ENV HOME /home/$NB_USER
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

# Install prerequisites
RUN echo "deb http://mirrors.tuna.tsinghua.edu.cn/debian/ jessie main contrib non-free \n\
deb http://mirrors.tuna.tsinghua.edu.cn/debian/ jessie-backports main contrib non-free \n\
deb http://mirrors.tuna.tsinghua.edu.cn/debian/ jessie-updates main contrib non-free \n\
deb http://mirrors.tuna.tsinghua.edu.cn/debian-security/ jessie/updates main contrib non-free \n\
deb-src http://mirrors.tuna.tsinghua.edu.cn/debian/ jessie main contrib non-free \n\
deb-src http://mirrors.tuna.tsinghua.edu.cn/debian/ jessie-backports main contrib non-free \n\
deb-src http://mirrors.tuna.tsinghua.edu.cn/debian/ jessie-updates main contrib non-free \n\
deb-src http://mirrors.tuna.tsinghua.edu.cn/debian-security/ jessie/updates main contrib non-free\n" > /etc/apt/sources.list && \
    # Update
    apt-get update && apt-get -yqq dist-upgrade && \
    # Basic utils
    apt-get install -yqq --no-install-recommends \
    build-essential \
    bzip2 \
    ca-certificates \
    iptables \
    locales \
    sudo \
    wget \
    # Install all OS dependencies for fully functional notebook server
    build-essential \
    emacs \
    git \
    inkscape \
    jed \
    libsm6 \
    libxrender1 \
    pandoc \
    python-dev \
    texlive-fonts-extra \
    texlive-fonts-recommended \
    texlive-generic-recommended \
    texlive-latex-base \
    texlive-latex-extra \
    unzip \
    vim \
    && \
    # Setup locales
    echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen && \
    # Create kesci user with UID=1000 and in the 'users' group
    useradd -m -s /bin/bash -N -u $NB_UID $NB_USER && \
    mkdir -p $CONDA_DIR && \
    chown $NB_USER $CONDA_DIR && \
    # Python pre-requisites
    apt-get install -yqq \
    libfontconfig1 \
    libfreetype6-dev \
    libglib2.0-0 \
    libsm6 \
    libxext6 \
    libxrender1 \
    # Pillow dependencies
    liblcms2-dev \
    libwebp-dev \
    zlib1g-dev \
    # R pre-requisites
    ca-certificates \
    fonts-dejavu \
    gcc \
    gfortran \
    graphviz \
    libxml2-dev \
    xz-utils

# Install Java8
RUN wget http://oimw2b6jj.bkt.clouddn.com/jdk-8u171-linux-x64.tar.gz && \
    mkdir /usr/lib/jvm && \
    tar zxf jdk-8u171-linux-x64.tar.gz -C /usr/lib/jvm && \
    rm jdk-8u171-linux-x64.tar.gz

ENV J2SDKDIR="/usr/lib/jvm/jdk1.8.0_171"
ENV J2REDIR="/usr/lib/jvm/jdk1.8.0_171/jre"
ENV JAVA_HOME="/usr/lib/jvm/jdk1.8.0_171"
ENV DERBY_HOME="/usr/lib/jvm/jdk1.8.0_171/db"
ENV PATH=$PATH:$J2SDKDIR/bin:$J2REDIR/bin:$DERBY_HOME/bin

# Setup kesci home directory and install conda
RUN su -m -l $NB_USER -c '\
    mkdir /home/$NB_USER/work && \
    mkdir /home/$NB_USER/.jupyter && \
    echo "cacert=/etc/ssl/certs/ca-certificates.crt" > /home/$NB_USER/.curlrc && \

    # Install conda as kesci
    cd /tmp && \
    mkdir -p $CONDA_DIR && \
    wget --quiet http://7xrkee.com1.z0.glb.clouddn.com/Miniconda3-latest-Linux-x86_64.sh && \

    sha256sum Miniconda3-latest-Linux-x86_64.sh && \
    /bin/bash Miniconda3-latest-Linux-x86_64.sh -f -b -p $CONDA_DIR && \
    rm Miniconda3-latest-Linux-x86_64.sh && \

    $CONDA_DIR/bin/conda --version && \
    $CONDA_DIR/bin/conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/ && \
    $CONDA_DIR/bin/conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main/ && \
    $CONDA_DIR/bin/conda config --set show_channel_urls yes && \

    $CONDA_DIR/bin/conda install --quiet --yes conda==4.2.11 && \
    $CONDA_DIR/bin/conda config --system --set auto_update_conda false && \
    $CONDA_DIR/bin/conda clean -tipsy \
    ' && \
    echo "jpeg 8*" >> /opt/conda/conda-meta/pinned

USER root

RUN cd /tmp && \
    wget https://bootstrap.pypa.io/get-pip.py && \
    python2 get-pip.py && \
    rm get-pip.py && \
    python2 -m pip install ipykernel && \
    python2 -m ipykernel install && \
    chown $NB_USER /usr/local/bin && \
    chown $NB_USER /usr/local/share && \
    chown -R $NB_USER /usr/local/lib/python2.7

USER $NB_USER

RUN echo "Install R and R basic packages" && \
    echo 'options("repos" = c(CRAN="https://mirrors.tuna.tsinghua.edu.cn/CRAN/"))' > ~/.Rprofile && \
    conda config --remove channels defaults && \
    conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/r && \
    conda install -y \
    'r-essentials=1.5.2' && \
    conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/bioconda/ && \
    conda config --add channels ataenzer && \
    conda config --add channels jsignell && \
    conda config --add channels pjones && \
    conda config --add channels omgarcia && \
    conda config --add channels cgat && \
    conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/conda-forge/ && \
    conda install -y \
    'r-xml=3.98_1.5' \
    'r-tm=0.6_2' \
    'r-rcolorbrewer=1.1_2' \
    'r-nnet=7.3.8' \
    'r-nlp=0.1_9' \
    'r-ggmap=2.6.1' \
    'r-dplyr=0.5.0' \
    'r-chron=2.3_47' \
    && \
    R -e " \
    install.packages('choroplethr'); \
    install.packages('choroplethrMaps'); \
    install.packages('Metrics'); \
    install.packages('DescTools'); \
    install.packages('tools'); \
    install.packages('grid'); \
    install.packages('WDI'); \
    install.packages('wordcloud'); \
    install.packages('wordcloud2'); \
    install.packages('xgboost'); \
    install.packages('h2o'); \
    install.packages('plotly'); \
    " \
    && \
    conda clean -tipsy

# Install fonts for matplotlib
COPY MicrosoftYaHei.ttf /opt/conda/lib/python3.5/site-packages/matplotlib/mpl-data/fonts/ttf/
COPY MicrosoftYaHei.ttf /usr/local/lib/python2.7/dist-packages/matplotlib/mpl-data/fonts/ttf/

# Make sure /usr/local/ and conda directories belong to user, and install fonts
USER root
RUN ls -lh /opt/conda/lib/python3.5/site-packages/matplotlib/mpl-data/ && \
    echo 'font.family         : sans-serif' >> /opt/conda/lib/python3.5/site-packages/matplotlib/mpl-data/matplotlibrc && \
    echo 'font.sans-serif     : Microsoft YaHei, DejaVu Sans, Bitstream Vera Sans, Lucida Grande, Verdana, Geneva, Lucid, Arial, Helvetica, Avant Garde, sans-serif' >> /opt/conda/lib/python3.5/site-packages/matplotlib/mpl-data/matplotlibrc && \
    echo 'font.family         : sans-serif' >> /usr/local/lib/python2.7/dist-packages/matplotlib/mpl-data/matplotlibrc && \
    echo 'font.sans-serif     : Microsoft YaHei, DejaVu Sans, Bitstream Vera Sans, Lucida Grande, Verdana, Geneva, Lucid, Arial, Helvetica, Avant Garde, sans-serif' >> /usr/local/lib/python2.7/dist-packages/matplotlib/mpl-data/matplotlibrc && \
    chown $NB_USER /usr/local/bin && \
    chown $NB_USER /usr/local/share && \
    chown -R $NB_USER /usr/local/lib && \
    chown -R $NB_USER /opt/conda/lib/python3.5/site-packages/ && \
    chown -R $NB_USER /usr/local/lib/python2.7/dist-packages/ && \
    mkdir -p /home/$NB_USER/.cache && chown $NB_USER -R /home/$NB_USER/.cache && \
    rm -rf /root/.cache/pip/* && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    chown -R $NB_USER:users /home/$NB_USER/.jupyter && \
    chown -R $NB_USER /home/$NB_USER/work && \
    mkdir -p /home/$NB_USER/input && \
    chown -R $NB_USER:users /home/$NB_USER/input && \
    rm -rf /home/$NB_USER/.cache/matplotlib/

WORKDIR /home/$NB_USER/work
