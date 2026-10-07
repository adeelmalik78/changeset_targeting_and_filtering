--liquibase formatted sql

--changeset amalik:customer labels:customer context:dev,qa,prod teams:blue releases:1.0 keywords:customer conditions:prebuild
CREATE TABLE public.customer_data (
	customerid serial4 NOT NULL,
	personid int4 NULL,
	storeid int4 NULL,
	territoryid int4 NULL,
	rowguid uuid DEFAULT uuid_generate_v1() NOT NULL,
	modifieddate timestamp DEFAULT now() NOT NULL,
	CONSTRAINT "PK_Customer_CustomerID" PRIMARY KEY (customerid)
);
-- rollback DROP TABLE public.customer_data;

-- -- public.customer foreign keys

-- ALTER TABLE public.customer ADD CONSTRAINT "FK_Customer_Person_PersonID" FOREIGN KEY (personid) REFERENCES person.person(businessentityid);
-- ALTER TABLE public.customer ADD CONSTRAINT "FK_Customer_SalesTerritory_TerritoryID" FOREIGN KEY (territoryid) REFERENCES public.salesterritory(territoryid);
-- ALTER TABLE public.customer ADD CONSTRAINT "FK_Customer_Store_StoreID" FOREIGN KEY (storeid) REFERENCES public.store(businessentityid);