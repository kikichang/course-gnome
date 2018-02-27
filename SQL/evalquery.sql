#master list (no parameter select)
#CALL master();
delimiter //
DROP PROCEDURE IF EXISTS master //
CREATE PROCEDURE master()
    BEGIN
        SELECT DISTINCT c.CID, cd.CName as Title, c.YEAR, c.Semester, Concat(i.FName, " ", i.LName) as InstructorName, ROUND(Avg(q.mean),2) as QualityMean, ROUND(Avg(te.mean),2) as TeachingEffectivessMean, ROUND(Avg(ic.mean),2) as IntlChallenegeMean, ROUND(Avg(wl.mean),2) as WorkloadMean, ROUND(Avg(wf.mean),2) as FeedbackMean FROM CourseInfo c , Instructor i, CourseDetail cd, AggregateInfo q, AggregateInfo te, AggregateInfo ic, AggregateInfo wf, AggregateInfo wl
        WHERE c.InstructorID = i.InstructorID AND cd.CID = c.CID
        AND q.Type = 'Quality' AND c.CID = q.CID AND c.Year = q.Year AND c.Semester = q.Semester AND c.Section = q.Section
        AND te.Type = 'TeachingEffectiveness' AND c.CID = te.CID AND c.Year = te.Year AND c.Semester = te.Semester AND c.Section = te.Section
        AND ic.Type = 'IntlChallenge' AND c.CID = ic.CID AND c.Year = ic.Year AND c.Semester = ic.Semester AND c.Section = ic.Section
        AND wl.Type = 'Workload' AND c.CID = wl.CID AND c.Year = wl.Year AND c.Semester = wl.Semester AND c.Section = wl.Section
        AND wf.Type = 'Feedback' AND c.CID = wf.CID AND c.Year = wf.Year AND c.Semester = wf.Semester AND c.Section = wf.Section
        GROUP BY c.CID, c.YEAR, c.Semester, cd.CName, InstructorName;
    END//
delimiter ;


#SYFC [section integrated]
#CALL SYFC("EN", 2012, "%Yair%", "%Intermediate%");
delimiter //
DROP PROCEDURE IF EXISTS SYFC //
CREATE PROCEDURE SYFC(IN scl VARCHAR(2), yr INTEGER, search VARCHAR(60), courseID VARCHAR(100))
    BEGIN
        SELECT DISTINCT c.CID, cd.CName as Title, c.YEAR, c.Semester, Concat(i.FName, " ", i.LName) as InstructorName, ROUND(Avg(q.mean),2) as QualityMean, ROUND(Avg(te.mean),2) as TeachingEffectivessMean, ROUND(Avg(ic.mean),2) as IntlChallenegeMean, ROUND(Avg(wl.mean),2) as WorkloadMean, ROUND(Avg(wf.mean),2) as FeedbackMean FROM CourseInfo c , Instructor i, CourseDetail cd, AggregateInfo q, AggregateInfo te, AggregateInfo ic, AggregateInfo wf, AggregateInfo wl
        WHERE c.InstructorID = i.InstructorID AND c.YEAR = yr AND cd.CID = c.CID  AND Concat(i.FName, " ", i.LName) LIKE search AND cd.CName LIKE courseID AND scl = cd.School
        AND q.Type = 'Quality' AND c.CID = q.CID AND c.Year = q.Year AND c.Semester = q.Semester AND c.Section = q.Section
        AND te.Type = 'TeachingEffectiveness' AND c.CID = te.CID AND c.Year = te.Year AND c.Semester = te.Semester AND c.Section = te.Section
        AND ic.Type = 'IntlChallenge' AND c.CID = ic.CID AND c.Year = ic.Year AND c.Semester = ic.Semester AND c.Section = ic.Section
        AND wl.Type = 'Workload' AND c.CID = wl.CID AND c.Year = wl.Year AND c.Semester = wl.Semester AND c.Section = wl.Section
        AND wf.Type = 'Feedback' AND c.CID = wf.CID AND c.Year = wf.Year AND c.Semester = wf.Semester AND c.Section = wf.Section
        GROUP BY c.CID, c.YEAR, c.Semester, cd.CName, InstructorName;
    END//
