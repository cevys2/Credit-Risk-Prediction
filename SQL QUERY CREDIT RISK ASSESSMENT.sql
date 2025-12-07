-- Menghitung total baris
SELECT COUNT(*) AS Total_Nasabah
FROM loan_data;


-- Menghitung jumlah masing-masing status
SELECT
	loan_status,
	COUNT(*) AS Jumlah_Nasabah,
	AVG(person_income) AS Rata_Rata_Gaji
FROM loan_data
GROUP BY loan_status;


-- Melihat persentase gagal bayar per Grade
SELECT
    loan_grade,
    COUNT(*) AS Total_Pinjaman,
    SUM(CAST(loan_status AS INT)) AS Jumlah_Gagal_Bayar, -- Trik: Menjumlahkan 1 dan 0
    (CAST(SUM(CAST(loan_status AS INT)) AS FLOAT) / COUNT(*)) * 100 AS Persen_Gagal_Bayar
FROM loan_data
GROUP BY loan_grade
ORDER BY loan_grade;


SELECT
	loan_grade,
	COUNT(*) AS Total_Nasabah,
	CAST((AVG(loan_int_rate) / 100) AS DECIMAL(10,2)) AS Rata_Rata_Bunga,
	(CAST(SUM(CAST(loan_status AS INT)) AS FLOAT) / COUNT(*)) * 100 AS Persen_Gagal_Bayar
FROM loan_data
GROUP BY loan_grade
ORDER BY loan_grade;