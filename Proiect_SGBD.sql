-- 4.Creare tabele + primary keys 

-- Category

CREATE TABLE category (
    category_id   NUMBER(9) NOT NULL,
    category_name VARCHAR2(30) NOT NULL
);

ALTER TABLE category ADD CONSTRAINT category_pk PRIMARY KEY ( category_id );


-- Comments

CREATE TABLE Comments (
    comment_id   NUMBER(9) NOT NULL,
    text         VARCHAR2(200) NOT NULL,
    comment_date    DATE,
    post_id  NUMBER(9) NOT NULL
    
    );
    
ALTER TABLE Comments
    ADD CONSTRAINT comment_pk PRIMARY KEY ( comment_id );
   
    
-- Grup

CREATE TABLE Grup (
    grup_id   NUMBER(9) NOT NULL,
    grup_name VARCHAR2(30) NOT NULL,
    subject    VARCHAR2(40) NOT NULL,
    grup_date DATE
);

ALTER TABLE Grup ADD CONSTRAINT grup_pk PRIMARY KEY ( grup_id );
    

-- JOB 

CREATE TABLE job (
    job_id               NUMBER(9) NOT NULL,
    job_name             VARCHAR2(40) NOT NULL,
    description          VARCHAR2(300),
    work_start           NUMBER(3),
    work_end             NUMBER(3),
    experience           NUMBER(3),
    category_id          NUMBER(9) NOT NULL
);

ALTER TABLE job ADD CONSTRAINT job_pk PRIMARY KEY ( job_id);

-- Post

CREATE TABLE post (
    post_id                       NUMBER(9) NOT NULL,
    post_name                     VARCHAR2(50) NOT NULL,
    content                       VARCHAR2(300),
    post_date                     DATE,
    user_id                       NUMBER(9) NOT NULL
    
);

ALTER TABLE post
    ADD CONSTRAINT post_pk PRIMARY KEY ( post_id );
    
-- User

CREATE TABLE Users (

    user_id                  NUMBER(9) NOT NULL,
    first_name               VARCHAR2(30) NOT NULL,
    last_name                VARCHAR2(30) NOT NULL,
    email                    VARCHAR2(30),
    join_date                DATE,
    salary                   NUMBER(9),
    job_id               NUMBER(9) NOT NULL
    
);

ALTER TABLE Users
    ADD CONSTRAINT user_pk PRIMARY KEY ( user_id);
    
-- User-Group

CREATE TABLE user_group (
    
    user_id                  NUMBER(9) NOT NULL,
    grup_id                  NUMBER(9) NOT NULL

);

ALTER TABLE user_group
    ADD CONSTRAINT user_group_pk PRIMARY KEY ( user_id, grup_id);

-- /////////////////////////////////////////////////////////////////////

-- Foreign Keys

-- Comments - Post

ALTER TABLE Comments
    ADD CONSTRAINT comment_post_fk FOREIGN KEY ( post_id )
        REFERENCES post( post_id );
        
-- Job - Category

ALTER TABLE job
    ADD CONSTRAINT job_category_fk FOREIGN KEY ( category_id )
        REFERENCES category ( category_id );
        
-- Post - Users

ALTER TABLE post
    ADD CONSTRAINT post_user_fk FOREIGN KEY ( user_id )
        REFERENCES Users ( user_id );
        
-- User_group - Grup 

ALTER TABLE user_group
    ADD CONSTRAINT user_group_group_fk FOREIGN KEY ( grup_id )
        REFERENCES Grup ( grup_id );
 
-- User_group - Users

ALTER TABLE user_group
    ADD CONSTRAINT user_group_user_fk FOREIGN KEY ( user_id )
        REFERENCES Users ( user_id );
        
-- Users - Job

ALTER TABLE Users
    ADD CONSTRAINT user_job_fk FOREIGN KEY ( job_id )
        REFERENCES job ( job_id );
        
        
--/////////////////////////////////////////////////////////////////

-- 5. Inserare date

-- Category 

