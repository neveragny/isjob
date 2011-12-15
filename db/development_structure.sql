CREATE TABLE "companies" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "user_id" varchar(255), "name" varchar(255), "address" varchar(255), "sphere_id" integer, "info" varchar(255), "city" varchar(255), "url" varchar(255), "contact_person_name" varchar(255), "contact_person_phone" varchar(255), "contact_person_position" varchar(255), "contact_person_role" varchar(255), "created_at" datetime, "updated_at" datetime);
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "email" varchar(255) DEFAULT '' NOT NULL, "encrypted_password" varchar(128) DEFAULT '' NOT NULL, "reset_password_token" varchar(255), "reset_password_sent_at" datetime, "remember_created_at" datetime, "sign_in_count" integer DEFAULT 0, "current_sign_in_at" datetime, "last_sign_in_at" datetime, "current_sign_in_ip" varchar(255), "last_sign_in_ip" varchar(255), "created_at" datetime, "updated_at" datetime, "name" varchar(255), "sex" integer, "uid" varchar(255), "provider" varchar(255), "username" varchar(255), "company_id" integer DEFAULT 0);
CREATE UNIQUE INDEX "index_users_on_email" ON "users" ("email");
CREATE UNIQUE INDEX "index_users_on_reset_password_token" ON "users" ("reset_password_token");
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
INSERT INTO schema_migrations (version) VALUES ('20111212022720');

INSERT INTO schema_migrations (version) VALUES ('20111212022725');

INSERT INTO schema_migrations (version) VALUES ('20111213014228');

INSERT INTO schema_migrations (version) VALUES ('20111213064952');

INSERT INTO schema_migrations (version) VALUES ('20111213065353');