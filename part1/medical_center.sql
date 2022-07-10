-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

CREATE TABLE "Doctor" (
    "DoctorID" int   NOT NULL,
    "Name" string   NOT NULL,
    "Specialty" string   NOT NULL,
    CONSTRAINT "pk_Doctor" PRIMARY KEY (
        "DoctorID"
     )
);

CREATE TABLE "Patient" (
    "PatientID" int   NOT NULL,
    "Name" string   NOT NULL,
    "Birthday" date   NOT NULL,
    CONSTRAINT "pk_Patient" PRIMARY KEY (
        "PatientID"
     )
);

CREATE TABLE "Disease" (
    "DiseaseID" int   NOT NULL,
    "Name" string   NOT NULL,
    "Symptoms" string   NOT NULL,
    "Treatment" string   NOT NULL,
    CONSTRAINT "pk_Disease" PRIMARY KEY (
        "DiseaseID"
     )
);

CREATE TABLE "Visit" (
    "VisitID" int   NOT NULL,
    "Date" date   NOT NULL,
    "IsPaid" bool   NOT NULL,
    "DoctorID" int   NOT NULL,
    "PatientID" int   NOT NULL,
    CONSTRAINT "pk_Visit" PRIMARY KEY (
        "VisitID"
     )
);

CREATE TABLE "Diagnoses" (
    "DiagnosisID" int   NOT NULL,
    "VisitID" int   NOT NULL,
    "DiseaseID" int   NOT NULL,
    CONSTRAINT "pk_Diagnoses" PRIMARY KEY (
        "DiagnosisID"
     )
);

ALTER TABLE "Visit" ADD CONSTRAINT "fk_Visit_DoctorID" FOREIGN KEY("DoctorID")
REFERENCES "Doctor" ("DoctorID");

ALTER TABLE "Visit" ADD CONSTRAINT "fk_Visit_PatientID" FOREIGN KEY("PatientID")
REFERENCES "Patient" ("PatientID");

ALTER TABLE "Diagnoses" ADD CONSTRAINT "fk_Diagnoses_VisitID" FOREIGN KEY("VisitID")
REFERENCES "Visit" ("VisitID");

ALTER TABLE "Diagnoses" ADD CONSTRAINT "fk_Diagnoses_DiseaseID" FOREIGN KEY("DiseaseID")
REFERENCES "Disease" ("DiseaseID");

