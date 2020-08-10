CREATE TABLE "users" (
	"id" serial NOT NULL,
	"username" varchar(255) NOT NULL UNIQUE,
	"password" varchar(100) NOT NULL,
	CONSTRAINT "users_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "books" (
	"id" serial NOT NULL,
	"user_id" integer NOT NULL,
	"data" TEXT NOT NULL,
	CONSTRAINT "books_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "book_user" (
	"id" serial NOT NULL,
	"book_id" integer NOT NULL,
	"user_id" integer NOT NULL,
	CONSTRAINT "book_user_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);

ALTER TABLE "books" ADD CONSTRAINT "books_fk0" FOREIGN KEY ("user_id") REFERENCES "users"("id");

ALTER TABLE "book_user" ADD CONSTRAINT "book_user_fk0" FOREIGN KEY ("book_id") REFERENCES "books"("id");
ALTER TABLE "book_user" ADD CONSTRAINT "book_user_fk1" FOREIGN KEY ("user_id") REFERENCES "users"("id");
