BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "roles" DROP CONSTRAINT "roles_fk_1";
ALTER TABLE "roles" DROP COLUMN "userId";
ALTER TABLE "roles" ALTER COLUMN "jobCreate" SET DEFAULT false;
ALTER TABLE "roles" ALTER COLUMN "jobRead" SET DEFAULT false;
ALTER TABLE "roles" ALTER COLUMN "jobUpdate" SET DEFAULT false;
ALTER TABLE "roles" ALTER COLUMN "jobDelete" SET DEFAULT false;
ALTER TABLE "roles" ALTER COLUMN "stageCreate" SET DEFAULT false;
ALTER TABLE "roles" ALTER COLUMN "stageRead" SET DEFAULT false;
ALTER TABLE "roles" ALTER COLUMN "stageUpdate" SET DEFAULT false;
ALTER TABLE "roles" ALTER COLUMN "stageDelete" SET DEFAULT false;
ALTER TABLE "roles" ALTER COLUMN "teamUpdate" SET DEFAULT false;
ALTER TABLE "roles" ALTER COLUMN "teamDelete" SET DEFAULT false;
ALTER TABLE "roles" ALTER COLUMN "roleCreate" SET DEFAULT false;
ALTER TABLE "roles" ALTER COLUMN "roleRead" SET DEFAULT false;
ALTER TABLE "roles" ALTER COLUMN "roleUpdate" SET DEFAULT false;
ALTER TABLE "roles" ALTER COLUMN "roleDelete" SET DEFAULT false;
ALTER TABLE "roles" ALTER COLUMN "teamUserCreate" SET DEFAULT false;
ALTER TABLE "roles" ALTER COLUMN "teamUserRead" SET DEFAULT false;
ALTER TABLE "roles" ALTER COLUMN "teamUserUpdate" SET DEFAULT false;
ALTER TABLE "roles" ALTER COLUMN "teamUserDelete" SET DEFAULT false;
--
-- ACTION ALTER TABLE
--
ALTER TABLE "teams" DROP COLUMN "isPrivate";

--
-- MIGRATION VERSION FOR job_manager
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('job_manager', '20250408092523697', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250408092523697', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth', '20240520102713718', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240520102713718', "timestamp" = now();


COMMIT;
