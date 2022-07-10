-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Teams" (
    "TeamID" int   NOT NULL,
    "Name" string   NOT NULL,
    "City" string   NOT NULL,
    CONSTRAINT "pk_Teams" PRIMARY KEY (
        "TeamID"
     )
);

CREATE TABLE "Players" (
    "PlayerID" int   NOT NULL,
    "TeamID" int   NOT NULL,
    "Name" string   NOT NULL,
    CONSTRAINT "pk_Players" PRIMARY KEY (
        "PlayerID"
     )
);

CREATE TABLE "Goals" (
    "GoalID" int   NOT NULL,
    "PlayerID" int   NOT NULL,
    "Match" int   NOT NULL,
    CONSTRAINT "pk_Goals" PRIMARY KEY (
        "GoalID"
     )
);

CREATE TABLE "Matches" (
    "MatchID" int   NOT NULL,
    "Date" date   NOT NULL,
    "Season" int   NOT NULL,
    "HomeTeamID" int   NOT NULL,
    "AwayTeamID" int   NOT NULL,
    "Referee1" int   NOT NULL,
    "Referee2" int   NOT NULL,
    CONSTRAINT "pk_Matches" PRIMARY KEY (
        "MatchID"
     )
);

CREATE TABLE "Referees" (
    "RefereeID" int   NOT NULL,
    "Name" string   NOT NULL,
    CONSTRAINT "pk_Referees" PRIMARY KEY (
        "RefereeID"
     )
);

CREATE TABLE "Seasons" (
    "SeasonID" int   NOT NULL,
    "StartDate" date   NOT NULL,
    "EndDate" date   NOT NULL,
    CONSTRAINT "pk_Seasons" PRIMARY KEY (
        "SeasonID"
     )
);

CREATE TABLE "Results" (
    "ResultID" int   NOT NULL,
    "Result" string   NOT NULL,
    "TeamID" int   NOT NULL,
    "Match" int   NOT NULL,
    CONSTRAINT "pk_Results" PRIMARY KEY (
        "ResultID"
     )
);

ALTER TABLE "Players" ADD CONSTRAINT "fk_Players_TeamID" FOREIGN KEY("TeamID")
REFERENCES "Teams" ("TeamID");

ALTER TABLE "Goals" ADD CONSTRAINT "fk_Goals_PlayerID" FOREIGN KEY("PlayerID")
REFERENCES "Players" ("PlayerID");

ALTER TABLE "Goals" ADD CONSTRAINT "fk_Goals_Match" FOREIGN KEY("Match")
REFERENCES "Matches" ("MatchID");

ALTER TABLE "Matches" ADD CONSTRAINT "fk_Matches_Season" FOREIGN KEY("Season")
REFERENCES "Seasons" ("SeasonID");

ALTER TABLE "Matches" ADD CONSTRAINT "fk_Matches_HomeTeamID" FOREIGN KEY("HomeTeamID")
REFERENCES "Teams" ("TeamID");

ALTER TABLE "Matches" ADD CONSTRAINT "fk_Matches_AwayTeamID" FOREIGN KEY("AwayTeamID")
REFERENCES "Teams" ("TeamID");

ALTER TABLE "Matches" ADD CONSTRAINT "fk_Matches_Referee1" FOREIGN KEY("Referee1")
REFERENCES "Referees" ("RefereeID");

ALTER TABLE "Matches" ADD CONSTRAINT "fk_Matches_Referee2" FOREIGN KEY("Referee2")
REFERENCES "Referees" ("RefereeID");

ALTER TABLE "Results" ADD CONSTRAINT "fk_Results_TeamID" FOREIGN KEY("TeamID")
REFERENCES "Teams" ("TeamID");

ALTER TABLE "Results" ADD CONSTRAINT "fk_Results_Match" FOREIGN KEY("Match")
REFERENCES "Matches" ("MatchID");

