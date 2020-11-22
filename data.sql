INSERT INTO Organization (id, inn, kpp, name, fullname, address, phone, active) VALUES (1, 123456, 654321, 'ООО ПАК', 'Общество с ограниченной ответственностью Первая Аудиторская Компания', 'СПб, ул.Восстания, 5', '+7(812)222-22-22', 0);

INSERT INTO Organization (id, inn, kpp, name, fullname, address, phone, active) VALUES (2, 789654, 654789, 'ООО ТА', 'Общество с ограниченной ответственностью ТРИ А', 'СПб, ул.Коммуны, 67', '+7(812) 333-33-33', 1);

INSERT INTO Office (office_id, org_id) VALUES (100, 1);

INSERT INTO Office (office_id, org_id) VALUES (120, 2);

INSERT INTO User (id, name, secondname, middlename, position, identificated) VALUES (1, 'Пётр', 'Иванов', 'Сергеевич', менеджер, 1);

INSERT INTO User (id, name, secondname, middlename, position, identificated) VALUES (2, 'Сергей', 'Петров', 'Алексеевич', директор, 1);

INSERT INTO Document (id, name, docDate, docNumber, , identificated) VALUES (1, 'паспорт', 12.01.1995, '1470 0000', 1);

INSERT INTO Document (id, name, docDate, docNumber, , identificated) VALUES (2, 'водительское удостоверение', 12.02.2005, '1111 000', 1);

INSERT INTO UserDocument (user_id, document_id) VALUES (1, 1);

INSERT INTO UserDocument (user_id, document_id) VALUES (2, 2);

INSERT INTO GuidDocument (name, id) VALUES ('паспорт', 21);

INSERT INTO GuidDocument (name, id) VALUES ('водительское удостоверение', 99);

INSERT INTO GuidCountry (name, code) VALUES ('Российская Федерация', 643);

INSERT INTO GuidCountry (name, code) VALUES ('Республика Беларусь', 112);