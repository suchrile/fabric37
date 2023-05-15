-- CreateTable
CREATE TABLE "objects" (
    "id" SERIAL NOT NULL,
    "data" JSONB NOT NULL,

    CONSTRAINT "objects_pkey" PRIMARY KEY ("id")
);
