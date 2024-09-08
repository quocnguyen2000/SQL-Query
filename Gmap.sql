/*

KHỞI TẠO GIT
- Tạo một repository mới: git init
- thêm tất cả các tệp: git add .
- Commit các thay đổi: git commit -m "Thông điệp commit"
- Kết nối với remote repository: git remote add origin <URL_của_repository>
- Push các thay đổi lên remote repository: git push -u origin master

*/


/* SYSTEM */

--1. Ghi chú mã nhanh: Bình luận (Comment) đoạn mã đã chọn: Ctrl + K, Ctrl + C / Bỏ bình luận (Uncomment) đoạn mã đã chọn: Ctrl + K, Ctrl + U
--2. Chạy mã: Ctrl + E
-- CTRL + SHIFT + U: CHUYỂN ĐỔI VĂN BẢN ĐÃ CHỌN THÀNH CHỮ HOA.
-- ctrl + shift + l: chuyển đổi văn bản đã chọn thành chữ thường.

/* KIỂU DỮ LIỆU

1. Kiểu dữ liệu số (Numeric Data Types)
int: Số nguyên, từ -2,147,483,648 đến 2,147,483,647.
bigint: Số nguyên lớn, từ -9,223,372,036,854,775,808 đến 9,223,372,036,854,775,807.
smallint: Số nguyên nhỏ, từ -32,768 đến 32,767.
tinyint: Số nguyên rất nhỏ, từ 0 đến 255.
decimal(p, s): Số thập phân với p là tổng số chữ số và s là số chữ số sau dấu thập phân. Ví dụ: decimal(10, 2).
numeric(p, s): Tương tự như decimal.
float: Số thực với độ chính xác khoảng từ 1.7E-308 đến 1.7E+308.
real: Số thực với độ chính xác khoảng từ 1.7E-38 đến 3.4E+38.

2. Kiểu dữ liệu chuỗi ký tự (Character Data Types)
char(n): Chuỗi ký tự cố định với độ dài n, từ 1 đến 8000 ký tự.
varchar(n): Chuỗi ký tự biến đổi với độ dài tối đa n, từ 1 đến 8000 ký tự. Nếu không chỉ định n, có thể dùng varchar(max).
text: Chuỗi ký tự lớn (không còn được khuyến nghị sử dụng, thay vào đó nên dùng varchar(max)).

3. Kiểu dữ liệu ngày và giờ (Date and Time Data Types)
date: Ngày (năm, tháng, ngày), không có thông tin về giờ.
time: Thời gian (giờ, phút, giây, mili giây).
datetime: Ngày và giờ, bao gồm năm, tháng, ngày, giờ, phút, giây và mili giây.
datetime2: Tương tự như datetime, nhưng với độ chính xác cao hơn.
smalldatetime: Ngày và giờ với độ chính xác thấp hơn datetime.
datetimeoffset: Ngày và giờ với thông tin về múi giờ.

4. Kiểu dữ liệu nhị phân (Binary Data Types)
binary(n): Dữ liệu nhị phân cố định với độ dài n, từ 1 đến 8000 byte.
varbinary(n): Dữ liệu nhị phân biến đổi với độ dài tối đa n, từ 1 đến 8000 byte. Nếu không chỉ định n, có thể dùng varbinary(max).
image: Dữ liệu nhị phân lớn (không còn được khuyến nghị sử dụng, thay vào đó nên dùng varbinary(max)).

5. Kiểu dữ liệu boolean (Boolean Data Types)
bit: Dữ liệu boolean, có thể nhận giá trị 0, 1 hoặc NULL.

6. Kiểu dữ liệu đặc biệt (Special Data Types)
uniqueidentifier: Định danh duy nhất toàn cầu (GUID).
xml: Dữ liệu XML.
cursor: Con trỏ (dùng trong lập trình T-SQL).
table: Biến bảng (dùng trong lập trình T-SQL).

7. Kiểu dữ liệu thời gian (Temporal Data Types)
datetime2: Định dạng thời gian với độ chính xác cao hơn.
datetimeoffset: Thời gian với thông tin về múi giờ.

8. Kiểu dữ liệu chuỗi Unicode (Unicode Character Data Types)
nchar(n): Chuỗi ký tự Unicode cố định với độ dài n, từ 1 đến 4000 ký tự.
nvarchar(n): Chuỗi ký tự Unicode biến đổi với độ dài tối đa n, từ 1 đến 4000 ký tự. Nếu không chỉ định n, có thể dùng nvarchar(max).
*/


