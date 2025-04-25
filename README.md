
## 📜 Assignment Objective
This assignment focuses on PostgreSQL database operations. You will create and manage three tables (books, customers, orders), insert sample data, and perform essential SQL queries. Key tasks include CRUD operations, constraints, JOINs, aggregations, filtering, and data manipulation to reinforce your understanding of relational databases.

**Repository Owner:** [Forida-Parven](https://github.com/Eh-haque)  

📂 Installation
Install PostgreSQL
Windows:
Download from https://www.postgresql.org/download/windows/
Run the installer and follow the setup instructions
Set a password for the postgres superuser
Use pgAdmin or psql terminal

            1️⃣ What is PostgreSQL❓

PostgreSQL একটি ডাটাবেস সফটওয়্যার, যার মাধ্যমে আপনি বিভিন্ন তথ্য (যেমন: ইউজারের নাম, পাসওয়ার্ড, প্রোডাক্ট লিস্ট, অর্ডার ডিটেইলস ইত্যাদি) খুব সুন্দরভাবে সংরক্ষণ এবং ব্যবস্থাপনা করতে পারেন। এটি খুবই শক্তিশালী এবং নিরাপদ একটি ডাটাবেস সিস্টেম।

🔍 PostgreSQL এর বৈশিষ্ট্য:
ওপেন সোর্স: এটি সম্পূর্ণ ফ্রি এবং কাস্টমাইজযোগ্য।
রিলেশনাল ডাটাবেস: টেবিল আকারে ডেটা সংরক্ষণ করে।
ACID কমপ্লায়েন্ট: ডেটা ট্রানজেকশনগুলো নির্ভরযোগ্যভাবে হয়।
জটিল কোয়েরি সাপোর্ট করে।
JSON, XML, GIS (Geographic Information System) ইত্যাদির সাপোর্ট রয়েছে।

✅ PostgreSQL ব্যবহৃত হয়:
ওয়েব অ্যাপ্লিকেশন (যেমন: ই-কমার্স সাইট)
মোবাইল অ্যাপ ব্যাকএন্ড
বিশ্লেষণমূলক সফটওয়্যার
ব্যাঙ্কিং বা অর্থনৈতিক ডেটা ব্যবস্থাপনা ।

          2️⃣ What is the purpose of a database schema in PostgreSQL❓

PostgreSQL-এ একটি ডাটাবেস স্কিমা হলো ডাটাবেসের ভেতরে একটি লজিকাল গোষ্ঠীবদ্ধতা, যেখানে আপনি টেবিল, ভিউ, ফাংশন, ইনডেক্স ইত্যাদি সংরক্ষণ করতে পারেন। এটি মূলত ডাটাবেসের মধ্যে জিনিসপত্র গোছানোর একটি পদ্ধতি।

স্কিমার উদ্দেশ্যসমূহ:
✅ গোছানো ও সংগঠিত রাখা:
স্কিমা ব্যবহার করে আপনি বড় ডাটাবেসকে ছোট ছোট ভাগে ভাগ করতে পারেন, যাতে প্রতিটি বিভাগের (যেমন: HR, Finance) জন্য আলাদা টেবিল ও ফাংশন থাকে।

✅ নেইমস্পেস বা নামজগৎ তৈরি করা:
একই নামে একাধিক টেবিল বা অবজেক্ট রাখতে পারবেন, যদি তারা ভিন্ন স্কিমাতে থাকে। যেমন: hr.employees এবং finance.employees।

✅ অ্যাক্সেস কন্ট্রোল বা নিরাপত্তা:
স্কিমার উপর ভিত্তি করে আপনি নির্দিষ্ট ইউজার বা রোলকে অনুমতি (permission) দিতে বা সীমাবদ্ধ করতে পারেন।

✅ সহজ রক্ষণাবেক্ষণ ও মডিউলারিটি:
অ্যাপ্লিকেশনের বিভিন্ন অংশ স্কিমা অনুযায়ী ভাগ করা থাকলে উন্নয়ন, আপডেট ও রক্ষণাবেক্ষণ সহজ হয়।

✅ নাম দ্বন্দ্ব এড়ানো:
যদি দুইটি টেবিলের নাম একই হয়, স্কিমা তাদের আলাদা রাখতে সাহায্য করে।

উদাহরণ:

CREATE SCHEMA hr;
CREATE TABLE hr.employees (
  id SERIAL PRIMARY KEY,
  name TEXT,
  position TEXT
);

CREATE SCHEMA finance;
CREATE TABLE finance.employees (
  id SERIAL PRIMARY KEY,
  name TEXT,
  salary NUMERIC
);

এইভাবে hr.employees এবং finance.employees একসাথে একই ডাটাবেসে থাকতে পারে।

            3️⃣ Explain the Primary Key and Foreign Key concepts in PostgreSQL❓

🟩 Primary Key (প্রাইমারি কি) কী?
Primary Key একটি টেবিলের এমন একটি কলাম বা কলামগুলোর সমন্বয় যা প্রতিটি সারিকে (row) একটি ইউনিক পরিচয় দেয়। অর্থাৎ, এটি এমন একটি মান যা টেবিলের প্রতিটি সারিতে ভিন্ন (unique) হতে হবে এবং null হতে পারবে না।

8🔑 বৈশিষ্ট্য:
ইউনিক (অদ্বিতীয়) হতে হবে

NULL মান থাকতে পারবে না

একটি টেবিলে সাধারণত একটি প্রাইমারি কি থাকে

🧾 উদাহরণ:

CREATE TABLE students (
  student_id SERIAL PRIMARY KEY,
  name TEXT,
  class TEXT
);

এখানে student_id হলো Primary Key, যা প্রতিটি শিক্ষার্থীর জন্য ইউনিক আইডি হিসেবে কাজ করছে।

🟨 Foreign Key (ফরেইন কি) কী?
Foreign Key হলো এমন একটি কলাম যেটি অন্য টেবিলের Primary Key কে রেফারেন্স (reference) করে। এটি দুইটি টেবিলের মধ্যে সম্পর্ক (relationship) তৈরি করে।

🔗 কাজ:
একটি টেবিলের ডেটা অন্য টেবিলের ডেটার সাথে যুক্ত রাখতে সাহায্য করে

ডেটা ইন্টিগ্রিটি বজায় রাখে (ভুল রেফারেন্স এড়ায়)

🧾 উদাহরণ:
ধরুন আমাদের একটি students টেবিল আছে এবং আরেকটি results টেবিল যেখানে শিক্ষার্থীদের পরীক্ষার রেজাল্ট রাখা হয়।

CREATE TABLE results (
  result_id SERIAL PRIMARY KEY,
  student_id INT REFERENCES students(student_id),
  subject TEXT,
  marks INT
);
এখানে student_id হলো Foreign Key যা students টেবিলের student_id কে রেফার করে। অর্থাৎ, results টেবিলের প্রতিটি রেজাল্ট একটি বৈধ শিক্ষার্থীর সাথেই যুক্ত থাকতে পারবে।

              4️⃣ What is the difference between the VARCHAR and CHAR data types❓

VARCHAR এবং CHAR দুটোই টেক্সট (string) ডেটা সংরক্ষণের জন্য ব্যবহৃত হয়, তবে এদের মধ্যে কিছু গুরুত্বপূর্ণ পার্থক্য রয়েছে:

🔹 VARCHAR (Variable Character):
এটি একটি পরিবর্তনশীল দৈর্ঘ্যের ডেটা টাইপ। আপনি যত অক্ষর ইনপুট দেবেন, ঠিক ততটাই জায়গা এটি ব্যবহার করবে। যেমনঃ যদি আপনি VARCHAR(10) ডিফাইন করেন এবং ইনপুট দেন "abc", তবে এটি শুধু ৩টা অক্ষরের জায়গা নিবে।

🔹 CHAR (Character): 
এটি একটি নির্দিষ্ট দৈর্ঘ্যের ডেটা টাইপ। আপনি CHAR(10) দিলে, ইনপুট যত ছোটই হোক না কেন, সেটি ১০ অক্ষরের জায়গা নিবে। বাকি জায়গাগুলো ফাঁকা (space) দিয়ে পূরণ করা হবে। যেমনঃ "abc" দিলে এটি "abc       " (সাতটি ফাঁকা স্পেসসহ) হয়ে যাবে।

🔸 সংক্ষেপে পার্থক্যঃ 
- VARCHAR: জায়গা বাঁচায়, পরিবর্তনশীল দৈর্ঘ্যের ডেটা।
- CHAR: নির্দিষ্ট দৈর্ঘ্য, সবসময় নির্দিষ্ট পরিমাণ জায়গা নেয়।

✅ সাধারণত যখন ডেটার দৈর্ঘ্য পরিবর্তনশীল হয়, তখন VARCHAR ব্যবহার করা ভালো।

                5️⃣ Explain the purpose of the WHERE clause in a SELECT statement❓

WHERE ক্লজটি একটি SQL SELECT স্টেটমেন্টে ব্যবহৃত হয় নির্দিষ্ট শর্ত অনুযায়ী ডেটা ফিল্টার করতে।

🔹 অর্থাৎ, WHERE ক্লজের মাধ্যমে আমরা বলতে পারি – “শুধু সেই রেকর্ডগুলো দেখাও যেগুলো নির্দিষ্ট শর্ত পূরণ করে।”

🔸 উদাহরণঃ

SELECT * FROM students  
WHERE grade = 'A';
এখানে শুধু সেই students টেবিলের রেকর্ডগুলো দেখা যাবে যাদের grade হচ্ছে 'A'।

✅ সংক্ষেপে বললে, WHERE ক্লজ ডেটা সিলেক্ট করার সময় শর্ত প্রয়োগ করতে সাহায্য করে, যেন আমরা শুধু প্রয়োজনীয় তথ্যই পাই।

                6️⃣ What are the LIMIT and OFFSET clauses used for❓

LIMIT এবং OFFSET ক্লজ দুটি SQL-এ ব্যবহার করা হয় ডেটা রেজাল্টের পরিমাণ এবং কোন পজিশন থেকে ডেটা দেখানো শুরু হবে তা নিয়ন্ত্রণ করতে।

🔹 LIMIT: 
LIMIT দিয়ে নির্ধারণ করা হয়—রেজাল্টে সর্বোচ্চ কতটি রেকর্ড দেখানো হবে।  

🔸 উদাহরণঃ  

SELECT * FROM products  
LIMIT 5;

এখানে কেবল প্রথম ৫টি রেকর্ড দেখানো হবে।


🔹OFFSET:  
OFFSET দিয়ে নির্ধারণ করা হয়—প্রথম কতটি রেকর্ড স্কিপ করে এরপরের রেকর্ডগুলো দেখানো হবে।  

🔸 উদাহরণঃ  

SELECT * FROM products  
LIMIT 5 OFFSET 10;

এখানে প্রথম ১০টি রেকর্ড বাদ দিয়ে পরবর্তী ৫টি রেকর্ড দেখানো হবে।

✅ সংক্ষেপে:
- LIMIT: কতগুলো রেকর্ড চাই।  
- OFFSET: কতগুলো রেকর্ড বাদ দিয়ে শুরু করব।

👉 এই দুটি ক্লজ সাধারণত pagination বা পৃষ্ঠাভাগে ডেটা দেখানোর জন্য অনেক উপকারী।

                7️⃣ How can you modify data using UPDATE statements❓

UPDATE স্টেটমেন্ট ব্যবহার করে আমরা কোনো টেবিলের বিদ্যমান ডেটা পরিবর্তন করতে পারি।

🔹 এর মাধ্যমে নির্দিষ্ট রেকর্ডের একটি বা একাধিক কলামের মান আপডেট করা যায়।
🔸 UPDATE স্টেটমেন্টের সাধারণ কাঠামো:

UPDATE table_name  
SET column1 = value1, column2 = value2  
WHERE condition;
🔸 উদাহরণঃ

UPDATE students  
SET grade = 'A+'  
WHERE id = 5;
এখানে students টেবিলের যেই রেকর্ডে id = 5, শুধুমাত্র সেই রেকর্ডের grade কলামের মান 'A+' দিয়ে আপডেট করা হবে।

✅ গুরুত্বপূর্ণ বিষয়:
WHERE ক্লজ ব্যবহার না করলে টেবিলের সব রেকর্ড আপডেট হয়ে যেতে পারে। তাই নির্দিষ্ট রেকর্ড টার্গেট করতে অবশ্যই WHERE ব্যবহার করা উচিত।

🔁 সংক্ষেপে, UPDATE ব্যবহার করে ডেটা সংশোধন করা যায় — মানে পুরনো ডেটা পরিবর্তন করে নতুন মান সেট করা যায়।

               8️⃣ What is the significance of the JOIN operation, and how does it work in PostgreSQL❓

🔗 JOIN অপারেশন ব্যবহার করা হয় একাধিক টেবিল থেকে সম্পর্কযুক্ত ডেটা একসাথে আনার জন্য। এটি খুবই গুরুত্বপূর্ণ যখন ডেটা ভিন্ন ভিন্ন টেবিলে বিভক্ত থাকে, কিন্তু আপনি একসাথে সেই তথ্য বিশ্লেষণ করতে চান।

🔸 JOIN কীভাবে কাজ করে:
JOIN একটি বা একাধিক টেবিলের মধ্যে সাধারণ একটি কলাম বা কী (যেমন: id, user_id) ব্যবহার করে সম্পর্ক তৈরি করে এবং সেই অনুযায়ী মিল থাকা রেকর্ডগুলো একত্রে দেখায়।

🔸 JOIN-এর ধরনসমূহ PostgreSQL-এ:

INNER JOIN: শুধু মিল থাকা রেকর্ডগুলোই দেখায়।
LEFT JOIN: বাম টেবিলের সব রেকর্ড দেখায় এবং মিল না থাকলেও ডান টেবিলের অংশ NULL দেখায়।
RIGHT JOIN: ডান টেবিলের সব রেকর্ড দেখায় এবং বাম টেবিলের অংশ না থাকলে NULL দেখায়।
FULL OUTER JOIN: দুই টেবিলের সব রেকর্ড দেখায়, মিল না থাকলে NULL সহ।

🔸 উদাহরণঃ

SELECT students.name, courses.title  
FROM students  
JOIN enrollments ON students.id = enrollments.student_id  
JOIN courses ON enrollments.course_id = courses.id;

এই কোয়েরিতে তিনটি টেবিল যুক্ত করা হয়েছে: students, enrollments, এবং courses। এটি এমনভাবে যুক্ত করা হয়েছে যেন প্রতিটি শিক্ষার্থীর নামের পাশে তার নেওয়া কোর্সের টাইটেল দেখা যায়।

✅ সংক্ষেপে:
JOIN হলো ডেটাবেজের একাধিক টেবিলের মধ্যে সম্পর্ক তৈরি করে মিলিয়ে তথ্য প্রদর্শনের উপায়। এটি বড় ডেটাসেট বিশ্লেষণ করতে অপরিহার্য।

                9️⃣ Explain the GROUP BY clause and its role in aggregation operations❓

🔹 GROUP BY ক্লজ SQL-এ ব্যবহার করা হয় একই ধরণের মানগুলোকে একটি করে গ্রুপে ভাগ করতে এবং প্রতিটি গ্রুপের উপর অ্যাগ্রিগেট (aggregate) ফাংশন প্রয়োগ করতে।

🔸 অর্থাৎ, GROUP BY এর মাধ্যমে আপনি নির্দিষ্ট একটি কলামের মান অনুযায়ী ডেটাকে গ্রুপ করে, প্রতিটি গ্রুপের উপর COUNT(), SUM(), AVG(), MAX(), MIN() এর মতো ফাংশন চালাতে পারেন।

🔸 উদাহরণঃ
ধরুন আমাদের একটি sales টেবিল আছে যার মধ্যে region এবং amount নামের দুটি কলাম রয়েছে। এখন আমরা প্রতিটি অঞ্চলের মোট বিক্রির পরিমাণ জানতে চাই।

SELECT region, SUM(amount)  
FROM sales  
GROUP BY region;
এখানে region অনুযায়ী সব রেকর্ড গ্রুপ করা হবে এবং প্রতিটি অঞ্চলের জন্য মোট amount হিসেব করা হবে।

✅ সংক্ষেপে:

GROUP BY ডেটাকে ভাগ করে গ্রুপ বানায়।

প্রতিটি গ্রুপের উপর অ্যাগ্রিগেট ফাংশন প্রয়োগ করা যায়।

রিপোর্ট তৈরি বা সারাংশ বিশ্লেষণের জন্য এটি অত্যন্ত গুরুত্বপূর্ণ।

📊 এটি সাধারণত ডেটা বিশ্লেষণ ও রিপোর্টিংয়ের সময় ব্যবহৃত হয়।

                🔟 How can you calculate aggregate functions like COUNT(), SUM(), and AVG() in PostgreSQL❓

PostgreSQL-এ COUNT(), SUM(), এবং AVG() হলো অ্যাগ্রিগেট (সারাংশ) ফাংশন, যেগুলো ব্যবহার করে আপনি ডেটার উপর নির্দিষ্ট ধরনের গাণিতিক বিশ্লেষণ করতে পারেন।

🔹 COUNT() – মোট কতটি রেকর্ড আছে তা গণনা করে।
🔸 উদাহরণঃ

SELECT COUNT(*) FROM students;
👉 এটি students টেবিলের মোট রেকর্ড সংখ্যা দেখাবে।

🔹 SUM() – একটি নির্দিষ্ট কলামের সব মান যোগ করে।
🔸 উদাহরণঃ

SELECT SUM(amount) FROM sales;
👉 এটি sales টেবিলের amount কলামের সব মানের যোগফল দেখাবে।

🔹 AVG() – একটি কলামের গড় মান (average) বের করে।
🔸 উদাহরণঃ

SELECT AVG(score) FROM results;
👉 এটি results টেবিলের score কলামের গড় স্কোর দেখাবে।

✅ সংক্ষেপে:

COUNT() ➤ মোট রেকর্ড সংখ্যা

SUM() ➤ মোট যোগফল

AVG() ➤ গড় মান

📌 এই ফাংশনগুলো সাধারণত বিশ্লেষণ, রিপোর্ট তৈরির সময় এবং GROUP BY এর সাথে একত্রে বেশি ব্যবহৃত হয়।