INSERT INTO CATEGORY VALUES (1, 'IT');
INSERT INTO CATEGORY VALUES (2, 'Marketing');
INSERT INTO CATEGORY VALUES (3, 'Sales');
INSERT INTO CATEGORY VALUES (4, 'Politics');
INSERT INTO CATEGORY VALUES (5, 'Education');

-- Job

INSERT INTO Job VALUES (1, 'FrontEnd Developer', 'Developing Web Applications', 8, 16, 2, 1);
INSERT INTO Job VALUES (2, 'BackEnd Developer', 'Developing Servers', 10, 16, 1, 1);
INSERT INTO Job VALUES (3, 'Software Engineer', 'Working to improve Google', 9, 20, 4, 1);

INSERT INTO Job VALUES (4, 'Shop Owner', 'The head of a small company', 9, 20, 4, 2);
INSERT INTO Job VALUES (5, 'Accountant', 'Solving all the paperwork', 8, 16, 1, 2);

INSERT INTO Job VALUES (6, 'Real Estate Agent', 'The man to call when you need a new home', 9, 20, 3, 3);

INSERT INTO Job VALUES (7, 'Lawyer', 'Fighting for justice', 8, 14, 1, 4);
INSERT INTO Job VALUES (8, 'Judge', 'Keeping peace', 8, 14, 5, 4);
INSERT INTO Job VALUES (9, 'Governator', 'One of the most desired jobs in the parliament', 8, 16, 2, 4);

-- Users

INSERT INTO Users VALUES (1, 'Mircea', 'Podani', 'mirceapodani@gmail.com', SYSDATE, 5000, 8);
INSERT INTO Users VALUES (2, 'Alex', 'Popa', 'mirceapodani@gmail.com', '10-07-2007', 5000, 8);
INSERT INTO Users VALUES (3, 'Ionut', 'Dumitru', 'ionutdumitru@gmail.com', '20-10-1970', 2450, 9);
INSERT INTO Users VALUES (4, 'Adrian', 'Murgoci', 'adrianmurgoci@gmail.com', '30-11-2010', 1850, 9);
INSERT INTO Users VALUES (5, 'Ioana', 'Gheorghe', 'ioanagheorghe@gmail.com', '05-01-2017', 5680, 1);
INSERT INTO Users VALUES (6, 'Ana', 'Tanase', 'anatanase@gmail.com', '15-04-2000', 5460, 1);
INSERT INTO Users VALUES (7, 'Bianca', 'Ursu', 'biancaursu@gmail.com', '20-09-2013', 4670, 6);
INSERT INTO Users VALUES (8, 'Eugen', 'Grigore', 'eugengrigore@gmail.com', '16-05-2011', 1210, 2);
INSERT INTO Users VALUES (9, 'Mihai', 'Pralea', 'mihaipralea@gmail.com', '10-08-2019', 1150, 2);
INSERT INTO Users VALUES (10, 'Gabriel', 'Turnu', 'gabrielturnu@gmail.com', '29-11-2021', 1760, 3);
INSERT INTO Users VALUES (11, 'Mihnea', 'Ionescu', 'mihneaionescu@gmail.com', '13-09-2022', 8950, 4);
INSERT INTO Users VALUES (12, 'Daria', 'Jugaru', 'dariajugaru@gmail.com', '01-04-2020', 5760, 4);
INSERT INTO Users VALUES (13, 'Cristian', 'Istrate', 'cristianistrate@gmail.com', '07-03-2004', 9590, 5);
INSERT INTO Users VALUES (14, 'Miruna', 'Adam', 'mirunaadam@gmail.com', '08-09-1994', 2650, 5);
INSERT INTO Users VALUES (15, 'Mihaela', 'Florea', 'mihaelaflorea@gmail.com', '06-12-2016', 2950, 6);
INSERT INTO Users VALUES (16, 'Ecaterina', 'Dragu', 'ecaterinadragu@gmail.com', '23-10-1999', 9870, 7);
INSERT INTO Users VALUES (17, 'Oana', 'Sava', 'oanasava@gmail.com', '21-02-2020', 4680, 7);
INSERT INTO Users VALUES (18, 'Andrei', 'Moldoveanu', 'andreimoldoveanu@gmail.com', '15-09-1997', 3690, 4);
INSERT INTO Users VALUES (19, 'Robert', 'Rusu', 'robertrusu@gmail.com', '10-10-2002', 7830, 3);
INSERT INTO Users VALUES (20, 'Maria', 'Velea', 'mariavelea@gmail.com', '20-05-2022', 6380, 3);