delimiter ;

#SFC [section integrated]
#CALL SFC("EN", "%Yair%", "%Intermediate%");
delimiter //
DROP PROCEDURE IF EXISTS SFC //
CREATE PROCEDURE SFC(IN scl VARCHAR(2), search VARCHAR(60), courseID VARCHAR(100))
    BEGIN
        SELECT DISTINCT c.CID, cd.CName as Title, c.YEAR, c.Semester, Concat(i.FName, " ", i.LName) as InstructorName, ROUND(Avg(q.mean),2) as QualityMean, ROUND(Avg(te.mean),2) as TeachingEffectivessMean, ROUND(Avg(ic.mean),2) as IntlChallenegeMean, ROUND(Avg(wl.mean),2) as WorkloadMean, ROUND(Avg(wf.mean),2) as FeedbackMean FROM CourseInfo c , Instructor i, CourseDetail cd, AggregateInfo q, AggregateInfo te, AggregateInfo ic, AggregateInfo wf, AggregateInfo wl
        WHERE c.InstructorID = i.InstructorID AND cd.CID = c.CID  AND Concat(i.FName, " ", i.LName) LIKE search AND cd.CName LIKE courseID AND scl = cd.School
        AND q.Type = 'Quality' AND c.CID = q.CID AND c.Year = q.Year AND c.Semester = q.Semester AND c.Section = q.Section
        AND te.Type = 'TeachingEffectiveness' AND c.CID = te.CID AND c.Year = te.Year AND c.Semester = te.Semester AND c.Section = te.Section
        AND ic.Type = 'IntlChallenge' AND c.CID = ic.CID AND c.Year = ic.Year AND c.Semester = ic.Semester AND c.Section = ic.Section
        AND wl.Type = 'Workload' AND c.CID = wl.CID AND c.Year = wl.Year AND c.Semester = wl.Semester AND c.Section = wl.Section
        AND wf.Type = 'Feedback' AND c.CID = wf.CID AND c.Year = wf.Year AND c.Semester = wf.Semester AND c.Section = wf.Section
        GROUP BY c.CID, c.YEAR, c.Semester, cd.CName, InstructorName;
    END//
delimiter ;

#YFC [section integrated]
#CALL YFC(2012, "%Yair%", "%Intermediate%");
delimiter //
DROP PROCEDURE IF EXISTS YFC //
CREATE PROCEDURE YFC(IN yr INTEGER, search VARCHAR(60), courseID VARCHAR(100))
    BEGIN
        SELECT DISTINCT c.CID, cd.CName as Title, c.YEAR, c.Semester, Concat(i.FName, " ", i.LName) as InstructorName, ROUND(Avg(q.mean),2) as QualityMean, ROUND(Avg(te.mean),2) as TeachingEffectivessMean, ROUND(Avg(ic.mean),2) as IntlChallenegeMean, ROUND(Avg(wl.mean),2) as WorkloadMean, ROUND(Avg(wf.mean),2) as FeedbackMean FROM CourseInfo c , Instructor i, CourseDetail cd, AggregateInfo q, AggregateInfo te, AggregateInfo ic, AggregateInfo wf, AggregateInfo wl
        WHERE c.InstructorID = i.InstructorID AND c.YEAR = yr AND cd.CID = c.CID  AND Concat(i.FName, " ", i.LName) LIKE search AND cd.CName LIKE courseID
        AND q.Type = 'Quality' AND c.CID = q.CID AND c.Year = q.Year AND c.Semester = q.Semester AND c.Section = q.Section
        AND te.Type = 'TeachingEffectiveness' AND c.CID = te.CID AND c.Year = te.Year AND c.Semester = te.Semester AND c.Section = te.Section
        AND ic.Type = 'IntlChallenge' AND c.CID = ic.CID AND c.Year = ic.Year AND c.Semester = ic.Semester AND c.Section = ic.Section
        AND wl.Type = 'Workload' AND c.CID = wl.CID AND c.Year = wl.Year AND c.Semester = wl.Semester AND c.Section = wl.Section
        AND wf.Type = 'Feedback' AND c.CID = wf.CID AND c.Year = wf.Year AND c.Semester = wf.Semester AND c.Section = wf.Section
        GROUP BY c.CID, c.YEAR, c.Semester, cd.CName, InstructorName;
    END//
