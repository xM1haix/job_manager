BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "stages" CASCADE;

--
-- ACTION DROP TABLE
--
DROP TABLE "jobs" CASCADE;

--
-- ACTION DROP TABLE
--
DROP TABLE "teams" CASCADE;

--
-- ACTION DROP TABLE
--
DROP TABLE "team_users" CASCADE;

--
-- ACTION DROP TABLE
--
DROP TABLE "users" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "jobs" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "status" boolean,
    "teamId" bigint NOT NULL,
    "deletedAt" timestamp without time zone
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "stages" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "status" boolean,
    "deletedAt" timestamp without time zone,
    "jobId" bigint NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "team_users" (
    "id" bigserial PRIMARY KEY,
    "teamId" bigint NOT NULL,
    "userId" bigint NOT NULL,
    "deletedAt" timestamp without time zone,
    "permission" bigint NOT NULL DEFAULT 0
);

-- Indexes
CREATE UNIQUE INDEX "team_user_unique_idx" ON "team_users" USING btree ("teamId", "userId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "teams" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "isPrivate" boolean NOT NULL DEFAULT false,
    "deletedAt" timestamp without time zone,
    "ownerId" bigint NOT NULL
);

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "jobs"
    ADD CONSTRAINT "jobs_fk_0"
    FOREIGN KEY("teamId")
    REFERENCES "teams"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

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
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "team_users"
    ADD CONSTRAINT "team_users_fk_0"
    FOREIGN KEY("teamId")
    REFERENCES "teams"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "team_users"
    ADD CONSTRAINT "team_users_fk_1"
    FOREIGN KEY("userId")
    REFERENCES "serverpod_user_info"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "teams"
    ADD CONSTRAINT "teams_fk_0"
    FOREIGN KEY("ownerId")
    REFERENCES "serverpod_user_info"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR job_manager
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('job_manager', '20250316183320983', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250316183320983', "timestamp" = now();

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
