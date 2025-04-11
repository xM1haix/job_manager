BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "bug_report" (
    "id" bigserial PRIMARY KEY,
    "title" text NOT NULL,
    "details" text NOT NULL
);


--
-- MIGRATION VERSION FOR job_manager
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('job_manager', '20250411123843558', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250411123843558', "timestamp" = now();

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