delimiter ;

#SYF [section integrated]
#CALL SYF("EN", 2012, "%Yair%");
delimiter //
DROP PROCEDURE IF EXISTS SYF //
CREATE PROCEDURE SYF(IN scl VARCHAR(2), yr INTEGER, search VARCHAR(60))
    BEGIN
        SELECT DISTINCT c.CID, cd.CName as Title, c.YEAR, c.Semester, Concat(i.FName, " ", i.LName) as InstructorName, ROUND(Avg(q.mean),2) as QualityMean, ROUND(Avg(te.mean),2) as TeachingEffectivessMean, ROUND(Avg(ic.mean),2) as IntlChallenegeMean, ROUND(Avg(wl.mean),2) as WorkloadMean, ROUND(Avg(wf.mean),2) as FeedbackMean FROM CourseInfo c , Instructor i, CourseDetail cd, AggregateInfo q, AggregateInfo te, AggregateInfo ic, AggregateInfo wf, AggregateInfo wl
        WHERE c.InstructorID = i.InstructorID AND c.YEAR = yr AND cd.CID = c.CID  AND Concat(i.FName, " ", i.LName) LIKE search AND cd.School = scl
        AND q.Type = 'Quality' AND c.CID = q.CID AND c.Year = q.Year AND c.Semester = q.Semester AND c.Section = q.Section
        AND te.Type = 'TeachingEffectiveness' AND c.CID = te.CID AND c.Year = te.Year AND c.Semester = te.Semester AND c.Section = te.Section
        AND ic.Type = 'IntlChallenge' AND c.CID = ic.CID AND c.Year = ic.Year AND c.Semester = ic.Semester AND c.Section = ic.Section
        AND wl.Type = 'Workload' AND c.CID = wl.CID AND c.Year = wl.Year AND c.Semester = wl.Semester AND c.Section = wl.Section
        AND wf.Type = 'Feedback' AND c.CID = wf.CID AND c.Year = wf.Year AND c.Semester = wf.Semester AND c.Section = wf.Section
        GROUP BY c.CID, c.YEAR, c.Semester, cd.CName, InstructorName;
    END//
delimiter ;


#SYC [section integrated]
#CALL SYC("EN", 2012, "%Intermediate%");
delimiter //
DROP PROCEDURE IF EXISTS SYC //
CREATE PROCEDURE SYC(IN scl VARCHAR(2), yr INTEGER, courseID VARCHAR(100))
    BEGIN
        SELECT DISTINCT c.CID, cd.CName as Title, c.YEAR, c.Semester, Concat(i.FName, " ", i.LName) as InstructorName, ROUND(Avg(q.mean),2) as QualityMean, ROUND(Avg(te.mean),2) as TeachingEffectivessMean, ROUND(Avg(ic.mean),2) as IntlChallenegeMean, ROUND(Avg(wl.mean),2) as WorkloadMean, ROUND(Avg(wf.mean),2) as FeedbackMean FROM CourseInfo c , Instructor i, CourseDetail cd, AggregateInfo q, AggregateInfo te, AggregateInfo ic, AggregateInfo wf, AggregateInfo wl
        WHERE c.InstructorID = i.InstructorID AND c.YEAR = yr AND cd.CID = c.CID  AND cd.CName LIKE courseID AND cd.School = scl
        AND q.Type = 'Quality' AND c.CID = q.CID AND c.Year = q.Year AND c.Semester = q.Semester AND c.Section = q.Section
        AND te.Type = 'TeachingEffectiveness' AND c.CID = te.CID AND c.Year = te.Year AND c.Semester = te.Semester AND c.Section = te.Section
        AND ic.Type = 'IntlChallenge' AND c.CID = ic.CID AND c.Year = ic.Year AND c.Semester = ic.Semester AND c.Section = ic.Section
        AND wl.Type = 'Workload' AND c.CID = wl.CID AND c.Year = wl.Year AND c.Semester = wl.Semester AND c.Section = wl.Section
        AND wf.Type = 'Feedback' AND c.CID = wf.CID AND c.Year = wf.Year AND c.Semester = wf.Semester AND c.Section = wf.Section
        GROUP BY c.CID, c.YEAR, c.Semester, cd.CName, InstructorName;
    END//