--Post

INSERT INTO POST VALUES (1, 'World Cup', 'The 2022 World Cup will be held in Qatar', '20-05-2022', 20);
INSERT INTO POST VALUES (2, 'Formula 1', 'The next race will take place in Maranello', '24-09-2022', 10);
INSERT INTO POST VALUES (3, 'Sports News', 'Messi won the world cup', '29-08-2022', 14);
INSERT INTO POST VALUES (4, 'Global Warming', 'We are more and more concerned about the rising temperatures', '29-07-2022', 8);
INSERT INTO POST VALUES (5, 'Endangered species', 'The white tiger is in great danger of becoming extinct', '27-10-2022', 18);
INSERT INTO POST VALUES (6, 'Rolland Garros', 'Simona Halep is expected to win the next tournament', '20-01-2022', 2);
INSERT INTO POST VALUES (7, 'Mountain Rally', 'The rally cars have been prepared 2 weeks ahead', '23-09-2022', 9);

--Comments

INSERT INTO COMMENTS VALUES (1, 'Messi is the GOAT', '30-10-2022', 3);
INSERT INTO COMMENTS VALUES (2, 'Hamilton is the GOAT', '31-11-2021', 2);
INSERT INTO COMMENTS VALUES (3, 'Help animals !', '03-12-2020', 4);
INSERT INTO COMMENTS VALUES (4, 'Halep is the GOAT', '06-08-2015', 6);
INSERT INTO COMMENTS VALUES (5, 'I love rally cars !', '17-04-2018', 7);
INSERT INTO COMMENTS VALUES (6, 'Such a great competition ahead', '19-04-2018', 7);

-- Grup

INSERT INTO GRUP VALUES (1, 'Pasionati de masini', 'Masini', '16-05-2011');
INSERT INTO GRUP VALUES (2, 'Fani Real Madrid', 'Fotbal', '19-05-2018');
INSERT INTO GRUP VALUES (3, 'Organizatori Evenimente', 'Petreceri', '19-09-2006');
INSERT INTO GRUP VALUES (4, 'Sneaker Community', 'Adidasi', '16-05-2010');
INSERT INTO GRUP VALUES (5, 'Cycling Community', 'Bicycles', '18-07-2016');

-- User_group

INSERT INTO USER_GROUP VALUES (1, 2);
INSERT INTO USER_GROUP VALUES (2, 3);
INSERT INTO USER_GROUP VALUES (4, 4);
INSERT INTO USER_GROUP VALUES (10, 1);
INSERT INTO USER_GROUP VALUES (11, 2);
INSERT INTO USER_GROUP VALUES (14, 3);
INSERT INTO USER_GROUP VALUES (8, 4);
INSERT INTO USER_GROUP VALUES (9, 3);
INSERT INTO USER_GROUP VALUES (5, 1);
INSERT INTO USER_GROUP VALUES (7, 2);
INSERT INTO USER_GROUP VALUES (13, 4);
INSERT INTO USER_GROUP VALUES (16, 1);
INSERT INTO USER_GROUP VALUES (17, 2);
INSERT INTO USER_GROUP VALUES (12, 4);
INSERT INTO USER_GROUP VALUES (3, 3);

--//////////////////////////////////////////////////////////////////////////

-- 6. Sa se retina intr-un record textul comentariului din '17-04-2018' al unei postari specificate prin id 
-- si sa se stocheze id urile tuturor comentariilor postarii precizate intr-un alt tip de colectie

