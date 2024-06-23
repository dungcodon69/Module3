use quanlysinhvien;

SELECT SubID, SubName, Credit from subject where credit = (SELECT max(credit) from subject);

