create table "AccountGroup"
(
    "AccountGroupId" SERIAL primary key,
    "AccountType"  varchar(100) not null,
    "AccountDescription" varchar(255) not null,
    "IsActive"      boolean,
    "CreatedDate"   TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    "ModifiedDate"  TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);


create table "AccountStatus"
(
    "AccountStatusId" SERIAL primary key,
    "AccountExpirationDate" date,
    "IsActive"  boolean,
    "CreatedDate"  TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    "AccountCreatedDate" TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    "ModifiedDate" TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

create table "PhoneNumberType"
(
    "PhoneNumberTypeId" SERIAL primary key,
    "PhoneType"    varchar(255) not null,
    "Description"  varchar(255) not null,
    "CreatedBy"    INT,
    "IsActive"     boolean,
    "CreatedDate"  TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    "ModifiedDate" TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

create table "Country"
(
    "CountryId" SERIAL primary key,
    "Name"         varchar(255) not null,
    "Nationality"  varchar(255) not null,
    "IsActive"     boolean,
    "CreatedDate"  TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    "ModifiedDate" TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

create table "Region"
(
    "RegionId" SERIAL primary key,
    "RegionName"   varchar(255) not null,
    "CountryId"    INT not null,
    "IsActive"     boolean,
    "CreatedDate"  TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    "ModifiedDate" TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY("CountryId") REFERENCES "Country"("CountryId")
);

create table "SubCity"
(
    "SubCityId" SERIAL primary key,
    "FullName"  varchar(255) not null,
    "RegionId"  INT not null,
    "IsActive"     boolean,
    "CreatedDate"  TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    "ModifiedDate" TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY("RegionId") REFERENCES "Region"("RegionId")
);

create table "Gender"
(
    "GenderId" SERIAL primary key,
    "Type"  varchar(255) not null,
    "Description"  varchar(255) not null,
    "IsActive"     boolean,
    "CreatedDate"  TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    "ModifiedDate" TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);


create table "Zone"
(
    "ZoneId" SERIAL primary key,
    "ZoneName"  varchar(255) not null,
    "RegionId"  INT not null,
    "IsActive"     boolean,
    "CreatedDate"  TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    "ModifiedDate" TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY("RegionId") REFERENCES "Region"("RegionId")
);

create table "MaritalStatus"
(
    "MaritalStatusId" SERIAL primary key,
    "Status"       varchar(255) not null,
    "Description"  varchar(255) not null,
    "IsActive"     boolean,
    "CreatedDate"  TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    "ModifiedDate" TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

create table "Woreda"
(
    "WoredaId" SERIAL primary key,
    "WoredaName"   varchar(255),
    "SubCityId"    INT,
    "CreatedDate"  TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    "ModifiedDate" TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY("SubCityId") REFERENCES "SubCity"("SubCityId")
);


create table "AccountInformation"
(
    "AccountInformationId" SERIAL primary key,
    "Email"             varchar(255),
    "PhoneNumberTypeId" INT,
    "PhoneNumber"       INT,
    "RegionId"          INT,
    "MaritalStatusId" INT not null,
    "CountryId"       INT not null,
    "SubCityId"       INT,
    "ZoneId"          INT,
    "GenderId"        INT,
    "WoredaId"        INT not null,
    "Kebele"          varchar(255),
    "HouseNumber"     varchar(255),
    "CreatedBy"       INT,
    "CreatedDate"     TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    "ModifiedDate"    TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY("PhoneNumberTypeId") REFERENCES "PhoneNumberType"("PhoneNumberTypeId"),
    FOREIGN KEY("CountryId") REFERENCES "Country"("CountryId"),
    FOREIGN KEY("RegionId") REFERENCES "Region"("RegionId"),
    FOREIGN KEY("SubCityId") REFERENCES "SubCity"("SubCityId"),
    FOREIGN KEY("ZoneId") REFERENCES "Zone"("ZoneId"),
    FOREIGN KEY("WoredaId") REFERENCES "Woreda"("WoredaId"),
    FOREIGN KEY("GenderId") REFERENCES "Gender"("GenderId"),
    FOREIGN KEY("MaritalStatusId") REFERENCES "MaritalStatus"("MaritalStatusId")
);

create table "Accounts"
(
    "AccountsId" SERIAL primary key,
    "FirstName"   varchar(255),
    "MiddleName"  varchar(255),
    "LastName"    varchar(255),
    "AccountGroupId"  INT ,
    "AccountStatusId" INT ,
    "UserName"  varchar(255),
    "Password"  varchar(255),
    "AccountInformationId" INT,
    "CreatedDate" TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    "ModifiedDate" TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY("AccountGroupId") REFERENCES "AccountGroup"("AccountGroupId"),
    FOREIGN KEY("AccountStatusId") REFERENCES "AccountStatus"("AccountStatusId"),
    FOREIGN KEY("AccountInformationId") REFERENCES "AccountInformation"("AccountInformationId")
);

create table "Customer"
(
    "CustomerId" SERIAL primary key,
    "FirstName"         varchar(255) not null,
    "MiddleName"        varchar(255) not null,
    "LastName"          varchar(255) not null,
    "DateOfBirth"       varchar(255) not null,
    "PhoneNumberTypeId" INT,
    "PhoneNumber"       varchar(255) not null,
    "Email"             varchar(255) not null,
    "Postal"            varchar(255) not null,
    "GenderId"          INT not null,
    "MaritalStatusId"   INT not null,
    "RegionId"          INT,
    "CountryId"         INT not null,
    "SubCityId"         INT,
    "ZoneId"            INT,
    "WoredaId"          INT not null,
    "Kebele"            varchar(255),
    "HouseNumber"       varchar(255),
    "CreatedBy"         INT,
    "CreatedDate"       TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    "ModifiedDate"      TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY("PhoneNumberTypeId") REFERENCES "PhoneNumberType"("PhoneNumberTypeId"),
    FOREIGN KEY("CountryId") REFERENCES "Country"("CountryId"),
    FOREIGN KEY("RegionId") REFERENCES "Region"("RegionId"),
    FOREIGN KEY("SubCityId") REFERENCES "SubCity"("SubCityId"),
    FOREIGN KEY("ZoneId") REFERENCES "Zone"("ZoneId"),
    FOREIGN KEY("WoredaId") REFERENCES "Woreda"("WoredaId"),
    FOREIGN KEY("GenderId") REFERENCES "Gender"("GenderId"),
    FOREIGN KEY("MaritalStatusId") REFERENCES "MaritalStatus"("MaritalStatusId")   
);

create table "CustomerAccount"
(
    "CustomerAccountsId" SERIAL primary key,
    "CustomerId" INT,
    "AccountGroupId"  INT ,
    "AccountStatusId" INT ,
    "UserName"  varchar(255),
    "Password"  varchar(255),
    "CreatedDate" TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    "ModifiedDate" TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY("AccountGroupId") REFERENCES "AccountGroup"("AccountGroupId"),
    FOREIGN KEY("AccountStatusId") REFERENCES "AccountStatus"("AccountStatusId"),
    FOREIGN KEY("CustomerId") REFERENCES "Customer"("CustomerId")
);

create table "Medicine"
(
    "MedicineId" SERIAL primary key,
    "MedicineName" varchar(255) not null,
    "MedicineExpirationDate" date,
    "CreatedBy"    INT,
    "ModifiedDate" TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    "CreatedDate"  TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY("CreatedBy") REFERENCES "Accounts"("AccountsId")
);

create table "Prescription"
(
    "PrescriptionId"  SERIAL primary key,
    "MedicineId"      INT,
    "Strength"        varchar,
    "AmountToBeTaken" varchar,
    "Frequency"       varchar(255),
    "Route"           varchar(255) not null,
    "HowMuch"         varchar(255),
    "Refills"         varchar(255) not null,
    "Note"            varchar(255),
    "IsActive"        boolean,
    "CustomerId"      INT,
    "ModifiedDate"    TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    "CreatedDate"     TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY("CustomerId") REFERENCES "Customer"("CustomerId"),
    FOREIGN KEY("MedicineId") REFERENCES "Medicine"("MedicineId")
);