delimiter ;



#FC [section integrated]
#CALL FC("%Yair%", "%Intermediate%");
delimiter //
DROP PROCEDURE IF EXISTS FC //
CREATE PROCEDURE FC(IN search VARCHAR(60), courseID VARCHAR(100))
    BEGIN
        SELECT DISTINCT c.CID, cd.CName as Title, c.YEAR, c.Semester, Concat(i.FName, " ", i.LName) as InstructorName, ROUND(Avg(q.mean),2) as QualityMean, ROUND(Avg(te.mean),2) as TeachingEffectivessMean, ROUND(Avg(ic.mean),2) as IntlChallenegeMean, ROUND(Avg(wl.mean),2) as WorkloadMean, ROUND(Avg(wf.mean),2) as FeedbackMean FROM CourseInfo c , Instructor i, CourseDetail cd, AggregateInfo q, AggregateInfo te, AggregateInfo ic, AggregateInfo wf, AggregateInfo wl
        WHERE c.InstructorID = i.InstructorID AND cd.CID = c.CID  AND cd.CName LIKE courseID AND Concat(i.FName, " ", i.LName) LIKE search
        AND q.Type = 'Quality' AND c.CID = q.CID AND c.Year = q.Year AND c.Semester = q.Semester AND c.Section = q.Section
        AND te.Type = 'TeachingEffectiveness' AND c.CID = te.CID AND c.Year = te.Year AND c.Semester = te.Semester AND c.Section = te.Section
        AND ic.Type = 'IntlChallenge' AND c.CID = ic.CID AND c.Year = ic.Year AND c.Semester = ic.Semester AND c.Section = ic.Section
        AND wl.Type = 'Workload' AND c.CID = wl.CID AND c.Year = wl.Year AND c.Semester = wl.Semester AND c.Section = wl.Section
        AND wf.Type = 'Feedback' AND c.CID = wf.CID AND c.Year = wf.Year AND c.Semester = wf.Semester AND c.Section = wf.Section
        GROUP BY c.CID, c.YEAR, c.Semester, cd.CName, InstructorName;
    END//
delimiter ;

#YC [section integrated]
#CALL YC(2012, "%Intermediate%");
delimiter //
DROP PROCEDURE IF EXISTS YC //
CREATE PROCEDURE YC(IN yr INTEGER, courseID VARCHAR(100))
    BEGIN
        SELECT DISTINCT c.CID, cd.CName as Title, c.YEAR, c.Semester, Concat(i.FName, " ", i.LName) as InstructorName, ROUND(Avg(q.mean),2) as QualityMean, ROUND(Avg(te.mean),2) as TeachingEffectivessMean, ROUND(Avg(ic.mean),2) as IntlChallenegeMean, ROUND(Avg(wl.mean),2) as WorkloadMean, ROUND(Avg(wf.mean),2) as FeedbackMean FROM CourseInfo c , Instructor i, CourseDetail cd, AggregateInfo q, AggregateInfo te, AggregateInfo ic, AggregateInfo wf, AggregateInfo wl
        WHERE c.InstructorID = i.InstructorID AND c.YEAR = yr AND cd.CID = c.CID  AND cd.CName LIKE courseID
        AND q.Type = 'Quality' AND c.CID = q.CID AND c.Year = q.Year AND c.Semester = q.Semester AND c.Section = q.Section
        AND te.Type = 'TeachingEffectiveness' AND c.CID = te.CID AND c.Year = te.Year AND c.Semester = te.Semester AND c.Section = te.Section
        AND ic.Type = 'IntlChallenge' AND c.CID = ic.CID AND c.Year = ic.Year AND c.Semester = ic.Semester AND c.Section = ic.Section
        AND wl.Type = 'Workload' AND c.CID = wl.CID AND c.Year = wl.Year AND c.Semester = wl.Semester AND c.Section = wl.Section
        AND wf.Type = 'Feedback' AND c.CID = wf.CID AND c.Year = wf.Year AND c.Semester = wf.Semester AND c.Section = wf.Section
        GROUP BY c.CID, c.YEAR, c.Semester, cd.CName, InstructorName;
    END//
