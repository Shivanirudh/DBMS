REM ****** CUSTOMER (cust_id , cust_name, address, phone, cust_friend)
REM ****** PIZZA (pizza_id, pizza_type, unit_price)
REM ****** ORDERS (order_no, cust_id, order_date ,delv_date, total_amt)
REM ****** ORDER_LIST (order_no, pizza_id, qty)

REM ****** @Z:/A5/pizza.sql

REM ****** 1. Check whether the given pizza type is available. If not display appropriate message.

DECLARE
	pitype VARCHAR2(20);
	ptype VARCHAR2(20);
	
BEGIN
	pitype := '&pitype';
	
	SELECT pizza_type INTO ptype FROM pizza	WHERE pizza_type= pitype;

	IF SQL%FOUND THEN 
		dbms_output.put_line(pitype || ' is currently available. ');
	END IF;	
	
	EXCEPTION 
		WHEN NO_DATA_FOUND THEN
			dbms_output.put_line(pitype || ' is currently unavailable. ');
	END;
/
REM ****** @Z:/A5/pizza_plsql1.sql