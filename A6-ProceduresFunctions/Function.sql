REM customer(cust_id, cust_name, address, phone)
REM pizza (pizza_id, pizza_type, unit_price)
REM orders(order_no, cust_id, order_date ,delv_date, total_amt)
REM order_list(order_no, pizza_id, qty)
REM ****** 1. Write a stored function to display the total number of pizza's ordered by the given order number. 

CREATE OR REPLACE FUNCTION no_order 
	(order_id IN VARCHAR2) 
	RETURN  NUMBER IS
	
	no_of_orders NUMBER(3);
	qty NUMBER(3);
    
	CURSOR order_details IS
		SELECT ol.qty
		FROM order_list ol 
		WHERE ol.order_no = order_id;

BEGIN
    	no_of_orders:=0;
    	OPEN order_details;
    
    	FETCH order_details INTO qty;
    
	IF order_details%FOUND THEN
		WHILE order_details%FOUND LOOP
			no_of_orders:=no_of_orders+qty;
            		FETCH order_details INTO qty;
        	END LOOP;
	ELSE
		dbms_output.put_line('Specified order does not exist.');
	END IF;

	CLOSE order_details;
	RETURN no_of_orders;
END;
/

DECLARE
	order_id VARCHAR2(10);
	qty NUMBER(3);
	
BEGIN
	qty:=0;
	order_id := '&order_id';
	qty:=no_order(order_id);
	dbms_output.put_line(order_id ||' has '||qty||' pizzas');
END;

/
