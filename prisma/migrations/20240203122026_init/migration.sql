-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_User" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "fullname" TEXT,
    "email" TEXT,
    "phone_number" TEXT,
    "password" TEXT NOT NULL,
    "gender" TEXT,
    "age" INTEGER,
    "city" TEXT,
    "balance" INTEGER NOT NULL DEFAULT 0,
    "referral_link" TEXT,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO "new_User" ("age", "balance", "city", "created_at", "email", "fullname", "gender", "id", "password", "phone_number", "referral_link") SELECT "age", "balance", "city", "created_at", "email", "fullname", "gender", "id", "password", "phone_number", "referral_link" FROM "User";
DROP TABLE "User";
ALTER TABLE "new_User" RENAME TO "User";
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");
CREATE UNIQUE INDEX "User_phone_number_key" ON "User"("phone_number");
CREATE UNIQUE INDEX "User_referral_link_key" ON "User"("referral_link");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
