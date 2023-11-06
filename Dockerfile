# Use a lightweight base image
FROM ubuntu:latest

# Install required dependencies
RUN apt-get update && apt-get install -y curl

# Download and install the Yandex Disk CLI client
RUN curl -LO http://repo.yandex.ru/yandex-disk/yandex-disk_latest_amd64.deb && \
    dpkg -i yandex-disk_latest_amd64.deb \
    && rm yandex-disk_latest_amd64.deb

# Set the working directory
WORKDIR /yandex-disk

# Start the Yandex Disk CLI client
ENTRYPOINT ["yandex-disk"]
CMD ["--no-daemon", "--dir=/root/Yandex.Disk", "--exclude-dirs=first_not_sync_folder,second_not_sync_folder"]
