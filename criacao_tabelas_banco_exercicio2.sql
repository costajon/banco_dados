CREATE TABLE "deposito" (
  "dep_cd_id" serial,
  "dep_tx_numero" varchar(50),
  "dep_tx_endereco" numeric,
  PRIMARY KEY ("dep_cd_id")
);

CREATE TABLE "peca" (
  "peca_cd_id" serial,
  "peca_tx_numero" varchar(50),
  "peca_nm_peso" numeric,
  "peca_tx_cor" varchar(20),
  "dep_cd_id" serial,
  PRIMARY KEY ("peca_cd_id"),
  CONSTRAINT "FK_peca.dep_cd_id"
    FOREIGN KEY ("dep_cd_id")
      REFERENCES "deposito"("dep_cd_id")
);

CREATE TABLE "departamento" (
  "dept_cd_id" serial,
  "dept_tx_numero" varchar(50),
  "dept_tx_setor" varchar(50),
  PRIMARY KEY ("dept_cd_id")
);

CREATE TABLE "funcionario" (
  "func_cd_id" serial,
  "func_tx_telefone" varchar(12),
  "func_nm_salario" numeric,
  "func_tx_nome" varchar(50),
  "dept_cd_id" serial,
  PRIMARY KEY ("func_cd_id"),
    CONSTRAINT "FK_func.dep_cd_id"
    FOREIGN KEY ("func_cd_id")
      REFERENCES "departamento"("dept_cd_id")
);

CREATE TABLE "fornecedor" (
  "forn_cd_id" serial,
  "forn_tx_endereco" varchar(50),
  "forn_tx_numero" varchar(50),
  "peca_cd_id" serial,
  PRIMARY KEY ("forn_cd_id"),
      CONSTRAINT "FK_peca_cd_id"
    FOREIGN KEY ("peca_cd_id")
      REFERENCES "peca"("peca_cd_id")
);


CREATE TABLE "projeto" (
  "proj_cd_id" serial,
  "proj_nm_orcamento" numeric,
  "proj_tx_numero" varchar(50),
  "forn_cd_id" serial,
  "peca_cd_id" serial,
  "func_cd_id" serial,
  PRIMARY KEY ("proj_cd_id"),
  CONSTRAINT "FK_projeto.func_cd_id"
    FOREIGN KEY ("func_cd_id")
      REFERENCES "funcionario"("func_cd_id"),
        CONSTRAINT "FK_projeto.peca_cd_id"
    FOREIGN KEY ("peca_cd_id")
      REFERENCES "peca"("peca_cd_id"),
        CONSTRAINT "FK_projeto.forn_cd_id"
    FOREIGN KEY ("forn_cd_id")
      REFERENCES "fornecedor"("forn_cd_id")  
);
