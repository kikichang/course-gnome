DROP TABLE IF EXISTS Instructor;
create table Instructor (
	InstructorID    INTEGER NOT NULL,
	FName			VARCHAR(30),
	LName			VARCHAR(30),
	Department      INTEGER,
	primary key(InstructorID)
);

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS CourseInfo;
SET FOREIGN_KEY_CHECKS=1;
CREATE TABLE CourseInfo (
	CID			VARCHAR(10) NOT NULL,
	YEAR		INTEGER NOT NULL,
	Semester	VARCHAR(10) NOT NULL,
	InstructorID INTEGER,
	Enrollment   INTEGER,
	Section      INTEGER NOT NULL,
  PRIMARY KEY(CID, YEAR, Semester, Section),
  foreign key(InstructorID) references Instructor(InstructorID)
);

SET FOREIGN_KEY_CHECKS=0;
drop table if exists CourseDetail;
SET FOREIGN_KEY_CHECKS=1;
create table CourseDetail (
    CID   	    VARCHAR(10) NOT NULL,
    CName		VARCHAR(100),
    School		VARCHAR(2),
    Department	INTEGER,
    CNumber		INTEGER,
    foreign key (CID) references CourseInfo(CID)
);


SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS AggregateInfo;
SET FOREIGN_KEY_CHECKS=1;
create table AggregateInfo (
	CID			VARCHAR(10) NOT NULL,
	YEAR		INTEGER NOT NULL,
	Semester	VARCHAR(10) NOT NULL,
    Section		INTEGER NOT NULL,
    ReturnRate  DECIMAL(5,2),
	Mean		DECIMAL(5,2),
	STD			DECIMAL(5,2),
	Median		DECIMAL(5,2),
	Type		VARCHAR(40),
    foreign key(CID, YEAR, Semester, Section) references CourseInfo(CID, YEAR, Semester, Section)
);

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS Quality;
SET FOREIGN_KEY_CHECKS=1;
create table Quality (
	CID				VARCHAR(10) NOT NULL,
	YEAR			INTEGER NOT NULL,
	Semester		VARCHAR(10) NOT NULL,
    Section			INTEGER NOT NULL,
	Poor			DECIMAL(5,2),
	Weak			DECIMAL(5,2),
	Satisfactory	DECIMAL(5,2),
	Good  			DECIMAL(5,2),
	Excellent  		DECIMAL(5,2),
	NA				DECIMAL(5,2),
	foreign key(CID, YEAR, Semester, Section) references CourseInfo(CID, YEAR, Semester, Section)
);

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS TeachingEffectiveness;
SET FOREIGN_KEY_CHECKS=1;
create table TeachingEffectiveness (
	CID				VARCHAR(10) NOT NULL,
	YEAR			INTEGER NOT NULL,
	Semester		VARCHAR(10) NOT NULL,
    Section			INTEGER NOT NULL,
	Poor			DECIMAL(5,2),
	Weak			DECIMAL(5,2),
	Satisfactory	DECIMAL(5,2),
	Good  			DECIMAL(5,2),
	Excellent  		DECIMAL(5,2),
	NA				DECIMAL(5,2),
	foreign key(CID, YEAR, Semester, Section) references CourseInfo(CID, YEAR, Semester, Section)
);

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS IntChallenge;
SET FOREIGN_KEY_CHECKS=1;
create table IntChallenge (
	CID				VARCHAR(10) NOT NULL,
	YEAR			INTEGER NOT NULL,
	Semester		VARCHAR(10) NOT NULL,
    Section			INTEGER NOT NULL,
	Poor			DECIMAL(5,2),
	Weak			DECIMAL(5,2),
	Satisfactory	DECIMAL(5,2),
	Good  			DECIMAL(5,2),
	Excellent  		DECIMAL(5,2),
	NA				DECIMAL(5,2),
	foreign key(CID, YEAR, Semester, Section) references CourseInfo(CID, YEAR, Semester, Section)
);

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS WorkFeedback;
SET FOREIGN_KEY_CHECKS=1;
create table WorkFeedback (
    CID             VARCHAR(10) NOT NULL,
    YEAR            INTEGER NOT NULL,
    Semester        VARCHAR(10) NOT NULL,
    Section			INTEGER NOT NULL,
    Dstrongly       INTEGER,
    Dsomewhat       INTEGER,
    Neutral         INTEGER,
    Asomewhat       INTEGER,
    Astrongly       INTEGER,
    NA              INTEGER,
	foreign key(CID, YEAR, Semester, Section) references CourseInfo(CID, YEAR, Semester, Section)
);

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS Workload;
SET FOREIGN_KEY_CHECKS=1;
create table Workload (
    CID             VARCHAR(10) NOT NULL,
    YEAR            INTEGER NOT NULL,
    Semester        VARCHAR(10) NOT NULL,
    Section			INTEGER NOT NULL,
    Lighter         INTEGER,
    Light           INTEGER,
    Typical         INTEGER,
    Heavy           INTEGER,
    Heavier         INTEGER,
    NA              INTEGER,
	foreign key(CID, YEAR, Semester, Section) references CourseInfo(CID, YEAR, Semester, Section)
);