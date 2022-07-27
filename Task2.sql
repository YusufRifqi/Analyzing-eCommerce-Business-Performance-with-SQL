--TASK 3
1.
--Membuat tabel yang berisi informasi pendapatan/revenue perusahaan total untuk masing-masing tahun 
--(Hint: Revenue adalah harga barang dan juga biaya kirim. 
--Pastikan juga melakukan filtering terhadap order status yang tepat untuk menghitung pendapatan)

--( tabel using orders_dataset & order_items_dataset)

--ubah tipe :
Alter table order_items_dataset
alter column price type float Using price :: float
--
Alter table order_items_dataset
alter column freight_value type float Using freight_value :: float
----
select year,
	   jumlah
from (
	select
	    	date_part('year', od.order_purchase_timestamp ) as year,
			sum(oid.price+oid.freight_value) as jumlah
	from	order_items_dataset as oid 
	join 	orders_dataset as od
			on oid.order_id = od.order_id
	where 	od.order_status = 'delivered'
	group by 1
	)subq
group by 1,2;

=========
2. 
--Membuat tabel yang berisi informasi jumlah cancel order total untuk masing-masing tahun
--(Hint: Perhatikan filtering terhadap order status yang tepat untuk menghitung jumlah cancel order)

select date_part('year', order_purchase_timestamp) as tahun,
		count(order_status)
from    orders_dataset
where order_status = 'canceled'
group by 1;

========
No 3 :
-- Membuat tabel yang berisi nama kategori produk yang memberikan pendapatan total tertinggi 
--untuk masing-masing tahun
--(Hint: Perhatikan penggunaan window function dan juga filtering yang dilakukan)

select year, revenue
from (
	         select 
			 date_part('year', od.order_purchase_timestamp) as year,
       		 sum(oid.price + oid.freight_value) as revenue
			-- pd.product_category_name as nama
	  from order_items_dataset as oid 
	  join  orders_dataset as od
			on od.order_id = oid.order_id
	  join product_dataset as pd
			on pd.product_id = oid.product_id
	 WHERE od.order_status = 'delivered' 
	 group by 1
	 order by 2
		)subq

group by 1,2
order by 1
--group by 1,2,3;

============

-- No.4 Membuat tabel yang berisi nama kategori produk yang memiliki jumlah cancel order terbanyak untuk masing-masing tahun
--(Hint: Perhatikan penggunaan window function dan juga filtering yang dilakukan)


select date_part('year', od.order_purchase_timestamp) as year,
 		max(pd.product_category_name) as produk_name,
		max(od.order_status) as jumlah
from 
		orders_dataset as od

join order_items_dataset as oid on od.order_id = oid.order_id
join product_dataset as pd on oid.product_id = pd.product_id

where od.order_status = 'canceled'
 
group by 1
	
===


