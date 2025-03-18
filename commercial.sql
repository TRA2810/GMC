
CREATE TABLE CATEGORIES (
   CATEGORY_CODE INT NOT NULL,
   CATEGORY_NAME VARCHAR(25) NOT NULL,
   DESCRIPTION   VARCHAR(100) NOT NULL,
   CONSTRAINT PK_CATEGORIES PRIMARY KEY (CATEGORY_CODE)
);


CREATE TABLE CUSTOMERS (
   CUSTOMER_CODE  CHAR(5) NOT NULL,
   COMPANY        NVARCHAR(40) NOT NULL,
   ADDRESS        NVARCHAR(60) NOT NULL,
   CITY           VARCHAR(30) NOT NULL,
   POSTAL_CODE    VARCHAR(10) NOT NULL,
   COUNTRY        VARCHAR(15) NOT NULL,
   PHONE          VARCHAR(24) NOT NULL,
   FAX            VARCHAR(24),
   CONSTRAINT PK_CUSTOMERS PRIMARY KEY (CUSTOMER_CODE)
);


CREATE TABLE ORDERS (
   ORDER_NUMBER    INT NOT NULL,
   CUSTOMER_CODE   CHAR(5) NOT NULL,
   EMPLOYEE_NUMBER INT NOT NULL,
   ORDER_DATE      DATE NOT NULL,
   SHIP_DATE       DATE,
   SHIPPING_COST   DECIMAL(8,2),
   CONSTRAINT PK_ORDERS PRIMARY KEY (ORDER_NUMBER)
);


CREATE TABLE ORDER_DETAILS (
   ORDER_NUMBER   INT NOT NULL,
   PRODUCT_REF    INT NOT NULL,
   UNIT_PRICE     DECIMAL(8,2) NOT NULL,
   QUANTITY       INT NOT NULL,
   DISCOUNT       FLOAT NOT NULL,
   CONSTRAINT PK_ORDER_DETAILS PRIMARY KEY (ORDER_NUMBER, PRODUCT_REF)
);


CREATE TABLE EMPLOYEES (
   EMPLOYEE_NUMBER INT NOT NULL,
   REPORTS_TO      INT,
   LAST_NAME       NVARCHAR(40) NOT NULL,
   FIRST_NAME      NVARCHAR(30) NOT NULL,
   POSITION        VARCHAR(30) NOT NULL,
   TITLE           VARCHAR(5) NOT NULL,
   BIRTH_DATE      DATE NOT NULL,
   HIRE_DATE       DATE DEFAULT GETDATE() NOT NULL,
   SALARY          DECIMAL(8,2) NOT NULL,
   COMMISSION      DECIMAL(8,2),
   CONSTRAINT PK_EMPLOYEES PRIMARY KEY (EMPLOYEE_NUMBER)
);


CREATE TABLE SUPPLIERS (
   SUPPLIER_NUMBER INT NOT NULL,
   COMPANY         NVARCHAR(40) NOT NULL,
   ADDRESS         NVARCHAR(60) NOT NULL,
   CITY            VARCHAR(30) NOT NULL,
   POSTAL_CODE     VARCHAR(10) NOT NULL,
   COUNTRY         VARCHAR(15) NOT NULL,
   PHONE           VARCHAR(24) NOT NULL,
   FAX             VARCHAR(24),
   CONSTRAINT PK_SUPPLIERS PRIMARY KEY (SUPPLIER_NUMBER)
);


CREATE TABLE PRODUCTS (
   PRODUCT_REF     INT NOT NULL,
   PRODUCT_NAME    NVARCHAR(40) NOT NULL,
   SUPPLIER_NUMBER INT NOT NULL,
   CATEGORY_CODE   INT NOT NULL,
   QUANTITY        VARCHAR(30),
   UNIT_PRICE      DECIMAL(8,2) NOT NULL,
   UNITS_IN_STOCK  INT,
   UNITS_ON_ORDER  INT,
   UNAVAILABLE     BIT,
   CONSTRAINT PK_PRODUCTS PRIMARY KEY (PRODUCT_REF)
);

INSERT INTO EMPLOYEES VALUES 
(2, 2, 'Fuller', 'Andrew', 'Vice President', 'Dr.', '1952-02-19', '1992-08-14', 10000.00, NULL),
(8, 2, 'Callahan', 'Laura', 'Sales Assistant', 'Miss', '1958-01-09', '1994-03-05', 2000.00, NULL),
(4, 2, 'Peacock', 'Margaret', 'Sales Representative', 'Mrs.', '1958-09-19', '1993-05-03', 2856.00, 250.00),
(3, 2, 'Leverling', 'Janet', 'Sales Representative', 'Miss', '1963-08-30', '1992-04-01', 3500.00, 1000.00),
(1, 2, 'Davolio', 'Nancy', 'Sales Representative', 'Miss', '1968-12-08', '1992-05-01', 3135.00, 1500.00),
(5, 2, 'Buchanan', 'Steven', 'Sales Manager', 'Mr.', '1955-03-04', '1993-10-17', 8000.00, NULL),
(9, 5, 'Dodsworth', 'Anne', 'Sales Representative', 'Miss', '1969-07-02', '1994-11-15', 2180.00, 0.00),
(6, 5, 'Suyama', 'Michael', 'Sales Representative', 'Mr.', '1963-07-02', '1993-10-17', 2534.00, 600.00),
(7, NULL, 'King', 'Robert', 'Sales Representative', 'Mr.', '1960-05-29', '1994-01-02', 2356.00, 800.00);


INSERT INTO CATEGORIES VALUES 
(1, 'Beverages', 'Beverages, coffees, teas'),
(2, 'Condiments', 'Sauces, seasonings, and spices'),
(3, 'Desserts', 'Desserts and sweets'),
(4, 'Dairy Products', 'Cheeses'),
(5, 'Pasta and Cereals', 'Breads, biscuits, pasta, and cereals'),
(6, 'Meats', 'Prepared meats'),
(7, 'Dry Products', 'Dried fruits, raisins, others'),
(8, 'Fish and Seafood', 'Fish, seafood, snails'),
(9, 'Computer Equipment', 'Laptops, keyboards, mice');

INSERT INTO CUSTOMERS VALUES 
('ALFKI', 'Alfreds Futterkiste', 'Obere Str. 57', 'Berlin', '12209', 'Germany', '030-0074321', '030-0076545'),
('ANATR', 'Ana Trujillo Emparedados y helados', 'Avda. de la Constitución 2222', 'México D.F.', '05021', 'Mexico', '(5) 555-4729', '(5) 555-3745');


