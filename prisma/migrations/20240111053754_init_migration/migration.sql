-- CreateTable
CREATE TABLE "Bmi" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "age" INTEGER,
    "gender" BOOLEAN NOT NULL DEFAULT false,
    "weight" INTEGER
);
