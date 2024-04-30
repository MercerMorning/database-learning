CREATE ROLE full_privileges_role WITH SUPERUSER LOGIN PASSWORD 'secret';
CREATE USER full_privileges_user WITH PASSWORD 'secret' IN ROLE full_privileges_role;