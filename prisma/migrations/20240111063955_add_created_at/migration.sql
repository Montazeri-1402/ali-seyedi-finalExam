-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Bmi" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "age" INTEGER,
    "gender" BOOLEAN NOT NULL DEFAULT false,
    "weight" INTEGER,
    "height" REAL,
    "bmi" REAL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO "new_Bmi" ("age", "bmi", "gender", "height", "id", "weight") SELECT "age", "bmi", "gender", "height", "id", "weight" FROM "Bmi";
DROP TABLE "Bmi";
ALTER TABLE "new_Bmi" RENAME TO "Bmi";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
