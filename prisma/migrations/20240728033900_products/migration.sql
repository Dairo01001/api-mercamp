-- AlterTable
ALTER TABLE "User" ADD COLUMN     "phone" TEXT;

-- CreateTable
CREATE TABLE "Product" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "image" TEXT NOT NULL,
    "description" TEXT NOT NULL,

    CONSTRAINT "Product_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UnitTypes" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "UnitTypes_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SellerPrices" (
    "id" TEXT NOT NULL,
    "price" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "unitId" TEXT NOT NULL,
    "sellerId" TEXT NOT NULL,
    "productId" TEXT NOT NULL,

    CONSTRAINT "SellerPrices_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ProductBids" (
    "id" TEXT NOT NULL,
    "amount" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "unitId" TEXT NOT NULL,
    "productId" TEXT NOT NULL,
    "buyerId" TEXT NOT NULL,

    CONSTRAINT "ProductBids_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PriceBids" (
    "id" TEXT NOT NULL,
    "amount" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "priceId" TEXT NOT NULL,
    "bidId" TEXT NOT NULL,

    CONSTRAINT "PriceBids_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "UnitTypes_name_key" ON "UnitTypes"("name");

-- AddForeignKey
ALTER TABLE "SellerPrices" ADD CONSTRAINT "SellerPrices_unitId_fkey" FOREIGN KEY ("unitId") REFERENCES "UnitTypes"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SellerPrices" ADD CONSTRAINT "SellerPrices_sellerId_fkey" FOREIGN KEY ("sellerId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SellerPrices" ADD CONSTRAINT "SellerPrices_productId_fkey" FOREIGN KEY ("productId") REFERENCES "Product"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProductBids" ADD CONSTRAINT "ProductBids_unitId_fkey" FOREIGN KEY ("unitId") REFERENCES "UnitTypes"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProductBids" ADD CONSTRAINT "ProductBids_productId_fkey" FOREIGN KEY ("productId") REFERENCES "Product"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProductBids" ADD CONSTRAINT "ProductBids_buyerId_fkey" FOREIGN KEY ("buyerId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PriceBids" ADD CONSTRAINT "PriceBids_priceId_fkey" FOREIGN KEY ("priceId") REFERENCES "SellerPrices"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PriceBids" ADD CONSTRAINT "PriceBids_bidId_fkey" FOREIGN KEY ("bidId") REFERENCES "ProductBids"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