/
create or replace procedure p_comentarii(cod_postare post.post_id % type)
    is
        TYPE comm_ids IS VARRAY(100) OF Number;
        TYPE comentariu is record (continut comments.text % type);
        v_com comentariu;
        v_comm_ids comm_ids;
    begin
        select text into v_com
        from comments where post_id = cod_postare and comment_date = '17-04-2018';
        
        DBMS_OUTPUT.PUT_LINE('Textul comentariului din 17-04-2018 este : ' || v_com.continut);
        
        select comment_id bulk collect into v_comm_ids
        from comments where post_id = cod_postare;
        
        DBMS_OUTPUT.PUT_LINE('');
        DBMS_OUTPUT.PUT_LINE('Afisarea id-urilor comentariilor de la postarea ' || cod_postare || ' :');
        
        FOR i IN v_comm_ids.FIRST..v_comm_ids.LAST LOOP
            DBMS_OUTPUT.PUT_LINE('Id-ul cu numarul ' || i || ' este : ' || v_comm_ids(i) );
        end loop;
        
end p_comentarii;
/
declare 

    v_cod_postare post.post_id % type := '&p_cod_postare';
    
begin
     
     p_comentarii(v_cod_postare);
     
    
end;
    
--//////////////////////////////////////////////////////////////////////////
  

-- 7. Obtineti pentru fiecare categorie numele acesteia si numarul de joburi folosind un cursor explicit. 
-- apoi, folositi un ciclu cursor pentru a afisa numele si numele jobului userilor angajati la joburi cu 
-- programul de lucru dat de la tastatura 


create or replace procedure p_categorie
    is
        v_count number(4);
        v_nume_categ  category.category_name % TYPE;
        CURSOR c1 IS 
        SELECT category_name, COUNT(job_id)  
        FROM  category c join job j on c.category_id = j.category_id GROUP BY category_name;
        
        v_first_name_user users.first_name % TYPE;
        v_last_name_user users.last_name % TYPE;
        v_nume_job  job.job_name % TYPE;
        
        v_work_start job.work_start % type := &p_work_start;
        v_work_end job.work_end % type := &p_work_end;
        
        CURSOR c2(v1 number, v2 number) IS 
        SELECT first_name f_name, last_name l_name, job_name j_name
        FROM  users u join job j on u.job_id = j.job_id where j.work_start = v1  and j.work_end = v2;
        
    begin
           
        OPEN c1;
        LOOP
            FETCH c1 INTO v_nume_categ, v_count;
            EXIT WHEN c1 % NOTFOUND;
            IF v_count = 0 THEN
                DBMS_OUTPUT.PUT_LINE('In categoria '|| v_nume_categ ||' nu sunt inscrise joburi');
            ELSIF v_count = 1 THEN
                DBMS_OUTPUT.PUT_LINE('In categoria '|| v_nume_categ ||' este inscris un job');
            ELSE
                DBMS_OUTPUT.PUT_LINE('In categoria '|| v_nume_categ ||' sunt inscrise '|| v_count ||' joburi');
            END IF;
        END LOOP;
        CLOSE c1;
        
        DBMS_OUTPUT.PUT_LINE(' ');
        DBMS_OUTPUT.PUT_LINE('Lista angajatilor cu joburi cu programul dorit');
       
        FOR i in c2(v_work_start, v_work_end) LOOP
            DBMS_OUTPUT.PUT_LINE('Angajatul ' || i.f_name || ' ' || i.l_name || ' lucreaza ca ' || i.j_name);   
        END LOOP;
    
end p_categorie;
/
DECLARE 
    
BEGIN
    
    p_categorie;
    
END;

--//////////////////////////////////////////////////////////////////////////


-- 8. Sa se se afiseze media salariilor userilor dintr-un grup cu subiect introdus de la tastatura
/
  
