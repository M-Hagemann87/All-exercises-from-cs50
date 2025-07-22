CREATE INDEX "students_id"
ON "students"("id");

CREATE INDEX "courses_id_number"
ON "courses"("id", "number");

CREATE INDEX "enrollments_course_id"
ON "enrollments"("course_id");

CREATE INDEX "satisfies_requirement_course_id"
ON "satisfies"("requirement_id", "course_id");

CREATE INDEX "enrollments_student_id"
ON "enrollments"("student_id");
