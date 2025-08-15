-- CreateTable
CREATE TABLE "public"."User" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updateAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."barbershop" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "address" TEXT NOT NULL,
    "phones" TEXT[],
    "description" TEXT NOT NULL,
    "imageUrl" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updateAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "barbershop_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."barbershopService" (
    "id" SERIAL NOT NULL,
    "barbershopId" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "imageUrl" TEXT NOT NULL,
    "price" DECIMAL(10,2) NOT NULL,

    CONSTRAINT "barbershopService_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."booking" (
    "id" SERIAL NOT NULL,
    "userId" INTEGER NOT NULL,
    "serviceId" INTEGER NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updateAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "booking_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "public"."barbershopService" ADD CONSTRAINT "barbershopService_barbershopId_fkey" FOREIGN KEY ("barbershopId") REFERENCES "public"."barbershop"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."booking" ADD CONSTRAINT "booking_userId_fkey" FOREIGN KEY ("userId") REFERENCES "public"."User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."booking" ADD CONSTRAINT "booking_serviceId_fkey" FOREIGN KEY ("serviceId") REFERENCES "public"."barbershopService"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
