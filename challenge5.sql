SELECT *
FROM dataset_final_project_kn_de dfpkd;

SELECT *
FROM dataset_final_project_kn_de dfpkd
WHERE (purchase_amount < 100) 
	OR (order_date) <= '2022-08-25'
	AND customer_id::integer < 2001;
