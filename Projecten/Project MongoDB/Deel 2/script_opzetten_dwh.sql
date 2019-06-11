CREATE SCHEMA `mydb_dwh` ;

CREATE TABLE dim_datum1 (
    DATE_SK INT,
    IN_DATE DATETIME,
    PreSummer BOOLEAN
)
;CREATE INDEX idx_dim_datum_lookup ON dim_datum(DATE_SK)
;


CREATE TABLE dim_user (
    key_sur_user BIGINT NOT NULL PRIMARY KEY,
    version INT,
    date_from DATETIME,
    date_to DATETIME,
    IdUser INT,
    FirstName VARCHAR(45),
    LastName VARCHAR(45),
    Country VARCHAR(40),
    KgFromTarget TINYTEXT
)
;CREATE INDEX idx_dim_user_lookup ON dim_user(IdUser)
;
CREATE INDEX idx_dim_user_tk ON dim_user(key_sur_user)
;

CREATE TABLE dim_appActivity (
    activity INT,
    activityType TINYTEXT
)
;CREATE INDEX idx_dim_appActivity_lookup ON dim_appActivity(activity)
;

CREATE TABLE Facts_DailySnapshot2 (
    Sk_datum INT,
    User_IdUser INT,
    SK_USER INT,
    Sk_appActivities DOUBLE,
    WeightChange DOUBLE,
    CaloriesUsedFromActivities DOUBLE,
    CaloriesIntake DOUBLE,
    TotalFats DOUBLE,
    TotalCarbohydrats DOUBLE,
    TotalFibres DOUBLE,
    TotalProteins DOUBLE,
    TotalSalt DOUBLE,
    TotalSugars DOUBLE
)
;CREATE INDEX idx_Facts_DailySnapshot2_lookup ON Facts_DailySnapshot2(Sk_datum, User_IdUser)
;

