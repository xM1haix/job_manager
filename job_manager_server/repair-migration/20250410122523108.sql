BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "stages" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "status" boolean NOT NULL DEFAULT false,
    "jobId" bigint NOT NULL
);

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "stages"
    ADD CONSTRAINT "stages_fk_0"
    FOREIGN KEY("jobId")
    REFERENCES "jobs"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR job_manager
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('job_manager', '20250410122202321', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250410122202321', "timestamp" = now();

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

--
-- MIGRATION VERSION FOR _repair
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('_repair', '20250410122523108', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250410122523108', "timestamp" = now();


COMMIT;