delimiter ;

#YF [section integrated]
#CALL YF(2012, "%Yair%");
delimiter //
DROP PROCEDURE IF EXISTS YF //
CREATE PROCEDURE YF(IN yr INTEGER, search VARCHAR(60))
    BEGIN
        SELECT DISTINCT c.CID, cd.CName as Title, c.YEAR, c.Semester, Concat(i.FName, " ", i.LName) as InstructorName, ROUND(Avg(q.mean),2) as QualityMean, ROUND(Avg(te.mean),2) as TeachingEffectivessMean, ROUND(Avg(ic.mean),2) as IntlChallenegeMean, ROUND(Avg(wl.mean),2) as WorkloadMean, ROUND(Avg(wf.mean),2) as FeedbackMean FROM CourseInfo c , Instructor i, CourseDetail cd, AggregateInfo q, AggregateInfo te, AggregateInfo ic, AggregateInfo wf, AggregateInfo wl
        WHERE c.InstructorID = i.InstructorID AND c.YEAR = yr AND cd.CID = c.CID  AND Concat(i.FName, " ", i.LName) LIKE search
        AND q.Type = 'Quality' AND c.CID = q.CID AND c.Year = q.Year AND c.Semester = q.Semester AND c.Section = q.Section
        AND te.Type = 'TeachingEffectiveness' AND c.CID = te.CID AND c.Year = te.Year AND c.Semester = te.Semester AND c.Section = te.Section
        AND ic.Type = 'IntlChallenge' AND c.CID = ic.CID AND c.Year = ic.Year AND c.Semester = ic.Semester AND c.Section = ic.Section
        AND wl.Type = 'Workload' AND c.CID = wl.CID AND c.Year = wl.Year AND c.Semester = wl.Semester AND c.Section = wl.Section
        AND wf.Type = 'Feedback' AND c.CID = wf.CID AND c.Year = wf.Year AND c.Semester = wf.Semester AND c.Section = wf.Section
        GROUP BY c.CID, c.YEAR, c.Semester, cd.CName, InstructorName;
    END//
delimiter ;

#SY [section integrated]
#CALL SY("EN", 2012);
delimiter //
DROP PROCEDURE IF EXISTS SY //
CREATE PROCEDURE SY(IN scl VARCHAR(2), yr INTEGER)
    BEGIN
        SELECT DISTINCT c.CID, cd.CName as Title, c.YEAR, c.Semester, Concat(i.FName, " ", i.LName) as InstructorName, ROUND(Avg(q.mean), 2) as QualityMean, ROUND(Avg(te.mean), 2) as TeachingEffectivessMean, ROUND(Avg(ic.mean),2) as IntlChallenegeMean, ROUND(Avg(wl.mean),2) as WorkloadMean, ROUND(Avg(wf.mean),2) as FeedbackMean FROM CourseInfo c , Instructor i, CourseDetail cd, AggregateInfo q, AggregateInfo te, AggregateInfo ic, AggregateInfo wf, AggregateInfo wl
        WHERE c.InstructorID = i.InstructorID AND cd.School = scl AND cd.CID = c.CID  AND c.year = yr
        AND q.Type = 'Quality' AND c.CID = q.CID AND c.Year = q.Year AND c.Semester = q.Semester AND c.Section = q.Section
        AND te.Type = 'TeachingEffectiveness' AND c.CID = te.CID AND c.Year = te.Year AND c.Semester = te.Semester AND c.Section = te.Section
        AND ic.Type = 'IntlChallenge' AND c.CID = ic.CID AND c.Year = ic.Year AND c.Semester = ic.Semester AND c.Section = ic.Section
        AND wl.Type = 'Workload' AND c.CID = wl.CID AND c.Year = wl.Year AND c.Semester = wl.Semester AND c.Section = wl.Section
        AND wf.Type = 'Feedback' AND c.CID = wf.CID AND c.Year = wf.Year AND c.Semester = wf.Semester AND c.Section = wf.Section
        GROUP BY c.CID, c.YEAR, c.Semester, cd.CName, InstructorName;
    END//
