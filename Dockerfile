
FROM andrewosh/binder-base

MAINTAINER Enric Tejedor Saavedra <enric.tejedor.saavedra@cern.ch>

USER root

# Install ROOT prerequisites
RUN apt-get update
RUN apt-get install -y \
    libx11-6 \
    libxext6 \
    libxft2 \
    libxpm4

# Download and install ROOT master
WORKDIR /opt
RUN wget http://etejedor.web.cern.ch/etejedor/rootbooks/root_master.tar.gz 
RUN tar xzf root_master.tar.gz
RUN rm root_master.tar.gz

USER main

# Set ROOT environment
ENV ROOTSYS         "/opt/root"
ENV PATH            "$ROOTSYS/bin:$ROOTSYS/bin/bin:$PATH"
ENV LD_LIBRARY_PATH "$ROOTSYS/lib:$LD_LIBRARY_PATH"
ENV PYTHONPATH      "$ROOTSYS/lib:PYTHONPATH"

# Customise the ROOTbook
RUN pip install metakernel
RUN cp -r $ROOTSYS/etc/notebook/kernels/root $HOME/.ipython/kernels
RUN cp -r $ROOTSYS/etc/notebook/custom       $HOME/.ipython/profile_default/static
