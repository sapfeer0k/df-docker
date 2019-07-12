FROM i386/debian:latest
MAINTAINER Sergei Lomakov <sergei@lomakov.net>

# Install packets: 
RUN apt-get update && apt-get install -y apt-utils libsdl-image1.2 libsdl-ttf2.0-0 libgtk2.0-0 libglu1-mesa libopenal1 libncurses5 libncursesw5 zlib1g lbzip2

ADD http://www.bay12games.com/dwarves/df_44_12_linux32.tar.bz2 /
RUN tar xf /df_44_12_linux32.tar.bz2
RUN rm /df_44_12_linux32.tar.bz2

# Disabled libs, let df use system's libs
RUN mv /df_linux/libs/libstdc++.so.6 /df_linux/libs/libstdc++.so.6.bak
RUN mv /df_linux/libs/libgcc_s.so.1 /df_linux/libs/libgcc_s.so.1.bak
# configure cli mode
RUN sed -i 's/SOUND:YES/SOUND:NO/g' /df_linux/data/init/init.txt
RUN sed -i 's/PRINT_MODE:2D/PRINT_MODE:TEXT/g' /df_linux/data/init/init.txt
# disable annoying output
RUN rm -f /df_linux/gamelog.txt ; ln -sf /dev/null /df_linux/gamelog.txt
RUN rm -f /df_linux/errorlog.txt ; ln -sf /dev/null /df_linux/errorlog.txt
RUN ln -sf /dev/null /df_linux/stdout.log
RUN ln -sf /dev/stderr /df_linux/stderr.log
# create and export save dir
RUN mkdir -p /df_linux/data/save
VOLUME /df_linux/data/save

WORKDIR /df_linux

CMD LD_PRELOAD=/lib/i386-linux-gnu/libz.so.1 /df_linux/df




