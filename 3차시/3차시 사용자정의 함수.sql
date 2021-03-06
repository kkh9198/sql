-- 사용자 정의 함수 
-- get_dept_name 함수 
CREATE OR REPLACE FUNCTION get_dept_name (p_dept_id NUMBER)
  RETURN VARCHAR2
IS
  v_return  VARCHAR2(80);
BEGIN
  SELECT department_name
    INTO v_return
    FROM departments 
   WHERE department_id = p_dept_id;

  RETURN v_return;
END;

-- get_dept_name 함수 사용 
SELECT get_dept_name(10),
       get_dept_name(100)
  FROM DUAL;


-- IsNumber 함수 
CREATE OR REPLACE FUNCTION IsNumber (p_number VARCHAR2)
  RETURN NUMBER
IS
  v_return  NUMBER;
BEGIN
  SELECT TO_NUMBER(p_number)
    INTO v_return
    FROM DUAL;

   RETURN 0;
EXCEPTION WHEN OTHERS THEN
   RETURN  1;
END;

-- IsNumber 함수 사용 
SELECT IsNumber('123')
      ,IsNumber('ABc')
   FROM DUAL;


CREATE TABLE TO_NUMBER_TEST (
    NUMBER_CONF   VARCHAR2(100)
);


INSERT INTO TO_NUMBER_TEST VALUES ('1');
INSERT INTO TO_NUMBER_TEST VALUES ('2');
INSERT INTO TO_NUMBER_TEST VALUES ('3');
INSERT INTO TO_NUMBER_TEST VALUES ('4');
INSERT INTO TO_NUMBER_TEST VALUES ('5');
INSERT INTO TO_NUMBER_TEST VALUES ('6');
INSERT INTO TO_NUMBER_TEST VALUES ('7');
INSERT INTO TO_NUMBER_TEST VALUES ('8');
INSERT INTO TO_NUMBER_TEST VALUES ('9');
INSERT INTO TO_NUMBER_TEST VALUES ('10');
INSERT INTO TO_NUMBER_TEST VALUES ('11');
INSERT INTO TO_NUMBER_TEST VALUES ('1a');
INSERT INTO TO_NUMBER_TEST VALUES ('13');
INSERT INTO TO_NUMBER_TEST VALUES ('14');
COMMIT;


SELECT *
FROM TO_NUMBER_TEST;

SELECT TO_NUMBER(NUMBER_CONF)
FROM TO_NUMBER_TEST;

SELECT CASE WHEN IsNumber(number_conf) = 0 THEN TO_NUMBER(number_conf)
            ELSE 0
       END TONUMBERS
FROM TO_NUMBER_TEST;