CREATE OR REPLACE FUNCTION f_medie_salarii(subiect VARCHAR2) RETURN NUMBER IS
    salariu users.salary % type;
    nume_grup grup.grup_name % type;
  BEGIN
  
    select grup_name into nume_grup from grup
    where upper(subject) = upper(subiect);
    
    SELECT avg(salary) into salariu from
    users u join user_group ug on u.user_id = ug.user_id
    join grup g on ug.grup_id = g.grup_id
    WHERE upper(subject) = upper(subiect);
    
    return salariu;
    
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
       DBMS_OUTPUT.PUT_LINE('Nu exista grup cu subiectul introdus !');
    WHEN TOO_MANY_ROWS THEN
       DBMS_OUTPUT.PUT_LINE('Exista mai multe grupuri cu subiectul introdus !');
    WHEN OTHERS THEN
       DBMS_OUTPUT.PUT_LINE('Alta eroare!');
       
END f_medie_salarii;  
/
DECLARE 
    v_subiect grup.subject % TYPE := '&p_subiect';
    
BEGIN
    DBMS_OUTPUT.PUT_LINE('Media salariilor userilor din grupul cu subiectul ' || v_subiect || ' este ' || f_medie_salarii(v_subiect));

END;


 --//////////////////////////////////////////////////////////////////////////
   
-- 9. Sa se afiseze numele, numele grupului, numele postarii si continutul comentariului
-- userilor dintr-un grup precizat prin nume

/   
CREATE OR REPLACE procedure proc(subiect VARCHAR2) 
  IS
    
    nume_grup2 grup.grup_name % type;
    
    prenume users.first_name % type;
    nume users.last_name % type;
    nume_grup grup.grup_name % type;
    nume_postare post.post_name %type;
    comm_text comments.text % type;
    
  BEGIN
  
    select grup_name into nume_grup2 from grup
    where upper(subject) = upper(subiect);
    
    SELECT
    first_name, last_name, grup_name, post_name, text  
    into prenume, nume, nume_grup, nume_postare, comm_text
    FROM grup g
    join user_group ug on g.grup_id = ug.grup_id
    join users u on ug.user_id = u.user_id
    join post p on u.user_id = p.user_id
    join comments c on c.post_id = p.post_id
    where upper(subject) = upper(subiect);
    
    DBMS_OUTPUT.PUT_LINE(prenume || ' ' || nume);
    DBMS_OUTPUT.PUT_LINE(nume_grup) ;
    DBMS_OUTPUT.PUT_LINE(nume_postare);
    DBMS_OUTPUT.PUT_LINE(comm_text);
    
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Nu exista un grup cu subiectul introdus / un user cu toate campurile cerute nenule');
        RAISE_APPLICATION_ERROR(-20003,'Nu exista un grup cu subiectul introdus / un user cu toate campurile cerute nenule');
      WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('Exista mai multe grupuri cu subiectul introdus / mai multi useri care indeplinesc conditiile');
        RAISE_APPLICATION_ERROR(-20001,'Exista mai multe grupuri cu subiectul introdus / mai multi useri care indeplinesc conditiile');
      WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Alta eroare!');
        RAISE_APPLICATION_ERROR(-20002,'Alta eroare!');   
       
END proc;  
/
DECLARE 
    v_subiect grup.subject % TYPE := '&p_subiect';
BEGIN
    proc(v_subiect);

END;

--//////////////////////////////////////////////////////////////////////////


-- 10. Definiti un trigger care va fi declansat afisand un mesaj corespunzator
-- in cazul in care se incearca inserarea, stergerea sau actualizarea tabelei category
-- dupa primele 5 zile ale lunii.


/
CREATE OR REPLACE TRIGGER trigger_category
 BEFORE INSERT OR DELETE OR UPDATE on category
BEGIN	
IF (TO_CHAR(SYSDATE,'DD') NOT BETWEEN 1 AND 5)
THEN
 IF INSERTING THEN
 DBMS_OUTPUT.PUT_LINE('Inserarea in tabel este permisa doar in primele 5 zile ale lunii !');
 RAISE_APPLICATION_ERROR(-20001,'Inserarea in tabel este permisa doar in primele 5 zile ale lunii !');
 ELSIF DELETING THEN
 DBMS_OUTPUT.PUT_LINE('Stergerea din tabel este permisa doar in primele 5 zile ale lunii !');
 RAISE_APPLICATION_ERROR(-20002,'Stergerea din tabel este permisa doar in primele 5 zile ale lunii !');
