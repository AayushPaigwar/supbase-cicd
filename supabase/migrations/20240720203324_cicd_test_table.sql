create table "public"."cicd_test" (
    "id" bigint generated by default as identity not null,
    "created_at" timestamp with time zone not null default now(),
    "cicd_test" text
);


alter table "public"."cicd_test" disable row level security;

CREATE UNIQUE INDEX cicd_test_pkey ON public.cicd_test USING btree (id);

alter table "public"."cicd_test" add constraint "cicd_test_pkey" PRIMARY KEY using index "cicd_test_pkey";

grant delete on table "public"."cicd_test" to "anon";

grant insert on table "public"."cicd_test" to "anon";

grant references on table "public"."cicd_test" to "anon";

grant select on table "public"."cicd_test" to "anon";

grant trigger on table "public"."cicd_test" to "anon";

grant truncate on table "public"."cicd_test" to "anon";

grant update on table "public"."cicd_test" to "anon";

grant delete on table "public"."cicd_test" to "authenticated";

grant insert on table "public"."cicd_test" to "authenticated";

grant references on table "public"."cicd_test" to "authenticated";

grant select on table "public"."cicd_test" to "authenticated";

grant trigger on table "public"."cicd_test" to "authenticated";

grant truncate on table "public"."cicd_test" to "authenticated";

grant update on table "public"."cicd_test" to "authenticated";

grant delete on table "public"."cicd_test" to "service_role";

grant insert on table "public"."cicd_test" to "service_role";

grant references on table "public"."cicd_test" to "service_role";

grant select on table "public"."cicd_test" to "service_role";

grant trigger on table "public"."cicd_test" to "service_role";

grant truncate on table "public"."cicd_test" to "service_role";

grant update on table "public"."cicd_test" to "service_role";