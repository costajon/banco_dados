CREATE TABLE "endereco" (
  "end_cd_id" serial,
  "end_tx_rua" varchar(250),
  "end_tx_numero" Integer,
  "end_tx_comp" varchar(50),
  "end_tx_cidade" varchar(250),
  "end_tx_bairro" varchar(250),
  "end_tx_estado" varchar(26),
  PRIMARY KEY ("end_cd_id")
);

CREATE TABLE "acidente" (
  "aci_cd_id" serial,
  "aci_dt_datahora" date,
  "aci_tx_local" varchar(50),
  PRIMARY KEY ("aci_cd_id") 
);

CREATE TABLE "carro" (
  "car_cd_id" serial,
  "car_tx_registro" varchar(50),
  "car_tx_marca" varchar(50),
  "aci_cd_id" serial,
  PRIMARY KEY ("car_cd_id"),
  CONSTRAINT "FK_aci_cd_id"
    FOREIGN KEY ("aci_cd_id")
      REFERENCES "acidente"("aci_cd_id")
);

CREATE TABLE "apolice" (
  "apo_cd_id" serial,
  "apo_int_num" Integer,
  "apo_nm_valor" numeric,
  "car_cd_id" serial,
  PRIMARY KEY ("apo_cd_id"),
  CONSTRAINT "FK_car_cd_id"
    FOREIGN KEY ("car_cd_id")
      REFERENCES "carro"("car_cd_id")
);

CREATE TABLE "cliente" (
  "cli_cd_id" serial,
  "cli_int_num" Int4 not null,
  "cli_tx_nome" varchar(250),
  "cli_tx_endereco" varchar(250),
  "end_cd_id" serial,
  "apo_cd_id" serial,
  PRIMARY KEY ("cli_cd_id"),
  CONSTRAINT "FK_cliente.end_cd_id"
    FOREIGN KEY ("end_cd_id")
      REFERENCES "endereco"("end_cd_id"),
   CONSTRAINT "FK_cliente.apo_cd_id"
    FOREIGN KEY ("apo_cd_id")
      REFERENCES "apolice"("apo_cd_id")
);