delimiter ;


#SF [section integrated]
#CALL SF("EN", "%Yair%");
delimiter //
DROP PROCEDURE IF EXISTS SF //
CREATE PROCEDURE SF(IN scl VARCHAR(2), search VARCHAR(60))
    BEGIN
        SELECT DISTINCT c.CID, cd.CName as Title, c.YEAR, c.Semester, Concat(i.FName, " ", i.LName) as InstructorName, ROUND(Avg(q.mean),2) as QualityMean, ROUND(Avg(te.mean),2) as TeachingEffectivessMean, ROUND(Avg(ic.mean),2) as IntlChallenegeMean, ROUND(Avg(wl.mean),2) as WorkloadMean, ROUND(Avg(wf.mean),2) as FeedbackMean FROM CourseInfo c , Instructor i, CourseDetail cd, AggregateInfo q, AggregateInfo te, AggregateInfo ic, AggregateInfo wf, AggregateInfo wl
        WHERE c.InstructorID = i.InstructorID AND cd.School = scl AND cd.CID = c.CID  AND Concat(i.FName, " ", i.LName) LIKE search
        AND q.Type = 'Quality' AND c.CID = q.CID AND c.Year = q.Year AND c.Semester = q.Semester AND c.Section = q.Section
        AND te.Type = 'TeachingEffectiveness' AND c.CID = te.CID AND c.Year = te.Year AND c.Semester = te.Semester AND c.Section = te.Section
        AND ic.Type = 'IntlChallenge' AND c.CID = ic.CID AND c.Year = ic.Year AND c.Semester = ic.Semester AND c.Section = ic.Section
        AND wl.Type = 'Workload' AND c.CID = wl.CID AND c.Year = wl.Year AND c.Semester = wl.Semester AND c.Section = wl.Section
        AND wf.Type = 'Feedback' AND c.CID = wf.CID AND c.Year = wf.Year AND c.Semester = wf.Semester AND c.Section = wf.Section
        GROUP BY c.CID, c.YEAR, c.Semester, cd.CName, InstructorName;
    END//
delimiter ;

#SC [section integrated]
#CALL SC("EN", "%Intermediate%");
delimiter //
DROP PROCEDURE IF EXISTS SC //
CREATE PROCEDURE SC(IN scl VARCHAR(2), courseID VARCHAR(100))
    BEGIN
        SELECT DISTINCT c.CID, cd.CName as Title, c.YEAR, c.Semester, Concat(i.FName, " ", i.LName) as InstructorName, ROUND(Avg(q.mean),2) as QualityMean, ROUND(Avg(te.mean),2) as TeachingEffectivessMean, ROUND(Avg(ic.mean),2) as IntlChallenegeMean, ROUND(Avg(wl.mean),2) as WorkloadMean, ROUND(Avg(wf.mean),2) as FeedbackMean FROM CourseInfo c , Instructor i, CourseDetail cd, AggregateInfo q, AggregateInfo te, AggregateInfo ic, AggregateInfo wf, AggregateInfo wl
        WHERE c.InstructorID = i.InstructorID AND cd.School = scl AND cd.CID = c.CID  AND cd.CName LIKE courseID
        AND q.Type = 'Quality' AND c.CID = q.CID AND c.Year = q.Year AND c.Semester = q.Semester AND c.Section = q.Section
        AND te.Type = 'TeachingEffectiveness' AND c.CID = te.CID AND c.Year = te.Year AND c.Semester = te.Semester AND c.Section = te.Section
        AND ic.Type = 'IntlChallenge' AND c.CID = ic.CID AND c.Year = ic.Year AND c.Semester = ic.Semester AND c.Section = ic.Section
        AND wl.Type = 'Workload' AND c.CID = wl.CID AND c.Year = wl.Year AND c.Semester = wl.Semester AND c.Section = wl.Section
        AND wf.Type = 'Feedback' AND c.CID = wf.CID AND c.Year = wf.Year AND c.Semester = wf.Semester AND c.Section = wf.Section
        GROUP BY c.CID, c.YEAR, c.Semester, cd.CName, InstructorName;
    END//
