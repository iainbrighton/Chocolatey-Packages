ARG GIT_COMMIT
FROM docker/dev-environments-default:stable-1
RUN echo "Based on commit: $GIT_COMMIT"
RUN apt-get update && sudo apt-get install -y gnupg apt-transport-https curl dirmngr ca-certificates
RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
RUN sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-debian-bullseye-prod bullseye main" > /etc/apt/sources.list.d/microsoft.list'
RUN apt update && sudo apt install -y powershell

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
RUN echo "deb https://download.mono-project.com/repo/debian stable-buster main" | tee /etc/apt/sources.list.d/mono-official-stable.list
RUN apt update
RUN apt install mono-devel

RUN wget https://packages.microsoft.com/config/debian/11/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb
RUN rm packages-microsoft-prod.deb
RUN apt-get update && apt-get install -y dotnet-sdk-7.0

RUN mkdir /usr/local/src/choco/
WORKDIR /usr/local/src/choco/
RUN git clone https://github.com/chocolatey/choco
RUN chmod +x *.sh
RUN ./build.sh