FROM rocker/ml:latest

# Clean any existing locks
USER root
RUN rm -f /var/lib/apt/lists/lock
RUN rm -f /var/lib/dpkg/lock

# update and install new packages
RUN apt-get clean
RUN apt-get update --yes
# RUN apt-get upgrade --yes

RUN apt-get install -y --no-install-recommends \
  tabix \
  build-essential \
  libperl-dev \
  zlib1g-dev \
  libbz2-dev \
  liblzma-dev \
  libcurl4-openssl-dev \
  libssl-dev \
  libxml2-dev \
  ed \
  less \
  locales \
  vim-tiny \
  wget \
  ca-certificates \
  fonts-texgyre \
  gfortran \
  fort77 \
  libreadline-dev \
  xorg-dev \
  liblzma-dev \
  libblas-dev \
  gcc-multilib \
  libpcre2-dev \
  libcurl4-openssl-dev \
  libharfbuzz-dev \
  libfribidi-dev \
  libfreetype6-dev \
  libpng-dev \
  libtiff5-dev \
  libjpeg-dev

# USER sm

# Additional R packages
ADD install_pkgs.R /tmp/
RUN Rscript /tmp/install_pkgs.R

# install shinyCNV in /opt/
COPY shinyCNV /opt/shinyCNV
ENV PATH="/opt/shinyCNV:${PATH}"

# install htslib
COPY htslib-1.14 /opt/htslib-1.14
RUN cd /opt/htslib-1.14 && \
  ./configure --prefix=/opt/htslib && \
  make && \
  make install
ENV PATH="/opt/htslib/bin:${PATH}"

#   # install PLINK
#   COPY plink /opt/plink
#   ENV PATH="/opt/plink:${PATH}"

#   # install PennCNV
#   COPY PennCNV-1.0.5 /opt/PennCNV-1.0.5
#   ENV PATH="/opt/PennCNV-1.0.5:${PATH}"
#   RUN cd /opt/PennCNV-1.0.5/kext && \
#     make

# install bcftools
COPY bcftools-1.14 /opt/bcftools-1.14
RUN cd /opt/bcftools-1.14 && \
  ./configure --prefix=/opt/bcftools && \
  make && \
  make install
ENV PATH="/opt/bcftools/bin:${PATH}"


# DeepEYE
# some libs for QT
RUN apt-get install -y libxcb*
RUN apt-get install -y libxkbcommon*
RUN apt-get install -y xauth
RUN apt-get install -y libdbus-1-3
# install pip and python packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    python3.6 \
    python3-pip
RUN pip3 install pandas numpy
RUN pip3 install Pyqt5==5.12.3 pyqtgraph==0.12.3
# install DeepEYE in /opt/
COPY eyeCNV /opt/eyeCNV
ENV PATH="/opt/eyeCNV:${PATH}"
