FROM fedora:36

RUN dnf groupinstall -y "C Development Tools and Libraries"

RUN dnf install -y git zsh

RUN useradd -m -G wheel -s /usr/bin/zsh playground

RUN echo "playground:Linux" | chpasswd

RUN echo "root:Linux" | chpasswd

USER playground

WORKDIR /home/playground/workspaces

RUN curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh

CMD ["zsh"]

