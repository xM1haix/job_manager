BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "jobs" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "status" boolean,
    "teamId" bigint NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "roles" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "teamId" bigint NOT NULL,
    "jobCreate" boolean NOT NULL DEFAULT false,
    "jobRead" boolean NOT NULL DEFAULT false,
    "jobUpdate" boolean NOT NULL DEFAULT false,
    "jobDelete" boolean NOT NULL DEFAULT false,
    "stageCreate" boolean NOT NULL DEFAULT false,
    "stageRead" boolean NOT NULL DEFAULT false,
    "stageUpdate" boolean NOT NULL DEFAULT false,
    "stageDelete" boolean NOT NULL DEFAULT false,
    "stageProgressUpdate" boolean NOT NULL DEFAULT false,
    "teamUpdate" boolean NOT NULL DEFAULT false,
    "teamDelete" boolean NOT NULL DEFAULT false,
    "roleCreate" boolean NOT NULL DEFAULT false,
    "roleRead" boolean NOT NULL DEFAULT false,
    "roleUpdate" boolean NOT NULL DEFAULT false,
    "roleDelete" boolean NOT NULL DEFAULT false,
    "teamUserCreate" boolean NOT NULL DEFAULT false,
    "teamUserRead" boolean NOT NULL DEFAULT false,
    "teamUserUpdate" boolean NOT NULL DEFAULT false,
    "teamUserDelete" boolean NOT NULL DEFAULT false
);

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
-- ACTION CREATE TABLE
--
CREATE TABLE "team_users" (
    "id" bigserial PRIMARY KEY,
    "teamId" bigint NOT NULL,
    "userId" bigint NOT NULL,
    "roleId" bigint NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "team_user_unique_idx" ON "team_users" USING btree ("teamId", "userId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "teams" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL
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
ALTER TABLE ONLY "roles"
    ADD CONSTRAINT "roles_fk_0"
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
ALTER TABLE ONLY "team_users"
    ADD CONSTRAINT "team_users_fk_2"
    FOREIGN KEY("roleId")
    REFERENCES "roles"("id")
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


COMMIT;
