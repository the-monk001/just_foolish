# Use an official Ubuntu as a parent image
FROM debian:latest

# Set the maintainer label
LABEL maintainer="DUDE"

# Install required packages
RUN apt-get update && \
    apt-get install -y git fortune-mod cowsay netcat-openbsd && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Clone the wisecow repository
#RUN git clone https://github.com/nyrahul/wisecow.git /opt/wisecow
RUN git clone https://github.com/the-monk001/just_foolish.git /opt/wisecow

# Set path for fortune and cowsay
ENV PATH="/usr/games:${PATH}"

# Set the working directory
WORKDIR /opt/wisecow

# Ensure the script is executable
RUN chmod +x wisecow.sh

# Expose the port the app runs on
EXPOSE 4499

# Set the default command to run the script
CMD ["sh", "wisecow.sh"]
