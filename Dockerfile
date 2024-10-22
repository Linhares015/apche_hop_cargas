FROM apache/hop:2.9.0

ARG TAP_NAME=''

# Copiando os arquivos necessários para o diretório de trabalho no contêiner
COPY . /opt/hop/project/

WORKDIR /opt/hop/project/

ENV TAP_NAME=$TAP_NAME

# Mudando temporariamente para root para ajustar as permissões
USER root

# Ajustar permissões de leitura e escrita para todos os usuários
RUN chmod -R a+rw /opt/hop/project/

# Voltar ao usuário padrão se necessário
USER hop

ENTRYPOINT ["/bin/sh", "/opt/hop/run.sh"]
