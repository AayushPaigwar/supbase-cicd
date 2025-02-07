
SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

CREATE EXTENSION IF NOT EXISTS "pg_net" WITH SCHEMA "extensions";

CREATE EXTENSION IF NOT EXISTS "pgsodium" WITH SCHEMA "pgsodium";

COMMENT ON SCHEMA "public" IS 'standard public schema';

CREATE EXTENSION IF NOT EXISTS "pg_graphql" WITH SCHEMA "graphql";

CREATE EXTENSION IF NOT EXISTS "pg_stat_statements" WITH SCHEMA "extensions";

CREATE EXTENSION IF NOT EXISTS "pgcrypto" WITH SCHEMA "extensions";

CREATE EXTENSION IF NOT EXISTS "pgjwt" WITH SCHEMA "extensions";

CREATE EXTENSION IF NOT EXISTS "supabase_vault" WITH SCHEMA "vault";

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA "extensions";

SET default_tablespace = '';

SET default_table_access_method = "heap";

CREATE TABLE IF NOT EXISTS "public"."faculty" (
    "id" bigint NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "name" "text",
    "email" "text",
    "password" "text",
    "department" "text",
    "category" "text"
);

ALTER TABLE "public"."faculty" OWNER TO "postgres";

ALTER TABLE "public"."faculty" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."deparment_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

CREATE TABLE IF NOT EXISTS "public"."feedback" (
    "id" bigint NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "student_id" bigint,
    "feedbacks" "jsonb",
    "question_id" "jsonb"
);

ALTER TABLE "public"."feedback" OWNER TO "postgres";

ALTER TABLE "public"."feedback" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."feedback_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

CREATE TABLE IF NOT EXISTS "public"."questions" (
    "id" bigint NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "question" "text",
    "options" "jsonb"
);

ALTER TABLE "public"."questions" OWNER TO "postgres";

ALTER TABLE "public"."questions" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."questions_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

CREATE TABLE IF NOT EXISTS "public"."student" (
    "id" bigint NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "name" "text",
    "email" "text",
    "password" "text",
    "category" "text",
    "department" "text"
);

ALTER TABLE "public"."student" OWNER TO "postgres";

ALTER TABLE "public"."student" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."student_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

ALTER TABLE ONLY "public"."faculty"
    ADD CONSTRAINT "deparment_pkey" PRIMARY KEY ("id");

ALTER TABLE ONLY "public"."feedback"
    ADD CONSTRAINT "feedback_pkey" PRIMARY KEY ("id");

ALTER TABLE ONLY "public"."questions"
    ADD CONSTRAINT "questions_pkey" PRIMARY KEY ("id");

ALTER TABLE ONLY "public"."student"
    ADD CONSTRAINT "student_pkey" PRIMARY KEY ("id");

ALTER TABLE ONLY "public"."feedback"
    ADD CONSTRAINT "public_feedback_student_id_fkey" FOREIGN KEY ("student_id") REFERENCES "public"."student"("id");

ALTER PUBLICATION "supabase_realtime" OWNER TO "postgres";

GRANT USAGE ON SCHEMA "public" TO "postgres";
GRANT USAGE ON SCHEMA "public" TO "anon";
GRANT USAGE ON SCHEMA "public" TO "authenticated";
GRANT USAGE ON SCHEMA "public" TO "service_role";

GRANT ALL ON TABLE "public"."faculty" TO "anon";
GRANT ALL ON TABLE "public"."faculty" TO "authenticated";
GRANT ALL ON TABLE "public"."faculty" TO "service_role";

GRANT ALL ON SEQUENCE "public"."deparment_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."deparment_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."deparment_id_seq" TO "service_role";

GRANT ALL ON TABLE "public"."feedback" TO "anon";
GRANT ALL ON TABLE "public"."feedback" TO "authenticated";
GRANT ALL ON TABLE "public"."feedback" TO "service_role";

GRANT ALL ON SEQUENCE "public"."feedback_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."feedback_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."feedback_id_seq" TO "service_role";

GRANT ALL ON TABLE "public"."questions" TO "anon";
GRANT ALL ON TABLE "public"."questions" TO "authenticated";
GRANT ALL ON TABLE "public"."questions" TO "service_role";

GRANT ALL ON SEQUENCE "public"."questions_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."questions_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."questions_id_seq" TO "service_role";

GRANT ALL ON TABLE "public"."student" TO "anon";
GRANT ALL ON TABLE "public"."student" TO "authenticated";
GRANT ALL ON TABLE "public"."student" TO "service_role";

GRANT ALL ON SEQUENCE "public"."student_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."student_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."student_id_seq" TO "service_role";

ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES  TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES  TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES  TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES  TO "service_role";

ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS  TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS  TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS  TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS  TO "service_role";

ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES  TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES  TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES  TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES  TO "service_role";

RESET ALL;
