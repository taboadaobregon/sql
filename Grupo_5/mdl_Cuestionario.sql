/*
se deberá crear la base de datos con el siguiente nombre
BD_G5_TALLER_CONTACTABILIDAD
*/

/* 
 * TABLE: tb_Cliente 
 */

CREATE TABLE tb_Cliente(
    idCliente        int             IDENTITY(1,1),
    idcCliente       varchar(20)     NOT NULL,
    nombreCliente    varchar(100)    NOT NULL,
    emailCliente     varchar(100)    NULL,
    estadoCliente    char(1)         NOT NULL,
    CONSTRAINT PK4 PRIMARY KEY NONCLUSTERED (idCliente)
)
go



IF OBJECT_ID('tb_Cliente') IS NOT NULL
    PRINT '<<< CREATED TABLE tb_Cliente >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE tb_Cliente >>>'
go

/* 
 * TABLE: tb_Cuestionario 
 */

CREATE TABLE tb_Cuestionario(
    idCuestionario        int             IDENTITY(1,1),
    ordenPregunta         int             NOT NULL,
    tituloCuestionario    varchar(500)    NOT NULL,
    idTipoCuestionario    int             NOT NULL,
    idModulo              int             NOT NULL,
    estadoCuestionario    char(1)         NOT NULL,
    CONSTRAINT PK3 PRIMARY KEY NONCLUSTERED (idCuestionario)
)
go



IF OBJECT_ID('tb_Cuestionario') IS NOT NULL
    PRINT '<<< CREATED TABLE tb_Cuestionario >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE tb_Cuestionario >>>'
go

/* 
 * TABLE: tb_Evaluacion 
 */

CREATE TABLE tb_Evaluacion(
    idEvaluacion        int        IDENTITY(1,1),
    idModulo            int        NOT NULL,
    idCliente           int        NOT NULL,
    estadoEvaluacion    char(1)    NOT NULL,
    CONSTRAINT PK5 PRIMARY KEY NONCLUSTERED (idEvaluacion)
)
go



IF OBJECT_ID('tb_Evaluacion') IS NOT NULL
    PRINT '<<< CREATED TABLE tb_Evaluacion >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE tb_Evaluacion >>>'
go

/* 
 * TABLE: tb_Modulo 
 */

CREATE TABLE tb_Modulo(
    idModulo        int             IDENTITY(1,1),
    numeroModulo    int             NOT NULL,
    nombreModulo    varchar(100)    NOT NULL,
    estadoModulo    char(1)         NOT NULL,
    CONSTRAINT PK7 PRIMARY KEY NONCLUSTERED (idModulo)
)
go



IF OBJECT_ID('tb_Modulo') IS NOT NULL
    PRINT '<<< CREATED TABLE tb_Modulo >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE tb_Modulo >>>'
go

/* 
 * TABLE: tb_Respuesta 
 */

CREATE TABLE tb_Respuesta(
    idRespuesta            int             IDENTITY(1,1),
    idEvaluacion           int             NOT NULL,
    idCuestionario         int             NOT NULL,
    respuestaEvaluacion    varchar(500)    NULL,
    fechaRespuesta         datetime        NOT NULL,
    CONSTRAINT PK6 PRIMARY KEY NONCLUSTERED (idRespuesta)
)
go



IF OBJECT_ID('tb_Respuesta') IS NOT NULL
    PRINT '<<< CREATED TABLE tb_Respuesta >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE tb_Respuesta >>>'
go

/* 
 * TABLE: tb_TipoCuestionario 
 */

CREATE TABLE tb_TipoCuestionario(
    idTipoCuestionario        int             IDENTITY(1,1),
    nombreTipoCuestionario    varchar(100)    NOT NULL,
    estadoTipoCuestionario    char(1)         NOT NULL,
    CONSTRAINT PK2 PRIMARY KEY NONCLUSTERED (idTipoCuestionario)
)
go



IF OBJECT_ID('tb_TipoCuestionario') IS NOT NULL
    PRINT '<<< CREATED TABLE tb_TipoCuestionario >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE tb_TipoCuestionario >>>'
go

/* 
 * TABLE: tb_Cuestionario 
 */

ALTER TABLE tb_Cuestionario ADD CONSTRAINT Reftb_TipoCuestionario1 
    FOREIGN KEY (idTipoCuestionario)
    REFERENCES tb_TipoCuestionario(idTipoCuestionario)
go

ALTER TABLE tb_Cuestionario ADD CONSTRAINT Reftb_Modulo2 
    FOREIGN KEY (idModulo)
    REFERENCES tb_Modulo(idModulo)
go


/* 
 * TABLE: tb_Evaluacion 
 */

ALTER TABLE tb_Evaluacion ADD CONSTRAINT Reftb_Modulo3 
    FOREIGN KEY (idModulo)
    REFERENCES tb_Modulo(idModulo)
go

ALTER TABLE tb_Evaluacion ADD CONSTRAINT Reftb_Cliente4 
    FOREIGN KEY (idCliente)
    REFERENCES tb_Cliente(idCliente)
go


/* 
 * TABLE: tb_Respuesta 
 */

ALTER TABLE tb_Respuesta ADD CONSTRAINT Reftb_Evaluacion5 
    FOREIGN KEY (idEvaluacion)
    REFERENCES tb_Evaluacion(idEvaluacion)
go

ALTER TABLE tb_Respuesta ADD CONSTRAINT Reftb_Cuestionario6 
    FOREIGN KEY (idCuestionario)
    REFERENCES tb_Cuestionario(idCuestionario)
go


