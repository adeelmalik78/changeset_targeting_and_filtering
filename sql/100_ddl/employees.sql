CREATE TABLE public.employees_data (
	employeeid serial4 NOT NULL,
	personid int4 NULL,
	storeid int4 NULL,
	territoryid int4 NULL,
	rowguid uuid DEFAULT uuid_generate_v1() NOT NULL,
	modifieddate timestamp DEFAULT now() NOT NULL,
	CONSTRAINT "PK_Employees_EmployeeID" PRIMARY KEY (employeeid)
);

GRANT SELECT, INSERT, UPDATE, DELETE ON public.employees_data TO some_user;