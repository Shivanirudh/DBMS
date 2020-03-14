REM ****** 2. For the given customer name and a range of order date, find whether a customer had placed any order, if so display
REM ****** the number of orders placed by the customer along with the order number(s).

DECLARE 
	name customer.cust_name%TYPE;
	start_date orders.order_date%TYPE;
	end_date orders.order_date%TYPE;
	order_id ORDERS.order_no%TYPE;
	count integer(5);
	CURSOR cust_order IS
		SELECT order_no
		FROM customer c JOIN orders o ON c.cust_id=o.cust_id
		WHERE c.cust_name LIKE name 
		  AND o.order_date BETWEEN start_date AND end_date;

BEGIN
	name:='&name';
	start_date:='&start_date';
	end_date:='&end_date';

	OPEN cust_order;
	FETCH cust_order into order_id;
	 
		IF cust_order%NOTFOUND THEN 
			dbms_output.put_line(name||' has not made any orders in this period');
		ELSE
			dbms_output.put_line('ORDERS:');
			WHILE cust_order%FOUND LOOP
				dbms_output.put_line(order_id);
				FETCH cust_order into order_id;
			END LOOP;
			dbms_output.put_line(name||' has done '||cust_order%ROWCOUNT||' orders in this period');
			
		END IF;
	CLOSE cust_order;
	
	
END;
/

REM ****** @Z:/A5/pizza_plsql2.sql