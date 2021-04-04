ALTER TABLE cp_category
  ADD CONSTRAINT pk_cp_category PRIMARY KEY(category_code);

ALTER TABLE cp_customer
  ADD CONSTRAINT pk_cp_customer PRIMARY KEY(customer_no);

ALTER TABLE cp_price
  ADD CONSTRAINT pk_cp_price PRIMARY KEY(rental_class);

ALTER TABLE cp_title
  ADD CONSTRAINT pk_cp_title PRIMARY KEY(title_code)
  ADD CONSTRAINT fk_cp_ti_to_ca FOREIGN KEY(category_code)
      REFERENCES cp_category(category_code);

ALTER TABLE cp_dvd
  ADD CONSTRAINT pk_cp_dvd PRIMARY KEY(dvd_number)
  ADD CONSTRAINT fk_cp_dvd_to_pr FOREIGN KEY(rental_class)
      REFERENCES cp_price(rental_class)
  ADD CONSTRAINT fk_cp_dvd_to_ti FOREIGN KEY(title_code)
      REFERENCES cp_title(title_code);

ALTER TABLE cp_rental
  ADD CONSTRAINT pk_cp_rental PRIMARY KEY(customer_no,dvd_number, date_out)
  ADD CONSTRAINT fk_cp_re_to_cu FOREIGN KEY(customer_no)
      REFERENCES cp_customer(customer_no)
  ADD CONSTRAINT fk_cp_re_to_dvd FOREIGN KEY(dvd_number)
      REFERENCES cp_dvd(dvd_number);

