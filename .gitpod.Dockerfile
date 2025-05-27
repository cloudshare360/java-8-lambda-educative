FROM gitpod/workspace-full:latest

USER gitpod

# Ensure SDKMAN is initialized properly
ENV SDKMAN_DIR /home/gitpod/.sdkman
RUN mkdir -p $SDKMAN_DIR \
    && curl -s "https://get.sdkman.io " | bash \
    && source "$HOME/.sdkman/bin/sdkman-init.sh" \
    && sdk version

# Install multiple JDKs with retry logic
RUN bash -c "source /home/gitpod/.sdkman/bin/sdkman-init.sh && \
    echo 'Listing available Java versions...' && sdk list java | grep -i zulu || true"

# Retry installation up to 3 times
RUN bash -c "source /home/gitpod/.sdkman/bin/sdkman-init.sh && \
    for i in {1..3}; do \
        sdk install java 11.0.27.fx-zulu && break || sleep 5; \
    done"

RUN bash -c "source /home/gitpod/.sdkman/bin/sdkman-init.sh && \
    for i in {1..3}; do \
        sdk install java 17.0.15.fx-zulu && break || sleep 5; \
    done"

RUN bash -c "source /home/gitpod/.sdkman/bin/sdkman-init.sh && \
    for i in {1..3}; do \
        sdk install java 21.0.6-tem && break || sleep 5; \
    done"

# Set default Java version
RUN bash -c "source /home/gitpod/.sdkman/bin/sdkman-init.sh && \
    sdk default java 21.0.6-tem"

# Verify installations
RUN java --version && \
    javac --version && \
    ls -la /home/gitpod/.sdkman/candidates/java/

# Optional: set JAVA_HOME
ENV JAVA_HOME /home/gitpod/.sdkman/candidates/java/current