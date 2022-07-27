-- Task 4
--No 1  Menampilkan jumlah penggunaan masing-masing tipe pembayaran secara all time diurutkan dari yang terfavorit
--(Hint: Perhatikan struktur (kolom-kolom apa saja) dari tabel akhir yang ingin didapatkan)

select date_part ('year', od.order_purchase_timestamp) as year,
		sum(case when opd.payment_type = 'boleto' then 1 else 0 end) as boleto,
		sum(case when opd.payment_type = 'credit_card' then 1 else 0 end) as credit_card,
		sum(case when opd.payment_type = 'debit_card' then 1 else 0 end) as debit_card,
		sum(case when opd.payment_type = 'voucher' then 1 else 0 end) as voucher,
		sum(case when opd.payment_type = 'not_defined' then 1 else 0 end) as not_defined
		
from orders_dataset as od
join order_payments_dataset as opd on od.order_id = opd.order_id

group by 1
order by 1,2,3,4,5,6 DESC
