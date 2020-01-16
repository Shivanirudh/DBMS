REM ******* 10)It is necessary to represent the gender of an artist in the table.
DESC ARTIST;

ALTER TABLE ARTIST
ADD GENDER VARCHAR2(6);

DESC ARTIST;

REM ****** 11)The first few words of the lyrics constitute the song name. 
REM ****** The song name do not accommodate some of the words (in lyrics).
DESC SONG;

ALTER TABLE SONG
MODIFY SONG_NAME VARCHAR2(50);

DESC SONG;

REM ****** 12)The phone number of each studio should be different.
DESC STUDIO;

ALTER TABLE STUDIO
ADD CONSTRAINT studio_uniq UNIQUE(STUDIO_PHONE);

DESC STUDIO;

REM ****** 13)An artist who sings a song for a particular track of an album can not be recorded without the record_date.
DESC SUNGBY;

ALTER TABLE SUNGBY
MODIFY RECORDING_DATE DATE CONSTRAINT sungby_null NOT NULL;

DESC SUNGBY;

REM ******14)It was decided to include the genre NAT for nature songs.
DESC SONG;

INSERT INTO SONG VALUES( 2,2,'BLUE',321,'NAT');

ALTER TABLE SONG
ADD CONSTRAINT genre_check CHECK(SONG_GENRE IN('REL','PHI','LOV','DEV','PAT','NAT'));

ALTER TABLE SONG
DROP CONSTRAINT check_song;

DESC SONG;
INSERT INTO SONG VALUES( 2,2,'BLUE',321,'NAT');

REM ****** 15)Due to typoerror,there may be a possibility of false information. Hence while deleting the song information, 
REM ****** make sure that all the corresponding information are also deleted. 
DESC SONG;

REM ****** Song Database
SELECT * FROM SONG;

REM ****** Sungby Database
SELECT * FROM SUNGBY;

DELETE FROM SONG
WHERE SONG_NAME='UNDECIDED';

ALTER TABLE SUNGBY
DROP CONSTRAINT sungby_fk;

ALTER TABLE SUNGBY
DROP CONSTRAINT sungby_fk1;

ALTER TABLE SUNGBY
ADD CONSTRAINT sungby_fk FOREIGN KEY(ALBUM_ID,TRACK_NO) REFERENCES SONG(ALBUM_ID,TRACK_NO)
ON DELETE CASCADE;

ALTER TABLE SUNGBY
ADD CONSTRAINT sungby_fk1 FOREIGN KEY(ARTIST_ID) REFERENCES ARTIST(ARTIST_ID)
ON DELETE CASCADE;

DESC SONG;

REM ****** Deleting song information
DELETE FROM SONG
WHERE SONG_NAME='UNDECIDED';

REM ****** Song Database
SELECT * FROM SONG;

REM ****** Sungby Database
SELECT * FROM SUNGBY;


