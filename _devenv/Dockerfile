ARG GIT_COMMIT
FROM chocolatey/choco:latest
RUN echo "Based on commit: $GIT_COMMIT"
RUN apt-get update && apt-get install -y git zsh
RUN sh -c "$(curl -fsSL https://github.com/deluan/zsh-in-docker/releases/download/v1.1.5/zsh-in-docker.sh)"