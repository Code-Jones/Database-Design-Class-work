DROP TABLE CP_OVERDUE_LOG;
DROP TABLE CP_RENTAL;
DROP TABLE CP_RETURNS;
DROP TABLE CP_DVD;
DROP TABLE CP_TITLE;
DROP TABLE CP_CATEGORY;
DROP TABLE CP_CUSTOMER;
DROP TABLE CP_PRICE;

CREATE TABLE CP_CATEGORY
  (
  CATEGORY_CODE NUMBER,
  CATEGORY_DESCRIPTION VARCHAR2(20)
  );

CREATE TABLE CP_CUSTOMER
  (
  CUSTOMER_NO NUMBER,
  NAME VARCHAR2(30),
  ADDRESS_1 VARCHAR2(30),
  ADDRESS_2 VARCHAR2(30),
  AREA_CODE VARCHAR2(3),
  PHONE_NUMBER VARCHAR2(7),
  CREDIT_CARD VARCHAR2(2),
  EXPIRY_DATE DATE,
  CARD_NUMBER VARCHAR2(10)
  );

CREATE TABLE CP_OVERDUE_LOG
  (
  CUSTOMER_NO NUMBER,
  DVD_NUMBER NUMBER,
  DATE_DUE DATE,
  ACTUAL_DATE_RETURNED DATE
  );

CREATE TABLE CP_PRICE
  (
  RENTAL_CLASS VARCHAR2(1),
  RATE_PER_DAY NUMBER(5,2)
  );

CREATE TABLE CP_RENTAL
  (
  CUSTOMER_NO NUMBER,
  DVD_NUMBER NUMBER,
  DATE_OUT DATE,
  DATE_DUE DATE,
  ACTUAL_DATE_RETURNED DATE
  )
;

CREATE TABLE CP_RETURNS
  (
  DVD_NUMBER NUMBER,
  ACTUAL_DATE_RETURNED DATE
  );

CREATE TABLE CP_DVD
  (
  DVD_NUMBER NUMBER,
  TITLE_CODE VARCHAR2(15),
  STORE_NUMBER NUMBER,
  RENTAL_CLASS VARCHAR2(1)
  )
;

CREATE TABLE CP_TITLE
  (
  TITLE_CODE VARCHAR2(15),
  FILM_TITLE VARCHAR2(65),
  CATEGORY_CODE NUMBER,
  ACTORS VARCHAR2(65),
  RUNTIME NUMBER,
  STAR_RATING VARCHAR2(5)
  );
