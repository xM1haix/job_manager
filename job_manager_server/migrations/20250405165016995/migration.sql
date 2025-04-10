BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "roles" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "deletedAt" bigint,
    "teamId" bigint NOT NULL,
    "userId" bigint NOT NULL,
    "jobCreate" boolean NOT NULL,
    "jobRead" boolean NOT NULL,
    "jobUpdate" boolean NOT NULL,
    "jobHide" boolean NOT NULL,
    "jobDelete" boolean NOT NULL,
    "stageCreate" boolean NOT NULL,
    "stageRead" boolean NOT NULL,
    "stageUpdate" boolean NOT NULL,
    "stageHide" boolean NOT NULL,
    "stageDelete" boolean NOT NULL,
    "teamUpdate" boolean NOT NULL,
    "teamHide" boolean NOT NULL,
    "teamDelete" boolean NOT NULL
);

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "roles"
    ADD CONSTRAINT "roles_fk_0"
    FOREIGN KEY("teamId")
    REFERENCES "teams"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "roles"
    ADD CONSTRAINT "roles_fk_1"
    FOREIGN KEY("userId")
    REFERENCES "serverpod_user_info"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR job_manager
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('job_manager', '20250405165016995', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250405165016995', "timestamp" = now();

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
