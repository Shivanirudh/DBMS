REM ****** CUSTOMER (cust_id , cust_name, address, phone, cust_friend)
REM ****** PIZZA (pizza_id, pizza_type, unit_price)
REM ****** ORDERS (order_no, cust_id, order_date ,delv_date, total_amt)
REM ****** ORDER_LIST (order_no, pizza_id, qty)

REM ****** 1. Check whether the given pizza type is available. If not display appropriate message.

DECLARE
	pizza_rec pizza%ROWTYPE
	CURSOR pizza_type_csr IS
		SELECT *
		FROM pizza
		WHERE pizza_type= type;
BEGIN
	type := '&type';
	OPEN pizza_type_csr;

	FETCH pizza_type_csr INTO pizza_rec;

	IF(pizza_type_csr%NOTFOUND) THEN 
		dbms_output.put_line('Pizza type '||type||' is currently unavailable. ');
	ELSE
		dbms_output.put_line('Pizza type '||type||' is currently unavailable. ');
	ENDIF;	
	
	CLOSE pizza_type_csr;
END;

REM *****************************************************************************************************************************
REM *****************************************************************************************************************************

REM ****** 2. For the given customer name and a range of order date, find whether a customer had placed any order, if so display
REM ****** the number of orders placed by the customer along with the order number(s).

DECLARE 
	order_id ORDERS.order_no%TYPE;
	count integer(5);
	CURSOR cust_order IS
		SELECT order_no,COUNT(*) AS "NUMBER OF ORDERS"
		FROM customer c JOIN orders o ON c.cust_id=o_cust_id
		WHERE c.cust_name LIKE name 
		  AND o.order_date >= start_date AND o.order_date <= end_date;

BEGIN
	name='&name';
	start_date='&start_date';
	end_date='&end_date';

	FOR cust_rec IN cust_order LOOP
		IF (cust_order%ROWCOUNT = 0) THEN EXIT; ENDIF;

		dbms_output.put_line(cust_rec.order_no||' '||cust_rec.COUNT(*));
	END LOOP;
END;


REM *****************************************************************************************************************************
REM *****************************************************************************************************************************

REM ****** 3. Display the customer name along with the details of pizza type and its quantity ordered for the given order number.
REM ****** Also find the total quantity ordered for the given order number as shown below:

DECLARE
	no_of_orders NUMBER(3);
    order_id CHAR(5);
    c_name customer.cust_name % TYPE;
    p_type pizza.pizza_type % TYPE;
    qty order_list.qty % TYPE;
    
    CURSOR order_details IS
		SELECT pizza_type, qty
		FROM pizza, order_list
		WHERE order_no = order_id
        AND pizza.pizza_id = order_list.pizza_id;
    
    CURSOR person_details IS
        SELECT cust_name
        FROM customer, orders
        WHERE orders.cust_id = customer.cust_id
        AND orders.order_no = order_id;

BEGIN
	order_id := '&order_id';
    
    OPEN person_details;
    OPEN order_details;
    
    FETCH person_details INTO c_name;
    FETCH order_details INTO p_type, qty;
    
	IF person_details%FOUND = False THEN
		DBMS_OUTPUT.PUT_LINE('Specified order does not exist.');
	ELSE
        DBMS_OUTPUT.PUT_LINE('Customer Name: '||c_name||'.');
        DBMS_OUTPUT.PUT_LINE('Has ordered the following Pizza: ');
        DBMS_OUTPUT.PUT_LINE(RPAD('PIZZA TYPE', 13)||RPAD('QTY.', 4));
        WHILE order_details%FOUND LOOP
            DBMS_OUTPUT.PUT_LINE(RPAD(p_type, 13)||RPAD(qty, 4));
            FETCH order_details INTO p_type, qty;
        END LOOP;
        
	END IF;

	CLOSE person_details;
	CLOSE order_details;
END;
/

REM 4. Display the total number of orders that contains one pizza type, two pizza type and 
REM so on.

DECLARE
	ptype_count NUMBER(3);
    counter NUMBER(3);
    max_count NUMBER(4);
    order_no orders.order_no % TYPE;
    
    CURSOR total_types IS
		SELECT COUNT(DISTINCT pizza_type)
		FROM pizza;
    
    CURSOR type_counter IS
        SELECT order_no
        FROM order_list
        GROUP BY order_no
        HAVING COUNT(order_no) = counter;

BEGIN
	counter := 0;
    OPEN total_types;
    
    FETCH total_types INTO max_count;
    
	IF max_count = 0 THEN
		DBMS_OUTPUT.PUT_LINE('Table: Pizza is Empty.');
	ELSE
        DBMS_OUTPUT.PUT_LINE('Number of Orders that contain: ');
        FOR COUNT IN 1..max_count LOOP
            ptype_count := 0;
            counter := counter + 1;
            OPEN type_counter;
            FETCH type_counter INTO order_no;
            WHILE type_counter%FOUND LOOP
                ptype_count := ptype_count + 1;
                FETCH type_counter INTO order_no;
            END LOOP;
            CLOSE type_counter;
            
            DBMS_OUTPUT.PUT_LINE(counter||' Pizza Type(s): '||ptype_count);
        END LOOP;
	END IF;

    CLOSE total_types;
END;