/* GMAP */


--Lấy thông tin về tất cả các bảng trong cơ sở dữ liệu
SELECT * 
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE';


/*	Xem toàn bộ bảng	*/
select * from Gmap


-- Xem 10 dòng
SELECT TOP 10 *
FROM Gmap;


-- Xem Giá Trị Duy Nhất
SELECT DISTINCT [Tên NVBH]
FROM Gmap;


-- Đếm số dòng
SELECT COUNT(*) AS TotalRows
FROM Gmap;


--Đếm số dòng của từng tháng
SELECT 
    SUBSTRING(Ngày, 4, 2) AS Month,
    RIGHT(Ngày, 4) AS Year,
    COUNT(*) AS NumberOfRows
FROM Gmap
GROUP BY 
    SUBSTRING(Ngày, 4, 2),
    RIGHT(Ngày, 4);


--Lấy thông tin cấu trúc bảng
SELECT COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Gmap';


--XÁC NHẬN KIỂU DỮ LIỆU HIỆN TẠI CỦA CỘT
SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Gmap'
  AND COLUMN_NAME = 'Ngày';


/*	Lấy những cột cần thiết trong bảng Gmap	*/
SELECT [Mã NVBH], Ngày, [Tổng số KH trong tuyến], [Số KH thực ghé], [Số KH trong tuyến phát sinh ĐH]
FROM Gmap;


--Kiểm tra 1 cột trong bảng:
SELECT Ngày
FROM Gmap;


--Đếm số lượng hàng theo cột Tên NVBH từ cao đến thấp,
SELECT [Tên NVBH], COUNT(*) AS NumberOfRows
FROM Gmap
GROUP BY [Tên NVBH]
ORDER BY NumberOfRows DESC;


-- TÍNH SỐ ĐƠN HÀNG THEO NHÂN VIÊN
SELECT [Tên NVBH], SUM([Số KH trong tuyến phát sinh ĐH]) AS ĐƠN
FROM Gmap GROUP BY [Tên NVBH] ORDER BY ĐƠN DESC;


-- TÍNH SỐ ĐƠN HÀNG THEO NHÂN VIÊN TRỪ NHÂN VIÊN NPP,VACANT
SELECT [Tên NVBH], 
       SUM([Số KH trong tuyến phát sinh ĐH]) AS ĐƠN
FROM Gmap
WHERE [Tên NVBH] NOT IN ('VACANT', 'NV NPP', 'NV NPP ĐL', 'NV NPP ĐẠI LÝ')
GROUP BY [Tên NVBH]
ORDER BY ĐƠN DESC;


--- TÍNH SỐ ĐƠN HÀNG THEO NHÂN VIÊN TRỪ NHÂN VIÊN NPP,VACANT VÀ ĐƠN BẰNG 0
SELECT [Tên NVBH], 
       SUM([Số KH trong tuyến phát sinh ĐH]) AS ĐƠN
FROM Gmap	
WHERE [Tên NVBH] NOT IN ('VACANT', 'NV NPP', 'NV NPP ĐL', 'NV NPP ĐẠI LÝ')
GROUP BY [Tên NVBH]
HAVING SUM([Số KH trong tuyến phát sinh ĐH]) > 0
ORDER BY ĐƠN DESC;


--XEM TRƯỚC CÁC BẢN GHI SẼ BỊ XOÁ
SELECT * FROM Gmap
WHERE SUBSTRING(Ngày, 4, 2) = '03'
AND RIGHT(Ngày, 4) = '2023';
-- XOÁ CÁC HÀNG LÀ THÁN 3 VÀ NĂM LÀ 2023
DELETE FROM Gmap
WHERE SUBSTRING(Ngày, 4, 2) = '03'
AND RIGHT(Ngày, 4) = '2023';

