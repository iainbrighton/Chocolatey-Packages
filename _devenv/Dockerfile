ARG GIT_COMMIT
FROM chocolatey/choco:latest
RUN echo "Based on commit: $GIT_COMMIT"
RUN apt-get update && apt-get install -y git zsh wget
RUN sh -c "$(curl -fsSL https://github.com/deluan/zsh-in-docker/releases/download/v1.1.5/zsh-in-docker.sh)"

RUN wget https://packages.microsoft.com/config/debian/10/packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb
RUN apt update && apt install -y powershell