--Task 2
-- Yearly Active User

Alter table orders_dataset
alter column order_purchase_timestamp type timestamp Using order_purchase_timestamp:: timestamp

select * from orders_dataset

select 
	active_customer,
	year
from(
	select
		date_part('year', od.order_purchase_timestamp ) as year,
		count(distinct cd.customer_unique_id) as active_customer
	from orders_dataset as od
	join customers_dataset as cd
		on od.customer_id = cd.customer_id
	group by 1
	) subq
group by 1,2;


================
--Mini Project 1
--Task 2 Menampilkan jumlah customer baru pada masing-masing tahun 
--(Hint: Pelanggan baru adalah pelanggan yang melakukan order pertama kali)

select
	(select
		cd.customer_unique_id,
		min(od.order_purchase_timestamp) as first_order

		from customers_dataset as cd
		join orders_dataset as od
			on cd.customer_id = od.customer_id
		group by 1;
)


============

--Task 3
--Menampilkan jumlah customer yang melakukan pembelian lebih dari satu kali (repeat order) pada masing-masing tahun 
--(Hint: Pelanggan yang melakukan repeat order adalah pelanggan yang melakukan order lebih dari 1 kali)

select 
	customer,
	purchasing_ammount
from	
	(
	select 
		distinct(cd.customer_unique_id) as customer,
		count(od.order_id) as purchasing_ammount
	from customers_dataset as cd
	join orders_dataset as od
		on cd.customer_id = od.customer_id
	group by 1)subq
where purchasing_ammount >1	
group by 1,2;

=========================================================
--Task 4
--Menampilkan rata-rata jumlah order yang dilakukan customer untuk masing-masing tahun
--(Hint: Hitung frekuensi order (berapa kali order) untuk masing-masing customer terlebih dahulu)

select customer,
	   jumlah_order,
	   year
from (
	select 
		distinct(cd.customer_unique_id) as customer,
		count(od.order_id) as jumlah_order,
		date_part('year', od.order_purchase_timestamp ) as year
	from orders_dataset as od 
	join customers_dataset as cd
		on od.customer_id = cd.customer_id
	group by 1,3
	)subq
	   
group by 1,2,3;
	

