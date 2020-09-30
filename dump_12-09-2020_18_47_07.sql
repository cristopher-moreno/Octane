--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases
--

DROP DATABASE octane;




--
-- Drop roles
--

DROP ROLE octane;


--
-- Roles
--

CREATE ROLE octane;
ALTER ROLE octane WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'md58985161f9a80ca2fbfb83bc449670a4b';






--
-- Database creation
--

CREATE DATABASE octane WITH TEMPLATE = template0 OWNER = octane;
REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


\connect octane

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.19
-- Dumped by pg_dump version 9.6.19

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: p_insert_trip(integer, integer, integer, date, date, numeric, numeric); Type: FUNCTION; Schema: public; Owner: octane
--

CREATE FUNCTION public.p_insert_trip(p_id_trip integer, p_punto_inicio integer, p_punto_fin integer, p_fecha_inicio date, p_fecha_fin date, p_costo numeric, p_volumen numeric) RETURNS void
    LANGUAGE plpgsql
    AS $$ begin

insert

	into

	public.trip (id_trip, punto_inicio , punto_fin , fecha_inicio , fecha_fin, costo, volumen, distancia, duracion, economia_combustible, costo_trip )

values (p_id_trip, p_punto_inicio, p_punto_fin, p_fecha_inicio, p_fecha_fin, p_costo, p_volumen,(p_punto_fin - p_punto_inicio ),(((p_fecha_fin::DATE)-(p_fecha_inicio::DATE))+ 1), ((p_punto_fin - p_punto_inicio )/ p_volumen), (p_costo /(((p_fecha_fin::DATE)-(p_fecha_inicio::DATE))+ 1)) );

end;



$$;


ALTER FUNCTION public.p_insert_trip(p_id_trip integer, p_punto_inicio integer, p_punto_fin integer, p_fecha_inicio date, p_fecha_fin date, p_costo numeric, p_volumen numeric) OWNER TO octane;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: trip; Type: TABLE; Schema: public; Owner: octane
--

CREATE TABLE public.trip (
    id_trip integer NOT NULL,
    fecha_inicio date,
    fecha_fin date,
    punto_fin integer,
    punto_inicio integer,
    costo numeric(4,2),
    volumen numeric(5,3),
    distancia numeric(3,0),
    duracion integer,
    economia_combustible numeric(5,3),
    costo_trip numeric(3,2)
);


ALTER TABLE public.trip OWNER TO octane;

--
-- Name: TABLE trip; Type: COMMENT; Schema: public; Owner: octane
--

COMMENT ON TABLE public.trip IS 'Telemetrics: Trip Informations';


--
-- Data for Name: trip; Type: TABLE DATA; Schema: public; Owner: octane
--

COPY public.trip (id_trip, fecha_fin, fecha_inicio, duracion, punto_fin, punto_inicio, costo, costo_trip, distancia, economia_combustible, volumen) FROM stdin;
190709	2019-07-16	2019-07-09	8	37913	37514	20.59	2.57	399	15.560	25.642
190716	2019-07-24	2019-07-16	9	38309	37913	20.14	2.24	396	16.417	24.121
190724	2019-08-01	2019-07-24	9	38722	38309	20.12	2.24	413	17.138	24.098
190801	2019-08-07	2019-08-01	7	38929	38722	15.01	2.14	207	11.523	17.964
190807	2019-08-17	2019-08-07	11	39333	38929	20.44	1.86	404	16.504	24.479
190817	2019-08-26	2019-08-17	10	39667	39333	19.57	1.96	334	13.139	25.421
190826	2019-09-03	2019-08-26	9	40004	39667	17.63	1.96	337	14.698	22.929
190903	2019-09-11	2019-09-03	9	40346	40004	17.92	1.99	342	14.819	23.078
190911	2019-09-18	2019-09-11	8	40696	40346	17.86	2.23	350	14.910	23.474
190918	2019-09-25	2019-09-18	8	41071	40696	17.79	2.22	375	16.109	23.279
190925	2019-10-02	2019-09-25	8	41453	41071	17.23	2.15	382	16.518	23.126
191002	2019-10-11	2019-10-02	10	41854	41453	17.69	1.77	401	17.184	23.335
191011	2019-10-21	2019-10-11	11	42241	41854	17.93	1.63	387	16.145	23.971
191021	2019-10-28	2019-10-21	8	42647	42241	18.71	2.34	406	16.059	25.281
191028	2019-11-12	2019-10-28	16	43009	42647	17.68	1.11	362	15.355	23.575
191112	2019-11-22	2019-11-12	11	43376	43009	18.41	1.67	367	15.081	24.336
191122	2019-12-02	2019-11-22	11	43705	43376	18.51	1.68	329	13.439	24.481
191202	2019-12-13	2019-12-02	12	44061	43705	15.79	1.32	356	17.585	20.244
191213	2020-01-20	2019-12-13	39	44437	44061	18.92	0.49	376	15.656	24.016
200120	2020-01-31	2020-01-20	12	44796	44437	19.06	1.59	359	15.184	23.643
200131	2020-02-13	2020-01-31	14	45220	44796	16.15	1.15	424	20.323	20.863
200213	2020-02-18	2020-02-13	6	45612	45220	19.49	3.25	392	15.467	25.345
200218	2020-03-03	2020-02-18	15	45949	45612	18.22	1.21	337	13.839	24.352
200303	2020-03-10	2020-03-03	8	46320	45949	16.62	2.08	371	17.456	21.254
200310	2020-04-17	2020-03-10	39	46703	46320	18.90	0.48	383	15.744	24.327
200417	2020-04-28	2020-04-17	12	47173	46703	12.00	1.00	470	18.920	24.841
200428	2020-05-07	2020-04-28	10	47601	47173	12.00	1.20	428	17.230	24.841
200507	2020-05-15	2020-05-07	9	48029	47601	12.13	1.35	428	16.866	25.377
200515	2020-05-25	2020-05-15	11	48528	48029	12.75	1.16	499	18.708	26.673
200525	2020-06-05	2020-05-25	12	49007	48528	14.55	1.21	479	18.731	25.572
200605	2020-06-15	2020-06-05	11	49485	49007	13.36	1.21	478	21.073	22.683
200615	2020-06-25	2020-06-15	11	50005	49485	15.17	1.38	520	20.189	25.756
200625	2020-07-06	2020-06-25	12	50424	50005	16.00	1.33	419	16.262	25.765
200706	2020-07-23	2020-07-06	18	50866	50424	14.18	0.79	442	19.918	22.191
200723	2020-08-10	2020-07-23	19	51283	50866	15.10	0.79	417	17.690	23.572
200810	2020-08-22	2020-08-10	13	51750	51283	16.02	1.23	467	18.715	24.953
200822	2020-09-02	2020-08-22	12	51985	51750	13.76	1.15	235	10.742	21.876
200902	2020-09-12	2020-09-02	11	52300	51985	13.98	1.27	315	14.758	21.344
\.


--
-- Name: trip pk_id_trip; Type: CONSTRAINT; Schema: public; Owner: octane
--

ALTER TABLE ONLY public.trip
    ADD CONSTRAINT pk_id_trip PRIMARY KEY (id_trip);


--
-- PostgreSQL database dump complete
--

\connect postgres

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.19
-- Dumped by pg_dump version 9.6.19

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: octane
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- PostgreSQL database dump complete
--

\connect template1

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.19
-- Dumped by pg_dump version 9.6.19

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: octane
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