delimiter ;

#select by school (EN/AS) [section integrated]
delimiter //
DROP PROCEDURE IF EXISTS ShowInfoBySchool //
CREATE PROCEDURE ShowInfoBySchool(IN scl VARCHAR(2))
    BEGIN
        SELECT DISTINCT c.CID, cd.CName as Title, c.YEAR, c.Semester, Concat(i.FName, " ", i.LName) as InstructorName, ROUND(Avg(q.mean),2) as QualityMean, ROUND(Avg(te.mean),2) as TeachingEffectivessMean, ROUND(Avg(ic.mean),2) as IntlChallenegeMean, ROUND(Avg(wl.mean),2) as WorkloadMean, ROUND(Avg(wf.mean),2) as FeedbackMean FROM CourseInfo c , Instructor i, AggregateInfo q, CourseDetail cd, AggregateInfo te, AggregateInfo ic, AggregateInfo wf, AggregateInfo wl
        WHERE c.InstructorID = i.InstructorID AND cd.School = scl AND cd.CID = c.CID
        AND q.Type = 'Quality' AND c.CID = q.CID AND c.Year = q.Year AND c.Semester = q.Semester AND c.Section = q.Section
        AND te.Type = 'TeachingEffectiveness' AND c.CID = te.CID AND c.Year = te.Year AND c.Semester = te.Semester AND c.Section = te.Section
        AND ic.Type = 'IntlChallenge' AND c.CID = ic.CID AND c.Year = ic.Year AND c.Semester = ic.Semester AND c.Section = ic.Section
        AND wl.Type = 'Workload' AND c.CID = wl.CID AND c.Year = wl.Year AND c.Semester = wl.Semester AND c.Section = wl.Section
        AND wf.Type = 'Feedback' AND c.CID = wf.CID AND c.Year = wf.Year AND c.Semester = wf.Semester AND c.Section = wf.Section
        GROUP BY c.CID, c.YEAR, c.Semester, cd.CName, InstructorName;
    END//
delimiter ;

#select by year [section integrated]
delimiter //
DROP PROCEDURE IF EXISTS ShowInfoByYear //
CREATE PROCEDURE ShowInfoByYear(IN yr INTEGER)
    BEGIN
        SELECT DISTINCT c.CID, cd.CName as Title, c.YEAR, c.Semester, Concat(i.FName, " ", i.LName) as InstructorName, ROUND(Avg(q.mean),2) as QualityMean, ROUND(Avg(te.mean),2) as TeachingEffectivessMean, ROUND(Avg(ic.mean),2) as IntlChallenegeMean, ROUND(Avg(wl.mean),2) as WorkloadMean, ROUND(Avg(wf.mean),2) as FeedbackMean FROM CourseInfo c , Instructor i, AggregateInfo q, CourseDetail cd, AggregateInfo te, AggregateInfo ic, AggregateInfo wf, AggregateInfo wl
        WHERE c.InstructorID = i.InstructorID AND c.year = yr AND cd.CID = c.CID
        AND q.Type = 'Quality' AND c.CID = q.CID AND c.Year = q.Year AND c.Semester = q.Semester AND c.Section = q.Section
        AND te.Type = 'TeachingEffectiveness' AND c.CID = te.CID AND c.Year = te.Year AND c.Semester = te.Semester AND c.Section = te.Section
        AND ic.Type = 'IntlChallenge' AND c.CID = ic.CID AND c.Year = ic.Year AND c.Semester = ic.Semester AND c.Section = ic.Section
        AND wl.Type = 'Workload' AND c.CID = wl.CID AND c.Year = wl.Year AND c.Semester = wl.Semester AND c.Section = wl.Section
        AND wf.Type = 'Feedback' AND c.CID = wf.CID AND c.Year = wf.Year AND c.Semester = wf.Semester AND c.Section = wf.Section
        GROUP BY c.CID, c.YEAR, c.Semester, cd.CName, InstructorName;
    END//
