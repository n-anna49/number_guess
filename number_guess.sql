--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(30) NOT NULL,
    games_played integer,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (137, 'Kit', 8, 4);
INSERT INTO public.users VALUES (143, 'user_1670511502058', 2, 820);
INSERT INTO public.users VALUES (151, 'user_1670511599414', 2, 82);
INSERT INTO public.users VALUES (142, 'user_1670511502059', 5, 760);
INSERT INTO public.users VALUES (150, 'user_1670511599415', 5, 683);
INSERT INTO public.users VALUES (145, 'user_1670511519163', 2, 995);
INSERT INTO public.users VALUES (17, 'Ann', 3, 1);
INSERT INTO public.users VALUES (139, 'user_1670510565254', 2, NULL);
INSERT INTO public.users VALUES (144, 'user_1670511519164', 5, 817);
INSERT INTO public.users VALUES (138, 'user_1670510565255', 5, NULL);
INSERT INTO public.users VALUES (141, 'user_1670511237208', 2, NULL);
INSERT INTO public.users VALUES (147, 'user_1670511531791', 2, 375);
INSERT INTO public.users VALUES (140, 'user_1670511237209', 5, NULL);
INSERT INTO public.users VALUES (16, 'Nek', 24, 12);
INSERT INTO public.users VALUES (118, 'Annie', 2, 1000);
INSERT INTO public.users VALUES (146, 'user_1670511531792', 5, 66);
INSERT INTO public.users VALUES (149, 'user_1670511536078', 2, 154);
INSERT INTO public.users VALUES (148, 'user_1670511536079', 5, 659);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 151, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- PostgreSQL database dump complete
--

