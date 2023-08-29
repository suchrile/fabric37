-- CreateEnum
CREATE TYPE "CategoryView" AS ENUM ('cards', 'table');

-- AlterTable
ALTER TABLE "categories" ADD COLUMN     "view" "CategoryView" NOT NULL DEFAULT 'cards';
