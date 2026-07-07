CREATE TABLE usuarios (
    id_usuario     SERIAL PRIMARY KEY,
    nome           VARCHAR(MAX) NOT NULL,
    email          VARCHAR(255) NOT NULL UNIQUE,
    senha_hash     VARCHAR(255) NOT NULL,
    data_cadastro  TIMESTAMP NOT NULL DEFAULT NOW()
    UNIQUE (id_usuario, email)
);
 
CREATE TABLE imagens (
    id_imagem              SERIAL PRIMARY KEY,
    nome_arquivo           VARCHAR(255) NOT NULL,
    formato                VARCHAR(10) NOT NULL,
    data_upload            TIMESTAMP NOT NULL DEFAULT NOW(),
    usuario_id_upload      INTEGER NOT NULL REFERENCES usuarios(id_usuario),
    caminho_armazenamento  VARCHAR(500) NOT NULL,
    titulo                 VARCHAR(255),
    categoria              VARCHAR(100),
    evento                 VARCHAR(150),
    local                  VARCHAR(150),
    descricao              TEXT
);
 
CREATE TABLE permissoes_acesso (
    id_permissao    SERIAL PRIMARY KEY,
    imagem_id       INTEGER NOT NULL REFERENCES imagens(id_imagem),
    usuario_id      INTEGER NOT NULL REFERENCES usuarios(id_usuario),
    data_concessao  TIMESTAMP NOT NULL DEFAULT NOW(),
    UNIQUE (imagem_id, usuario_id)
);

CREATE INDEX idx_imagens_categoria ON imagens (categoria);
CREATE INDEX idx_imagens_evento    ON imagens (evento);
CREATE INDEX idx_imagens_local     ON imagens (local);
CREATE INDEX idx_imagens_data      ON imagens (data_upload);
CREATE INDEX idx_imagens_descricao ON imagens USING GIN (to_tsvector('portuguese', descricao));