ELSE
 DBMS_OUTPUT.PUT_LINE('Actualizarile in tabel sunt permise doar in primele 5 zile ale lunii !');
 RAISE_APPLICATION_ERROR(-20003,'Actualizarile in tabel sunt permise doar in primele 5 zile ale lunii !');
 END IF;
END IF;
END;

INSERT INTO category  VALUES (6, 'Craftsmanship');
DELETE FROM category where category_name = 'Education';
update category set category_name = 'Scholarship' where category_name =  'Education';
/

--//////////////////////////////////////////////////////////////////////////

-- 11. Definiti un trigger care sa fie declansat atunci cand
-- se incearca modificarea subiectului unui grup

CREATE OR REPLACE TRIGGER trigger_grup
 BEFORE UPDATE OF subject ON grup
 FOR EACH ROW
 WHEN (NEW.subject <> OLD.subject)
BEGIN
 RAISE_APPLICATION_ERROR (-20000, 'Nu puteti modifica subiectul unui grup !');
END;
/
UPDATE grup
SET subject = 'Airplanes' where grup_name = 'F1 Drivers';
/

--//////////////////////////////////////////////////////////////////////////


-- 12. Sa se defineasca un trigger care sa stocheze datele despre o modificare
-- de tip LDD pe Schema bazei de date

CREATE TABLE schema_info
(
    ddl_data        DATE,
    ddl_user        VARCHAR2(30),
    tip_obiect    VARCHAR(30),
    nume_obiect     VARCHAR2(30),
    ddl_eveniment   VARCHAR2(30)
);

/
CREATE OR REPLACE TRIGGER trigger_schema
 AFTER CREATE OR DROP OR ALTER ON SCHEMA
BEGIN

  INSERT INTO schema_info VALUES 
  (SYSDATE , SYS.LOGIN_USER,  SYS.DICTIONARY_OBJ_TYPE,
  SYS.DICTIONARY_OBJ_NAME, SYS.SYSEVENT);
  
END;
/

CREATE TABLE tabel_test (tabel_test_id number(2));

ALTER TABLE tabel_test ADD (tabel_test_content varchar2(30)); 

INSERT INTO tabel_test VALUES (1, 'Tabel de Test');

/

select * from schema_info;

/

--//////////////////////////////////////////////////////////////////////////

--13. Definiti un pachet care sa contina toate obiectele definite în cadrul proiectului.

/

CREATE OR REPLACE PACKAGE pachet_proiect_SGBD as
    -- ex 6
    procedure p_comentarii(cod_postare post.post_id % type); 
    -- ex 7
    procedure p_categorie;
    -- ex 8
    FUNCTION f_medie_salarii(subiect VARCHAR2) RETURN NUMBER;
    -- ex 9
    procedure proc(subiect VARCHAR2);
    
end pachet_proiect_SGBD;
/

