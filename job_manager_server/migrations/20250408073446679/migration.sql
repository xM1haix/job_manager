BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "jobs" DROP COLUMN "deletedAt";
--
-- ACTION DROP TABLE
--
DROP TABLE "roles" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "roles" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "teamId" bigint NOT NULL,
    "userId" bigint NOT NULL,
    "jobCreate" boolean NOT NULL,
    "jobRead" boolean NOT NULL,
    "jobUpdate" boolean NOT NULL,
    "jobDelete" boolean NOT NULL,
    "stageCreate" boolean NOT NULL,
    "stageRead" boolean NOT NULL,
    "stageUpdate" boolean NOT NULL,
    "stageDelete" boolean NOT NULL,
    "teamUpdate" boolean NOT NULL,
    "teamDelete" boolean NOT NULL,
    "roleCreate" boolean NOT NULL,
    "roleRead" boolean NOT NULL,
    "roleUpdate" boolean NOT NULL,
    "roleDelete" boolean NOT NULL,
    "teamUserCreate" boolean NOT NULL,
    "teamUserRead" boolean NOT NULL,
    "teamUserUpdate" boolean NOT NULL,
    "teamUserDelete" boolean NOT NULL
);

--
-- ACTION ALTER TABLE
--
ALTER TABLE "stages" DROP COLUMN "deletedAt";
--
-- ACTION DROP TABLE
--
DROP TABLE "team_users" CASCADE;

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
-- ACTION ALTER TABLE
--
ALTER TABLE "teams" DROP COLUMN "deletedAt";
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
    VALUES ('job_manager', '20250408073446679', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250408073446679', "timestamp" = now();

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
