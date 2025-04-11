BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "changelog" (
    "id" bigserial PRIMARY KEY,
    "version" text NOT NULL,
    "details" text NOT NULL,
    "datetime" bigint NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "server_config" (
    "id" bigserial PRIMARY KEY,
    "key" text NOT NULL,
    "value" text NOT NULL,
    "userId" bigint NOT NULL
);

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "server_config"
    ADD CONSTRAINT "server_config_fk_0"
    FOREIGN KEY("userId")
    REFERENCES "serverpod_user_info"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR job_manager
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('job_manager', '20250410175054180', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250410175054180', "timestamp" = now();

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