/
CREATE OR REPLACE PACKAGE BODY pachet_proiect_SGBD AS
 
   -- ex 6
   
   procedure p_comentarii(cod_postare post.post_id % type)
    is
        TYPE comm_ids IS VARRAY(100) OF Number;
        TYPE comentariu is record (continut comments.text % type);
        v_com comentariu;
        v_comm_ids comm_ids;
    begin
        select text into v_com
        from comments where post_id = cod_postare and comment_date = '17-04-2018';
        
        DBMS_OUTPUT.PUT_LINE('Textul comentariului din 17-04-2018 este : ' || v_com.continut);
        
        select comment_id bulk collect into v_comm_ids
        from comments where post_id = cod_postare;
        
        DBMS_OUTPUT.PUT_LINE('');
        DBMS_OUTPUT.PUT_LINE('Afisarea id-urilor comentariilor de la postarea ' || cod_postare || ' :');
        
        FOR i IN v_comm_ids.FIRST..v_comm_ids.LAST LOOP
            DBMS_OUTPUT.PUT_LINE('Id-ul cu numarul ' || i || ' este : ' || v_comm_ids(i) );
        end loop;
        
    end p_comentarii;
    
    -- ex 7
    
    procedure p_categorie
    is
        v_count number(4);
        v_nume_categ  category.category_name % TYPE;
        CURSOR c1 IS 
        SELECT category_name, COUNT(job_id)  
        FROM  category c join job j on c.category_id = j.category_id GROUP BY category_name;
        
        v_first_name_user users.first_name % TYPE;
        v_last_name_user users.last_name % TYPE;
        v_nume_job  job.job_name % TYPE;
        
        v_work_start job.work_start % type := &p_work_start;
        v_work_end job.work_end % type := &p_work_end;
        
        CURSOR c2(v1 number, v2 number) IS 
        SELECT first_name f_name, last_name l_name, job_name j_name
        FROM  users u join job j on u.job_id = j.job_id where j.work_start = v1  and j.work_end = v2;
        
    begin
           
        OPEN c1;
        LOOP
            FETCH c1 INTO v_nume_categ, v_count;
            EXIT WHEN c1 % NOTFOUND;
            IF v_count = 0 THEN
                DBMS_OUTPUT.PUT_LINE('In categoria '|| v_nume_categ ||' nu sunt inscrise joburi');
            ELSIF v_count = 1 THEN
                DBMS_OUTPUT.PUT_LINE('In categoria '|| v_nume_categ ||' este inscris un job');
            ELSE
                DBMS_OUTPUT.PUT_LINE('In categoria '|| v_nume_categ ||' sunt inscrise '|| v_count ||' joburi');
            END IF;
        END LOOP;
        CLOSE c1;
        
        DBMS_OUTPUT.PUT_LINE(' ');
        DBMS_OUTPUT.PUT_LINE('Lista angajatilor cu joburi cu programul dorit');
       
        FOR i in c2(v_work_start, v_work_end) LOOP
            DBMS_OUTPUT.PUT_LINE('Angajatul ' || i.f_name || ' ' || i.l_name || ' lucreaza ca ' || i.j_name);   
        END LOOP;
    
    end p_categorie;
    
    -- ex 8
    
    FUNCTION f_medie_salarii(subiect VARCHAR2) RETURN NUMBER IS
    salariu users.salary % type;
    nume_grup grup.grup_name % type;
    
    BEGIN
  
        select grup_name into nume_grup from grup
        where upper(subject) = upper(subiect);
        
        SELECT avg(salary) into salariu from
        users u join user_group ug on u.user_id = ug.user_id
        join grup g on ug.grup_id = g.grup_id
        WHERE upper(subject) = upper(subiect);
    
    return salariu;
    
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
           DBMS_OUTPUT.PUT_LINE('Nu exista grup cu subiectul introdus !');
        WHEN TOO_MANY_ROWS THEN
           DBMS_OUTPUT.PUT_LINE('Exista mai multe grupuri cu subiectul introdus !');
        WHEN OTHERS THEN
           DBMS_OUTPUT.PUT_LINE('Alta eroare!');
       
    END f_medie_salarii; 
    
    -- ex 9
    
    procedure proc(subiect VARCHAR2) 
    IS
    
    nume_grup2 grup.grup_name % type;
    
    prenume users.first_name % type;
    nume users.last_name % type;
    nume_grup grup.grup_name % type;
    nume_postare post.post_name %type;
    comm_text comments.text % type;
    
    BEGIN
  
    select grup_name into nume_grup2 from grup
    where upper(subject) = upper(subiect);
    
    SELECT
    first_name, last_name, grup_name, post_name, text  
    into prenume, nume, nume_grup, nume_postare, comm_text
    FROM grup g
    join user_group ug on g.grup_id = ug.grup_id
    join users u on ug.user_id = u.user_id
    join post p on u.user_id = p.user_id
    join comments c on c.post_id = p.post_id
    where upper(subject) = upper(subiect);
    
    DBMS_OUTPUT.PUT_LINE(prenume || ' ' || nume);
    DBMS_OUTPUT.PUT_LINE(nume_grup) ;
    DBMS_OUTPUT.PUT_LINE(nume_postare);
    DBMS_OUTPUT.PUT_LINE(comm_text);
    
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20003,'Nu exista un grup cu subiectul introdus / un user cu toate campurile cerute nenule');
      WHEN TOO_MANY_ROWS THEN
        RAISE_APPLICATION_ERROR(-20001,'Exista mai multe grupuri cu subiectul introdus');
      WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20002,'Alta eroare!');
       
    END proc;
    
