# Cargas de projetos efetuado em hop


## Como rodar o projeto

1. Clone o projeto

```bash
git clone
```

2. Abra o Apache Hop na sua maquina local, crie um novo projeto apontando para o diretório onde você clonou o projeto.

3. Execute o projeto

4. Para testar o projeto usando a imagem docker personalizada, execute o comando abaixo:

```bash
docker build -f Dockerfile -t tech/taps:hop-v0.0.1 --build-arg TAP_NAME=hop-v0.0.1 .
```

5. Execute o container chamando a imagem criada e passando uma carga de dados para o apache hop executar.

```bash
docker run --name hop-local \
    -e HOP_LOG_LEVEL=Basic \
    -e HOP_PROJECT_FOLDER=/opt/hop/project \
    -e HOP_PROJECT_NAME=apache_hop_cargas \
    -e HOP_ENVIRONMENT_NAME=DEV \
    -e HOP_FILE_PATH=/opt/hop/project/cargas/alerta_telegram/master.hwf \
    -e HOP_RUN_CONFIG=local \
    tech/taps:hop-v0.0.1 \
    /bin/sh -c "/opt/hop/run.sh"
```
- HOP_LOG_LEVEL: Nível de log do apache hop
- HOP_PROJECT_FOLDER: Diretório onde o projeto está localizado
- HOP_PROJECT_NAME: Nome do projeto
- HOP_ENVIRONMENT_NAME: Nome do ambiente
- HOP_FILE_PATH: Caminho do arquivo de carga
- HOP_RUN_CONFIG: Configuração de execução do apache hop

6. Para verificar o status do container, execute o comando abaixo:

```bash
docker logs -f hop-local
```
