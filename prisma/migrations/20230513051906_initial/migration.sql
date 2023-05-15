-- CreateEnum
CREATE TYPE "ProductAttributeDataType" AS ENUM ('string', 'integer', 'float', 'boolean', 'date', 'select');

-- CreateTable
CREATE TABLE "users" (
    "id" SERIAL NOT NULL,
    "username" TEXT NOT NULL,
    "password" TEXT NOT NULL,

    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "refresh_tokens" (
    "id" SERIAL NOT NULL,
    "user_id" INTEGER NOT NULL,
    "token" TEXT NOT NULL,

    CONSTRAINT "refresh_tokens_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "links" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "newTab" BOOLEAN NOT NULL DEFAULT false,
    "sort_order" SERIAL NOT NULL,

    CONSTRAINT "links_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "pages" (
    "id" SERIAL NOT NULL,
    "slug" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "content" TEXT NOT NULL DEFAULT '',
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "pages_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "categories" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "parent_id" INTEGER,
    "slug" TEXT NOT NULL,

    CONSTRAINT "categories_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "products" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "description" TEXT,
    "hidden" BOOLEAN NOT NULL DEFAULT false,
    "slug" TEXT NOT NULL,

    CONSTRAINT "products_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "products_images" (
    "id" SERIAL NOT NULL,
    "product_id" INTEGER NOT NULL,
    "public_id" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "is_primary" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "products_images_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "products_attributes" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "data_type" "ProductAttributeDataType" NOT NULL,
    "unit" TEXT,
    "show_in_catalog" BOOLEAN NOT NULL DEFAULT false,
    "sortable" BOOLEAN NOT NULL DEFAULT false,
    "filterable" BOOLEAN NOT NULL DEFAULT false,
    "required" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "products_attributes_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "products_attributes_values" (
    "id" SERIAL NOT NULL,
    "product_id" INTEGER NOT NULL,
    "attribute_id" INTEGER NOT NULL,

    CONSTRAINT "products_attributes_values_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "products_attributes_string_values" (
    "id" SERIAL NOT NULL,
    "attribute_value_id" INTEGER NOT NULL,
    "value" TEXT NOT NULL,

    CONSTRAINT "products_attributes_string_values_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "products_attributes_integer_values" (
    "id" SERIAL NOT NULL,
    "attribute_value_id" INTEGER NOT NULL,
    "value" INTEGER NOT NULL,

    CONSTRAINT "products_attributes_integer_values_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "products_attributes_float_values" (
    "id" SERIAL NOT NULL,
    "attribute_value_id" INTEGER NOT NULL,
    "value" DOUBLE PRECISION NOT NULL,

    CONSTRAINT "products_attributes_float_values_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "products_attributes_boolean_values" (
    "id" SERIAL NOT NULL,
    "attribute_value_id" INTEGER NOT NULL,
    "value" BOOLEAN NOT NULL,

    CONSTRAINT "products_attributes_boolean_values_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "products_attributes_date_values" (
    "id" SERIAL NOT NULL,
    "attribute_value_id" INTEGER NOT NULL,
    "value" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "products_attributes_date_values_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "products_attributes_select_values" (
    "attribute_value_id" INTEGER NOT NULL,
    "option_id" INTEGER NOT NULL,

    CONSTRAINT "products_attributes_select_values_pkey" PRIMARY KEY ("attribute_value_id","option_id")
);

-- CreateTable
CREATE TABLE "products_attributes_select_options" (
    "id" SERIAL NOT NULL,
    "attribute_id" INTEGER NOT NULL,
    "label" TEXT NOT NULL,

    CONSTRAINT "products_attributes_select_options_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_CategoryToProduct" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "users_username_key" ON "users"("username");

-- CreateIndex
CREATE UNIQUE INDEX "refresh_tokens_token_key" ON "refresh_tokens"("token");

-- CreateIndex
CREATE UNIQUE INDEX "pages_slug_key" ON "pages"("slug");

-- CreateIndex
CREATE INDEX "pages_slug_idx" ON "pages"("slug");

-- CreateIndex
CREATE UNIQUE INDEX "categories_name_key" ON "categories"("name");

-- CreateIndex
CREATE UNIQUE INDEX "categories_slug_key" ON "categories"("slug");

-- CreateIndex
CREATE INDEX "categories_slug_idx" ON "categories"("slug");

-- CreateIndex
CREATE UNIQUE INDEX "products_name_key" ON "products"("name");

-- CreateIndex
CREATE UNIQUE INDEX "products_code_key" ON "products"("code");

-- CreateIndex
CREATE UNIQUE INDEX "products_slug_key" ON "products"("slug");

-- CreateIndex
CREATE UNIQUE INDEX "products_attributes_values_product_id_attribute_id_key" ON "products_attributes_values"("product_id", "attribute_id");

-- CreateIndex
CREATE UNIQUE INDEX "products_attributes_string_values_attribute_value_id_key" ON "products_attributes_string_values"("attribute_value_id");

-- CreateIndex
CREATE UNIQUE INDEX "products_attributes_integer_values_attribute_value_id_key" ON "products_attributes_integer_values"("attribute_value_id");

-- CreateIndex
CREATE UNIQUE INDEX "products_attributes_float_values_attribute_value_id_key" ON "products_attributes_float_values"("attribute_value_id");

-- CreateIndex
CREATE UNIQUE INDEX "products_attributes_boolean_values_attribute_value_id_key" ON "products_attributes_boolean_values"("attribute_value_id");

-- CreateIndex
CREATE UNIQUE INDEX "products_attributes_date_values_attribute_value_id_key" ON "products_attributes_date_values"("attribute_value_id");

-- CreateIndex
CREATE UNIQUE INDEX "products_attributes_select_options_attribute_id_label_key" ON "products_attributes_select_options"("attribute_id", "label");

-- CreateIndex
CREATE UNIQUE INDEX "_CategoryToProduct_AB_unique" ON "_CategoryToProduct"("A", "B");

-- CreateIndex
CREATE INDEX "_CategoryToProduct_B_index" ON "_CategoryToProduct"("B");

-- AddForeignKey
ALTER TABLE "refresh_tokens" ADD CONSTRAINT "refresh_tokens_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "categories" ADD CONSTRAINT "categories_parent_id_fkey" FOREIGN KEY ("parent_id") REFERENCES "categories"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "products_images" ADD CONSTRAINT "products_images_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "products"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "products_attributes_values" ADD CONSTRAINT "products_attributes_values_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "products"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "products_attributes_values" ADD CONSTRAINT "products_attributes_values_attribute_id_fkey" FOREIGN KEY ("attribute_id") REFERENCES "products_attributes"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "products_attributes_string_values" ADD CONSTRAINT "products_attributes_string_values_attribute_value_id_fkey" FOREIGN KEY ("attribute_value_id") REFERENCES "products_attributes_values"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "products_attributes_integer_values" ADD CONSTRAINT "products_attributes_integer_values_attribute_value_id_fkey" FOREIGN KEY ("attribute_value_id") REFERENCES "products_attributes_values"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "products_attributes_float_values" ADD CONSTRAINT "products_attributes_float_values_attribute_value_id_fkey" FOREIGN KEY ("attribute_value_id") REFERENCES "products_attributes_values"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "products_attributes_boolean_values" ADD CONSTRAINT "products_attributes_boolean_values_attribute_value_id_fkey" FOREIGN KEY ("attribute_value_id") REFERENCES "products_attributes_values"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "products_attributes_date_values" ADD CONSTRAINT "products_attributes_date_values_attribute_value_id_fkey" FOREIGN KEY ("attribute_value_id") REFERENCES "products_attributes_values"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "products_attributes_select_values" ADD CONSTRAINT "products_attributes_select_values_option_id_fkey" FOREIGN KEY ("option_id") REFERENCES "products_attributes_select_options"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "products_attributes_select_values" ADD CONSTRAINT "products_attributes_select_values_attribute_value_id_fkey" FOREIGN KEY ("attribute_value_id") REFERENCES "products_attributes_values"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "products_attributes_select_options" ADD CONSTRAINT "products_attributes_select_options_attribute_id_fkey" FOREIGN KEY ("attribute_id") REFERENCES "products_attributes"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CategoryToProduct" ADD CONSTRAINT "_CategoryToProduct_A_fkey" FOREIGN KEY ("A") REFERENCES "categories"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CategoryToProduct" ADD CONSTRAINT "_CategoryToProduct_B_fkey" FOREIGN KEY ("B") REFERENCES "products"("id") ON DELETE CASCADE ON UPDATE CASCADE;
