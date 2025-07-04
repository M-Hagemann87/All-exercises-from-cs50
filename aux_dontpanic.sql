SELECT * FROM "users"
WHERE "username" = 'admin';

oops! =
"MD5 Hash" = 982c0381c279d139fd221fce974916e7
"SHA1 Hash" = 0ebffe9b3231e90fdabad2ec5c9916151baf0492
------

UPDATE "users" SET "password" = '982c0381c279d139fd221fce974916e7'
WHERE "username" = 'admin';

---current password: e10adc3949ba59abbe56e057f20f883e
---------------------------
SELECT * FROM "user_logs";

DELETE FROM "user_logs" WHERE "new_password" = '982c0381c279d139fd221fce974916e7';
--------------------------
SELECT * FROM "user_logs"
WHERE "new_username" = 'emily33';
--- 44bf025d27eea66336e5c1133c3827f7

INSERT INTO "user_logs" ("type", "old_username", "new_username", "old_password", "new_password")
VALUES ('update', 'admin', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '44bf025d27eea66336e5c1133c3827f7');

-------------------------



44bf025d27eea66336e5c1133c3827f7
