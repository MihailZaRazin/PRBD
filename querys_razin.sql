SELECT 
    *
FROM
    razin_univer.student_has_emploee
WHERE
    `student_has_emploee`.`student_idstudent` = 1;
    
SELECT 
    `student`.`studname`,
    `student_has_emploee`.`date`,
    `student_has_emploee`.`marks`
FROM
    razin_univer.student_has_emploee,
    student
WHERE
    (`student_has_emploee`.`student_idstudent` = 1
        OR `student_has_emploee`.`student_idstudent` = 2)
        AND `student_has_emploee`.`student_idstudent` = `student`.`idstudent`;
        

SELECT 
    `student`.`studname`,
    `student_has_emploee`.`date`,
    `student_has_emploee`.`marks`, `group`.`code`
FROM
    razin_univer.student_has_emploee,
    student, `razin_univer`.`group`
WHERE
    (`student_has_emploee`.`student_idstudent` = 1
        OR `student_has_emploee`.`student_idstudent` = 2)
        AND `student_has_emploee`.`student_idstudent` = `student`.`idstudent`
        and `group`.`code` 
        ;