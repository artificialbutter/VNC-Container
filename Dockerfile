FROM lscr.io/linuxserver/webtop:ubuntu-kde 
ENV TITLE="uwu"

# add local files
COPY /root /

RUN kwriteconfig5 --file "$HOME/.config/plasma-org.kde.plasma.desktop-appletsrc" --group 'Containments' --group '1' --group 'Wallpaper' --group 'org.kde.image' --group 'General' --key 'Image' "/uwu/bg.png"

RUN apt update && \
    echo "**** install stuffs ****" && \
    apt install gdebi-core -y && \
    echo "**** cleanup ****" && \
    apt-get autoclean && \
    rm -rf \
    /config/.cache \
    /var/lib/apt/lists/* \
    /var/tmp/* \
    /tmp/*

# ports and volumes
EXPOSE 3000
VOLUME /config