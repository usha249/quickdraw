DECLARE
    v_student_id NUMBER := 101;
    v_name VARCHAR2(50) := 'anuj';
    v_age NUMBER := 22;
    v_course VARCHAR2(50) := 'CSE';
BEGIN
    -- Insert first record
    INSERT INTO STUDENTS (STUDENT_ID, NAME, AGE, COURSE)
    VALUES (v_student_id, v_name, v_age, v_course);
    
    SAVEPOINT sp1;

    -- Insert second record
    INSERT INTO STUDENTS (STUDENT_ID, NAME, AGE, COURSE)
    VALUES (102, 'madhu', 21, 'EEE');
    
    SAVEPOINT sp2;

    -- Insert third record
    INSERT INTO STUDENTS (STUDENT_ID, NAME, AGE, COURSE)
    VALUES (103, 'pinkey', 23, 'MEC');

    -- Rollback to sp1 (undoes insertion of 'Madhu' and 'Sravani')
    ROLLBACK TO sp1;

    -- Commit the transaction (only 'Usha' will be committed)
    COMMIT;
    
    DBMS_OUTPUT.PUT_LINE('Transaction committed successfully.');
    
EXCEPTION
    WHEN OTHERS THEN        
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Transaction rolled back due to an error: ' || SQLERRM);
END;
/