end pachet_proiect_SGBD;
/  

--//////////////////////////////////////////////////////////////////////////

--14. Defini?i un pachet care sã includã tipuri de date complexe ?i obiecte necesare unui flux de ac?iuni
--integrate, specifice bazei de date definite (minim 2 tipuri de date, minim 2 func?ii, minim 2 proceduri).

/
CREATE OR REPLACE PACKAGE pachet_proiect as
    
    procedure p_1; 
    
    procedure p_2(cod_grup number);
    
    function f_grup(cod_grup number) RETURN VARCHAR2;
    
    function f_postare(cod_postare number) RETURN VARCHAR2;
    
    TYPE tablou_indexat IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
    
    TYPE inregistrare IS RECORD (salariu users.salary % type);
    
end pachet_proiect;

/
CREATE OR REPLACE PACKAGE BODY pachet_proiect AS

    --///////////////////////////////////////////////
    
    -- sa se afiseze numele unui grup introdus prin cod
    
    function f_grup(cod_grup number) RETURN VARCHAR2
    IS 
        nume_grup grup.grup_name % type;
    BEGIN
        select grup_name into nume_grup 
        from grup where grup_id = cod_grup;
        
    return nume_grup;
    
    END f_grup;
    
     --///////////////////////////////////////////////
     
    -- sa se afiseze numele unei postari introduse prin cod
    
    function f_postare(cod_postare number) RETURN VARCHAR2
    IS
        nume_postare post.post_name %type;
    BEGIN
        select post_name into nume_postare 
        from post where post_id = cod_postare;
        
    return nume_postare;
    
    END f_postare;
    
     --///////////////////////////////////////////////
     
     -- sa se adauge salariile angajatilor cu id impar si cu programul jobului de la 9 la 20
     -- intr-un tabel indexat si apoi sa se afiseze acestea
     
     procedure p_1 
     is
        t  tablou_indexat;
        indice number := 0;
        
       CURSOR c2 IS 
        SELECT user_id cod_user, salary salariu
        FROM  users u join job j on u.job_id = j.job_id where j.work_start = 9  and j.work_end = 20;
        
    begin
        
        for i in c2 loop
            if i.cod_user mod 2 = 1 then
            indice := indice + 1;
            t(indice) := i.salariu;
            end if;
        end loop;
        
        for i in t.first..t.last loop
         DBMS_OUTPUT.PUT_LINE('Salariul angajatului este ' || t(i));
        end loop;
    
    end p_1;
    
    --///////////////////////////////////////////////
    
    -- sa se retina intr-un record media salariilor userilor dintr-un grup introdus prin cod
    -- si sa se afiseze aceasta
    
    procedure p_2(cod_grup number)
     is
        rec inregistrare;
        salariu users.salary % type;
     
     begin
        select avg(salary) into rec.salariu 
        from users u join user_group ug on u.user_id = ug.user_id
        join grup g on ug.grup_id = g.grup_id
        WHERE g.grup_id = cod_grup;
        
        DBMS_OUTPUT.PUT_LINE('Media salariilor userilor din grupul ' || f_grup(cod_grup) || ' este ' || rec.salariu);
     
    end p_2;

END pachet_proiect;
/
begin
    
    pachet_proiect.p_1;
    DBMS_OUTPUT.PUT_LINE('');
    pachet_proiect.p_2(2);
    
end;
