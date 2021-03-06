
DROP TABLE SUNGBY;
DROP TABLE ARTIST;
DROP TABLE SONG;
DROP TABLE ALBUM;
DROP TABLE STUDIO;
DROP TABLE MUSICIAN;

REM ****** Musician Database

CREATE TABLE MUSICIAN(
	MUSICIAN_ID NUMBER(5), 
	MUSICIAN_NAME VARCHAR2(20),
	BIRTHPLACE VARCHAR2(20),
	CONSTRAINT music_pk PRIMARY KEY (MUSICIAN_ID)
);

REM ****** Studio Database

CREATE TABLE STUDIO(
	STUDIO_NAME VARCHAR2(20) CONSTRAINT studio_pk PRIMARY KEY,
	STUDIO_ADDRESS VARCHAR2(20),
	STUDIO_PHONE NUMBER(10)
);

REM ****** Album Database 

CREATE TABLE ALBUM(
	ALBUM_ID NUMBER(5) CONSTRAINT album_pk PRIMARY KEY,
	ALBUM_NAME VARCHAR2(20),
	YEAR_RELEASE NUMBER(4) CONSTRAINT check_year CHECK(YEAR_RELEASE>1945),
	NO_TRACKS NUMBER(3) CONSTRAINT album_track_null NOT NULL,
	STUDIO VARCHAR2(20) CONSTRAINT album_studio_fk REFERENCES STUDIO(STUDIO_NAME),
	GENRE VARCHAR2(3) CONSTRAINT check_genre  CHECK(genre in ('CAR','DIV','MOV','POP')),
	MUSICIAN NUMBER(5) CONSTRAINT album_musician_fk REFERENCES MUSICIAN(MUSICIAN_ID)
);

REM ******* Song Database

CREATE TABLE SONG(
	TRACK_NO NUMBER(3),
	ALBUM_ID NUMBER(5) CONSTRAINT song_fk REFERENCES ALBUM(ALBUM_ID),
	SONG_NAME VARCHAR2(20),
	SONG_LENGTH NUMBER(3),
	SONG_GENRE VARCHAR2(3) CONSTRAINT check_song CHECK(SONG_GENRE IN('REL','PHI','LOV','DEV','PAT')), 
	CONSTRAINT song_pk PRIMARY KEY(ALBUM_ID,TRACK_NO),
	CONSTRAINT check_length CHECK(SONG_GENRE!='PAT' OR SONG_LENGTH>7) 
);

REM ****** Artist Database

CREATE TABLE ARTIST(
	ARTIST_ID NUMBER(5) CONSTRAINT artist_pk PRIMARY KEY,
	ARTIST_NAME VARCHAR2(20) 
);

REM ****** SungBy Database

CREATE TABLE SUNGBY(
	ALBUM_ID NUMBER(5),
	ARTIST_ID NUMBER(5),
	TRACK_NO NUMBER(3),
	RECORDING_DATE DATE,
	CONSTRAINT sungby_pk PRIMARY KEY(ALBUM_ID,ARTIST_ID,TRACK_NO),
	CONSTRAINT sungby_fk FOREIGN KEY(ALBUM_ID,TRACK_NO) REFERENCES SONG(ALBUM_ID,TRACK_NO),
	CONSTRAINT sungby_fk1 FOREIGN KEY(ARTIST_ID) REFERENCES ARTIST(ARTIST_ID)
);

REM ****** Populating Musician Database

INSERT INTO MUSICIAN VALUES( 1,'SPB','CHENNAI');
INSERT INTO MUSICIAN VALUES( 2,'MSV','MUMBAI');
INSERT INTO MUSICIAN VALUES( 3,'KJY','KERALA');


REM ****** Populating Studio Database

INSERT INTO STUDIO VALUES( 'A','CHENNAI',1234567890);
INSERT INTO STUDIO VALUES( 'B','MUMBAI', 9876543210);
INSERT INTO STUDIO VALUES( 'C','KERALA', 2345678910);

REM ****** Populating Album Database

INSERT INTO ALBUM VALUES( 1,'INDIGO',2019,30,'A','POP',2);
INSERT INTO ALBUM VALUES( 2,'BOMBAY',1996,8,'B','DIV',3);
INSERT INTO ALBUM VALUES( 3,'BIGIL',2017,3,'C','MOV',1);


REM ****** Populating Song Database

INSERT INTO SONG VALUES( 1,1,'UNDECIDED',123,'REL');
INSERT INTO SONG VALUES( 2,1,'RED',321,'LOV');
INSERT INTO SONG VALUES( 3,2,'ARABIAN SEA',23,'PAT');
INSERT INTO SONG VALUES( 3,2,'ARABIAN SEA',23,'PHI');
REM ****** Violating song length for 'PAT'
INSERT INTO SONG VALUES( 3,3,'BIGILEYYYY',5,'PAT');


REM ****** Populating Artist Database

INSERT INTO ARTIST VALUES( 1,'SHARVAN');
INSERT INTO ARTIST VALUES( 2,'SHASHU');
INSERT INTO ARTIST VALUES( 3,'SIDDHARTH');

REM ****** Populating Sungby Database

INSERT INTO SUNGBY VALUES( 1,2,1,'25-JUL-2019');
INSERT INTO SUNGBY VALUES( 1,2,2,'15-FEB-2018');
INSERT INTO SUNGBY VALUES( 2,1,3,'05-AUG-2017');
INSERT INTO SUNGBY VALUES( 2,3,3,'03-MAY-1996');

REM ****** Musician Database
SELECT * FROM MUSICIAN;

REM ****** Album Database
SELECT * FROM ALBUM;

REM ****** Song Database
SELECT * FROM SONG;

REM ****** Artist Database
SELECT * FROM ARTIST;

REM ****** Sungby Database
SELECT * FROM SUNGBY;

REM ****** Studio Database
SELECT * FROM STUDIO;