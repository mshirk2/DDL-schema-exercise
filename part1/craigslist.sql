-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Region" (
    "RegionID" int   NOT NULL,
    "Name" string   NOT NULL,
    CONSTRAINT "pk_Region" PRIMARY KEY (
        "RegionID"
     )
);

CREATE TABLE "User" (
    "UserID" int   NOT NULL,
    "Username" string   NOT NULL,
    "PreferredRegion" int   NOT NULL,
    CONSTRAINT "pk_User" PRIMARY KEY (
        "UserID"
     )
);

CREATE TABLE "Post" (
    "PostID" int   NOT NULL,
    "Title" string   NOT NULL,
    "Text" string   NOT NULL,
    "UserID" int   NOT NULL,
    "RegionID" int   NOT NULL,
    "Location" string   NOT NULL,
    CONSTRAINT "pk_Post" PRIMARY KEY (
        "PostID"
     )
);

CREATE TABLE "Categories" (
    "CategoryID" int   NOT NULL,
    "name" string   NOT NULL,
    "PostID" int   NOT NULL,
    CONSTRAINT "pk_Categories" PRIMARY KEY (
        "CategoryID"
     )
);

ALTER TABLE "User" ADD CONSTRAINT "fk_User_PreferredRegion" FOREIGN KEY("PreferredRegion")
REFERENCES "Region" ("RegionID");

ALTER TABLE "Post" ADD CONSTRAINT "fk_Post_UserID" FOREIGN KEY("UserID")
REFERENCES "User" ("UserID");

ALTER TABLE "Post" ADD CONSTRAINT "fk_Post_RegionID" FOREIGN KEY("RegionID")
REFERENCES "Region" ("RegionID");

ALTER TABLE "Categories" ADD CONSTRAINT "fk_Categories_PostID" FOREIGN KEY("PostID")
REFERENCES "Post" ("PostID");

