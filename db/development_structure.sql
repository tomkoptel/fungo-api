--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: locations; Type: TABLE; Schema: public; Owner: fungo; Tablespace: 
--

CREATE TABLE locations (
    id integer NOT NULL,
    latitude character varying(255) NOT NULL,
    longitude character varying(255) NOT NULL,
    mdt timestamp without time zone NOT NULL
);


ALTER TABLE public.locations OWNER TO fungo;

--
-- Name: locations_id_seq; Type: SEQUENCE; Schema: public; Owner: fungo
--

CREATE SEQUENCE locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.locations_id_seq OWNER TO fungo;

--
-- Name: locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fungo
--

ALTER SEQUENCE locations_id_seq OWNED BY locations.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: fungo; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO fungo;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fungo
--

ALTER TABLE ONLY locations ALTER COLUMN id SET DEFAULT nextval('locations_id_seq'::regclass);


--
-- Name: locations_pkey; Type: CONSTRAINT; Schema: public; Owner: fungo; Tablespace: 
--

ALTER TABLE ONLY locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: fungo; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

