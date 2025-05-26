FROM gitpod/workspace-full:latest

# Switch to user 'gitpod'
USER gitpod

# Install multiple JDKs using SDKMAN
RUN bash -c "source /home/gitpod/.sdkman/bin/sdkman-init.sh && \
    sdk install java 21.0.6-tem && \
    sdk default java 21.0.6-tem"