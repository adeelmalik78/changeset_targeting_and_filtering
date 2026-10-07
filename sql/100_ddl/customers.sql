CREATE TABLE public.customer_data (
	customerid serial4 NOT NULL,
	personid int4 NULL,
	storeid int4 NULL,
	territoryid int4 NULL,
	rowguid uuid DEFAULT uuid_generate_v1() NOT NULL,
	modifieddate timestamp DEFAULT now() NOT NULL,
	CONSTRAINT "PK_Customer_CustomerID" PRIMARY KEY (customerid)
);

GRANT SELECT, INSERT, UPDATE, DELETE ON public.customer_data TO some_user;