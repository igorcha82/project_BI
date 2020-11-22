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
    office_id   INTEGER              COMMENT 'Номер офиса',
    org_Id      INTEGER NOT NULL     COMMENT 'Id организации'
);
COMMENT ON TABLE Office IS 'Офис';

CREATE TABLE IF NOT EXISTS User (
    id                INTEGER              COMMENT 'Уникальный идентификатор' PRIMARY KEY AUTO_INCREMENT ,
    name              VARCHAR(20) NOT NULL COMMENT 'Имя',
    secondname        VARCHAR(20)          COMMENT 'Фамилия',
    middlename        VARCHAR(20)          COMMENT 'Отчество',
    position          VARCHAR(20) NOT NULL COMMENT 'Должность', 
    Identificated     BOOL        NOT NULL COMMENT 'Cатус пользователя'   
);
COMMENT ON TABLE User IS 'Пользователь';

CREATE TABLE IF NOT EXISTS Document (
    id            INTEGER              COMMENT 'Уникальный идентификатор' PRIMARY KEY AUTO_INCREMENT ,
    name          VARCHAR(20) NOT NULL COMMENT 'Наименование документа',
    docDate       VARCHAR(10) NOT NULL COMMENT 'Дата документа',
    docNumber     VARCHAR(15) NOT NULL COMMENT 'Номер документа',
    isIdentified  BOOL        NOT NULL COMMENT 'Статус документа'
);
COMMENT ON TABLE Document IS 'Документ';


CREATE TABLE IF NOT EXISTS UserDocument (
    user_id       INTEGER  NOT NULL COMMENT 'Уникальный идентификатор пользователя',
    document_id  INTEGER  NOT NULL COMMENT 'Уникальный идентификатор документа',

    PRIMARY KEY (user_id, docNumber_id)
);
COMMENT ON TABLE UserDocument IS 'join-таблица для связи пользователя и документа';


CREATE INDEX IX_UserDocument_Id ON UserDocument (docNumber_id);
ALTER TABLE UserDocument ADD FOREIGN KEY (house_id) REFERENCES Document(id);

CREATE INDEX IX_DocumentUser_Id ON UserDocument(user_id);
ALTER TABLE UserDocument ADD FOREIGN KEY (user_id) REFERENCES User(id);

CREATE TABLE IF NOT EXISTS GuidDocument (
    name          VARCHAR(20) NOT NULL COMMENT 'Наименование документа',
    code          INTEGER     NOT NULL COMMENT 'Код документа'
);
COMMENT ON TABLE GuidDocument IS 'Справочник документов';

CREATE TABLE IF NOT EXISTS GuidCountry (
    name          VARCHAR(20) NOT NULL COMMENT 'Наименование страны',
    code          INTEGER     NOT NULL COMMENT 'Код страны'
);
COMMENT ON TABLE GuidCountry IS 'Справочник стран';

