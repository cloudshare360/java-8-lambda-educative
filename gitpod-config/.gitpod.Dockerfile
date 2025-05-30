FROM gitpod/workspace-full:latest

# Switch to user 'gitpod'
USER gitpod

# Install multiple JDKs using SDKMAN
RUN bash -c "source /home/gitpod/.sdkman/bin/sdkman-init.sh && \
    sdk install java 11.0.27.fx-zulu && \
    sdk install java 17.0.15.fx-zulu && \
    sdk install java 21.0.6-tem && \
    sdk default java 21.0.6-tem"

# Optional: Set JAVA_HOME explicitly for environment consistency
ENV JAVA_HOME /home/gitpod/.sdkman/candidates/java/current