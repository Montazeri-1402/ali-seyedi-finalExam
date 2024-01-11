/*
  Warnings:

  - You are about to alter the column `bmi` on the `Bmi` table. The data in that column could be lost. The data in that column will be cast from `Int` to `Float`.
  - You are about to alter the column `height` on the `Bmi` table. The data in that column could be lost. The data in that column will be cast from `Int` to `Float`.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Bmi" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "age" INTEGER,
    "gender" BOOLEAN NOT NULL DEFAULT false,
    "weight" INTEGER,
    "height" REAL,
    "bmi" REAL
);
INSERT INTO "new_Bmi" ("age", "bmi", "gender", "height", "id", "weight") SELECT "age", "bmi", "gender", "height", "id", "weight" FROM "Bmi";
DROP TABLE "Bmi";
ALTER TABLE "new_Bmi" RENAME TO "Bmi";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