delimiter ;

#select by faculty [section integrated]
delimiter //
DROP PROCEDURE IF EXISTS ShowInfoByInstructor //
CREATE PROCEDURE ShowInfoByInstructor(IN search VARCHAR(60))
    BEGIN
      SELECT DISTINCT c.CID, cd.CName as Title, c.YEAR, c.Semester, Concat(i.FName, " ", i.LName) as InstructorName, ROUND(Avg(q.mean),2) as QualityMean, ROUND(Avg(te.mean),2) as TeachingEffectivessMean, ROUND(Avg(ic.mean),2) as IntlChallenegeMean, ROUND(Avg(wl.mean),2) as WorkloadMean, ROUND(Avg(wf.mean),2) as FeedbackMean FROM CourseInfo c , Instructor i, AggregateInfo q, CourseDetail cd, AggregateInfo te, AggregateInfo ic, AggregateInfo wf, AggregateInfo wl
      WHERE c.InstructorID = i.InstructorID AND Concat(i.FName, " ", i.LName) LIKE search AND cd.CID = c.CID
      AND q.Type = 'Quality' AND c.CID = q.CID AND c.Year = q.Year AND c.Semester = q.Semester AND c.Section = q.Section
      AND te.Type = 'TeachingEffectiveness' AND c.CID = te.CID AND c.Year = te.Year AND c.Semester = te.Semester AND c.Section = te.Section
      AND ic.Type = 'IntlChallenge' AND c.CID = ic.CID AND c.Year = ic.Year AND c.Semester = ic.Semester AND c.Section = ic.Section
      AND wl.Type = 'Workload' AND c.CID = wl.CID AND c.Year = wl.Year AND c.Semester = wl.Semester AND c.Section = wl.Section
      AND wf.Type = 'Feedback' AND c.CID = wf.CID AND c.Year = wf.Year AND c.Semester = wf.Semester AND c.Section = wf.Section
      GROUP BY c.CID, c.YEAR, c.Semester, cd.CName, InstructorName;
    END//
delimiter ;

#select by courseID[courseName]  ("%Intermediate%") [section integrated]
delimiter //
DROP PROCEDURE IF EXISTS ShowInfoByCourse //
CREATE PROCEDURE ShowInfoByCourse(IN  courseID VARCHAR(100))
    BEGIN
        SELECT DISTINCT c.CID, cd.CName as Title, c.YEAR, c.Semester, Concat(i.FName, " ", i.LName) as InstructorName, ROUND(Avg(q.mean),2) as QualityMean, ROUND(Avg(te.mean),2) as TeachingEffectivessMean, ROUND(Avg(ic.mean),2) as IntlChallenegeMean, ROUND(Avg(wl.mean),2) as WorkloadMean, ROUND(Avg(wf.mean),2) as FeedbackMean FROM CourseInfo c , Instructor i, AggregateInfo q, CourseDetail cd, AggregateInfo te, AggregateInfo ic, AggregateInfo wf, AggregateInfo wl
        WHERE c.InstructorID = i.InstructorID AND cd.CName LIKE courseID AND cd.CID = c.CID
        AND q.Type = 'Quality' AND c.CID = q.CID AND c.Year = q.Year AND c.Semester = q.Semester AND c.Section = q.Section
        AND te.Type = 'TeachingEffectiveness' AND c.CID = te.CID AND c.Year = te.Year AND c.Semester = te.Semester AND c.Section = te.Section
        AND ic.Type = 'IntlChallenge' AND c.CID = ic.CID AND c.Year = ic.Year AND c.Semester = ic.Semester AND c.Section = ic.Section
        AND wl.Type = 'Workload' AND c.CID = wl.CID AND c.Year = wl.Year AND c.Semester = wl.Semester AND c.Section = wl.Section
        AND wf.Type = 'Feedback' AND c.CID = wf.CID AND c.Year = wf.Year AND c.Semester = wf.Semester AND c.Section = wf.Section
        GROUP BY c.CID, c.YEAR, c.Semester, cd.CName, InstructorName;
    END//
delimiter ;
