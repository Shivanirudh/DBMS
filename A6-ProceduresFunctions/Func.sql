REM ****** 1. Write a stored function to display the total number of pizza's ordered by the given order number. 

CREATE OR REPLACE FUNCTION no_order (order_id IN VARCHAR2(10)) RETURNS  NUMBER(3) IS
	
	no_of_orders NUMBER(3);
	ptype pizza.pizza_type%TYPE;
	qty NUMBER(3);
    
	CURSOR order_details IS
		SELECT pizza_type,qty
		FROM pizza p JOIN order_list ol ON p.pizza_id = ol.pizza_id 
		WHERE ol.order_no = order_id;

BEGIN
    	no_of_orders:=0;
    	OPEN order_details;
    
    	FETCH order_details INTO ptype,qty;
    
	IF order_details%FOUND = False THEN
		dbms_output.put_line('Specified order does not exist.');
	ELSE
		WHILE order_details%FOUND LOOP
			no_of_orders:=no_of_orders+qty;
            		FETCH order_details INTO p_type, qty;
        	END LOOP;
	END IF;

	CLOSE order_details;
	RETURN no_of_orders;
END;

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
REM ****** @Z:/A6/Proc.sql

	 