FROM moflow/afl-tools
RUN apt update

WORKDIR /work

RUN apt-get install -y make autoconf automake libtool libpng-dev libtiff-dev vim gdb

RUN git clone https://github.com/webmproject/libwebp.git

WORKDIR libwebp

RUN ./autogen.sh
RUN ./configure
RUN make
RUN make install

RUN mkdir in && mkdir out

RUN ./configure CC="afl-gcc" CXX="afl-g++" --disable-shared; make

WORKDIR in

RUN wget https://upload.wikimedia.org/wikipedia/commons/b/b4/Samoyede_Nauka_2003-07_asb_PICT1895_small.JPG
RUN wget http://clipart-library.com/data_images/122204.jpg
RUN wget https://www.drupal.org/files/druplicon-small.png
RUN wget https://cdn.dtcn.com/dt/dt-logo-small.png


