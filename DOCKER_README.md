# Docker Setup - AmaIma Database

## A. Pré-requisitos

- [Docker Desktop](https://www.docker.com/products/docker-desktop) instalado
- Docker Compose (vem com Docker Desktop)

## B. Como iniciar o banco de dados

### 1. Clonar ou usar este diretório

Certifique-se de estar no diretório raiz do projeto (`AmaIma/`)

### 2. Iniciar o serviço

```bash
docker-compose up -d
```

Ou com logs em tempo real:

```bash
docker-compose up
```

### 3. Verificar se está rodando

```bash
docker ps
```

Você deve ver um container `amaima_db` rodando.

## C. Conectar ao banco de dados

**Host:** `localhost`
**Porta:** `5432`
**Usuário:** `amaima_user` (ou o valor em `.env`)
**Senha:** Configure em `.env`
**Banco:** `amaima_db`

### Via psql (terminal)

```bash
psql -h localhost -U amaima_user -d amaima_db
```

### Via DBeaver ou outro gerenciador

Use os dados acima para conectar.

## D. Parar o banco de dados

```bash
docker-compose down
```

Para remover tudo (incluindo dados):

```bash
docker-compose down -v
```

## E. Notas importantes

- O arquivo `database.sql` é executado automaticamente na primeira inicialização
- Os dados são persistidos em um volume (`postgres_data`)
- Modifique as credenciais no arquivo `.env` antes de usar em produção
- `.env` contém senhas - adicione à `.gitignore` se usar Git

## F. Troubleshooting

### Porta 5432 já está em uso

```bash
docker-compose down
```

Ou mude a porta no `docker-compose.yml` (primeira porta para uma livre)

### Ver logs do container

```bash
docker-compose logs postgres
```

### Executar um comando no container

```bash
docker-compose exec postgres psql -U amaima_user -d amaima_db
```
