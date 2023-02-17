FROM sonarqube:lts-community


LABEL maintainer="Leo <slzlzxlz@gmail.com>"


# plugin-branch
ARG PLUGIN_BRANCH_NAME=sonarqube-community-branch-plugin
ARG PLUGIN_BRANCH_VERSION=1.14.0
ARG PLUGIN_BRANCH_DOWNLOAD_URL=https://github.com/mc1arke/sonarqube-community-branch-plugin/releases/download
# plugin-cxx
ARG PLUGIN_CXX_NAME=sonar-cxx-plugin
ARG PLUGIN_CXX_VERSION=2.1.0
ARG PLUGIN_CXX_PATCH=428
ARG PLUGIN_CXX_DOWNLOAD_URL=https://github.com/SonarOpenCommunity/sonar-cxx/releases/download
# plugin-zh
ARG PLUGIN_ZH_NAME=sonar-l10n-zh-plugin
ARG PLUGIN_ZH_VERSIN=9.9
ARG PLUGIN_ZH_DOWNLOAD_URL=https://github.com/xuhuisheng/sonar-l10n-zh/releases/download


ENV SONAR_EXTENSIONS_PATH=/opt/sonarqube/extensions/plugins
ENV SONAR_WEB_JAVAADDITIONALOPTS="-javaagent:${SONAR_EXTENSIONS_PATH}/${PLUGIN_BRANCH_NAME}-${PLUGIN_BRANCH_VERSION}.jar=web"
ENV SONAR_CE_JAVAADDITIONALOPTS="-javaagent:${SONAR_EXTENSIONS_PATH}/${PLUGIN_BRANCH_NAME}-${PLUGIN_BRANCH_VERSION}.jar=ce"


RUN wget ${PLUGIN_BRANCH_DOWNLOAD_URL}/${PLUGIN_BRANCH_VERSION}/${PLUGIN_BRANCH_NAME}-${PLUGIN_BRANCH_VERSION}.jar -O ${SONAR_EXTENSIONS_PATH}/${PLUGIN_BRANCH_NAME}-${PLUGIN_BRANCH_VERSION}.jar \
&& wget ${PLUGIN_CXX_DOWNLOAD_URL}/cxx-${PLUGIN_CXX_VERSION}/${PLUGIN_CXX_NAME}-${PLUGIN_CXX_VERSION}.${PLUGIN_CXX_PATCH}.jar -O ${SONAR_EXTENSIONS_PATH}/${PLUGIN_CXX_NAME}-${PLUGIN_CXX_VERSION}.${PLUGIN_CXX_PATCH}.jar \
&& wget ${PLUGIN_ZH_DOWNLOAD_URL}/${PLUGIN_ZH_NAME}-${PLUGIN_ZH_VERSIN}/${PLUGIN_ZH_NAME}-${PLUGIN_ZH_VERSIN}.jar -O ${SONAR_EXTENSIONS_PATH}/${PLUGIN_ZH_NAME}-${PLUGIN_ZH_VERSIN}.jar
