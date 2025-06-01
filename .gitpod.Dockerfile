FROM gitpod/workspace-full

USER gitpod

RUN bash -c ". /home/gitpod/.sdkman/bin/sdkman-init.sh && \
    sdk install java 8.0.452-tem && \
    sdk install java 11.0.27-tem && \
    sdk install java 17.0.15-tem && \
    sdk install java 21.0.6-tem && \
    sdk default java 21.0.6-tem"

