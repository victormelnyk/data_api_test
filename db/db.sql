--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.1
-- Dumped by pg_dump version 9.6.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: test; Type: SCHEMA; Schema: -; Owner: lt_admin
--

CREATE SCHEMA test;


ALTER SCHEMA test OWNER TO lt_admin;

SET search_path = test, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: authors; Type: TABLE; Schema: test; Owner: lt_admin
--

CREATE TABLE authors (
    author_id df.t_id NOT NULL,
    name df.t_string_short NOT NULL
);


ALTER TABLE authors OWNER TO lt_admin;

--
-- Name: books; Type: TABLE; Schema: test; Owner: lt_admin
--

CREATE TABLE books (
    book_id df.t_id NOT NULL,
    author_id df.t_id NOT NULL,
    name df.t_string_short NOT NULL
);


ALTER TABLE books OWNER TO lt_admin;

--
-- Name: publishers; Type: TABLE; Schema: test; Owner: lt_admin
--

CREATE TABLE publishers (
    author_id df.t_id NOT NULL,
    book_id df.t_id NOT NULL
);


ALTER TABLE publishers OWNER TO lt_admin;

--
-- Name: authors pk_authors; Type: CONSTRAINT; Schema: test; Owner: lt_admin
--

ALTER TABLE ONLY authors
    ADD CONSTRAINT pk_authors PRIMARY KEY (author_id);


--
-- Name: books pk_books; Type: CONSTRAINT; Schema: test; Owner: lt_admin
--

ALTER TABLE ONLY books
    ADD CONSTRAINT pk_books PRIMARY KEY (book_id);


--
-- Name: publishers pk_publishers; Type: CONSTRAINT; Schema: test; Owner: lt_admin
--

ALTER TABLE ONLY publishers
    ADD CONSTRAINT pk_publishers PRIMARY KEY (author_id, book_id);


--
-- Name: books fk_books__authors; Type: FK CONSTRAINT; Schema: test; Owner: lt_admin
--

ALTER TABLE ONLY books
    ADD CONSTRAINT fk_books__authors FOREIGN KEY (author_id) REFERENCES authors(author_id);


--
-- Name: publishers fk_publishers__authors; Type: FK CONSTRAINT; Schema: test; Owner: lt_admin
--

ALTER TABLE ONLY publishers
    ADD CONSTRAINT fk_publishers__authors FOREIGN KEY (author_id) REFERENCES authors(author_id);


--
-- Name: publishers fk_publishers__books; Type: FK CONSTRAINT; Schema: test; Owner: lt_admin
--

ALTER TABLE ONLY publishers
    ADD CONSTRAINT fk_publishers__books FOREIGN KEY (book_id) REFERENCES books(book_id);


--
-- PostgreSQL database dump complete
--

