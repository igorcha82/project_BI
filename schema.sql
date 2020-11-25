CREATE TABLE IF NOT EXISTS Organization (
    id         INTEGER              COMMENT 'Уникальный идентификатор' PRIMARY KEY AUTO_INCREMENT ,
    inn        INTEGER NOT NULL     COMMENT 'ИНН',
    kpp        INTEGER NOT NULL     COMMENT 'КПП',
    name       VARCHAR(20) NOT NULL COMMENT 'Название',
    fullname   VARCHAR(100) NOT NULL COMMENT 'Полное название',
    address    VARCHAR(50) NOT NULL COMMENT 'Адрес',
    phone      VARCHAR(16)          COMMENT 'Телефон',
    active     BOOL        NOT NULL COMMENT 'Статус организации'
);
COMMENT ON TABLE Organization IS 'Организация';

CREATE TABLE IF NOT EXISTS Office (
    id          INTEGER              COMMENT 'Id офиса',
    org_id      INTEGER NOT NULL     COMMENT 'Id организации',
    name        INTEGER NOT NULL     COMMENT 'Номер офиса',
    phone       VARCHAR(16)          COMMENT 'Телефон офиса',
    address     VARCHAR(50)          COMMENT 'Адрес офиса',
    is_active   BOOL                 COMMENT 'Статус офиса',

);
COMMENT ON TABLE Office IS 'Офис';

CREATE TABLE IF NOT EXISTS User (
    id                INTEGER              COMMENT 'Уникальный идентификатор' PRIMARY KEY AUTO_INCREMENT ,
    company_id         INTEGER     NOT NULL COMMENT 'Идентификатор офиса',
    sitizen_id         INTEGER    NOT NULL COMMENT 'Гражданство',    
    name              VARCHAR(20) NOT NULL COMMENT 'Имя',
    secondname        VARCHAR(20)          COMMENT 'Фамилия',
    middlename        VARCHAR(20)          COMMENT 'Отчество',
    position          VARCHAR(20) NOT NULL COMMENT 'Должность', 
    Identificated     BOOL        NOT NULL COMMENT 'Cатус пользователя'   
);
COMMENT ON TABLE User IS 'Пользователь';

CREATE TABLE IF NOT EXISTS Document (
    user_id       INTEGER     NOT NULL COMMENT 'Идентификатор пользователя' PRIMARY KEY,
    document_type INTEGER     NOT NULL COMMENT 'Идентификатор документа',
    docDate       VARCHAR(10) NOT NULL COMMENT 'Дата документа',
    docNumber     VARCHAR(15) NOT NULL COMMENT 'Номер документа',
    
);
COMMENT ON TABLE Document IS 'Документ';


CREATE TABLE IF NOT EXISTS UserDocument (
    id            INTEGER      NOT NULL COMMENT 'порядковый Id документа' PRIMARY KEY,
    code          VARCHAR(20)  NOT NULL COMMENT 'Код документа',
    name          VARCHAR(50)  NOT NULL COMMENT 'Наименование документа',

);
COMMENT ON TABLE UserDocument IS 'join-таблица для связи пользователя и документа';


CREATE TABLE IF NOT EXISTS GuidCountry (
    id            INTEGER      NOT NULL COMMENT 'порядковый Id ' PRIMARY KEY,    
    name          VARCHAR(20) NOT NULL COMMENT 'Наименование страны',
    code          INTEGER     NOT NULL COMMENT 'Код страны'
);
COMMENT ON TABLE GuidCountry IS 'Справочник стран';

CREATE INDEX IX_Citizen_Id ON User(citizen_id);
ALTER TABLE User ADD CONSTRAINT country_id FOREIGN KEY (citizen_id) REFERENCES GuidCountry(id);

CREATE INDEX IX_UserCompany_id ON User(company_id);
ALTER TABLE User ADD CONSTRAINT company_id FOREIGN KEY (org_id) REFERENCES Organization(id);

CREATE INDEX IX_DocumentUser_Id ON Document(user_id);
ALTER TABLE Document ADD FOREIGN KEY (user_id) REFERENCES User(id);

CREATE INDEX IX_DocumentType_Id ON UserDocument(document_type);
ALTER TABLE UserDocument ADD FOREIGN KEY (document_type) REFERENCES Document(id);


